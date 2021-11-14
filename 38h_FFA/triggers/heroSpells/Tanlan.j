
//===========================================================================
// Trigger: Tanlan
//
// set gol
//===========================================================================
function bugouqianbaocuo takes unit u returns nothing//赏金报错
local unit m=CreateUnit(GetOwningPlayer(u),'n001',0,0,0)
call UnitAddType( m, UNIT_TYPE_ANCIENT )
call SetUnitState( m, UNIT_STATE_LIFE, 1 )
call RemoveItem( UnitAddItemById(m, 'rres'))
call UnitApplyTimedLife( m, 'BTLF', 5 )
set m=null
endfunction



function Trig_Tanlan_Conditions takes nothing returns boolean
local integer i
local integer n
local unit u=GetTriggerUnit()
local integer level=GetUnitAbilityLevel(u,'A072')
    if  GetSpellAbilityId() == 'A072' then
    set n=GetPlayerState(GetTriggerPlayer(), PLAYER_STATE_RESOURCE_GOLD)
    set i=R2I(n*0.8-200*level)
       if i>0 then
       set u=null
       return true
       else 
       call UnitRemoveAbility( u, 'A072' )
       call UnitAddAbility( u, 'A072' )
       call SetUnitAbilityLevel( u, 'A072',level)
       call bugouqianbaocuo(u)
       set u=null
       return false
       endif
    endif
set u=null
return false
endfunction

function Trig_Tanlan_Actions takes nothing returns nothing
local unit u=GetTriggerUnit()
local group g
local player p=GetOwningPlayer(u)
local unit t
local integer level=GetUnitAbilityLevel(u,'A072')
local real at=0.3+0.1*level
local real r
local integer gol=GetPlayerState(p, PLAYER_STATE_RESOURCE_GOLD)
local integer tgl
local player tp
local real x=GetSpellTargetX()
local real y=GetSpellTargetY()
local integer w=0
local real far=300+100*level
call SetPlayerState(p,PLAYER_STATE_RESOURCE_GOLD,R2I(0.8*gol-200*level))
  set g=CreateGroup()
  call GroupEnumUnitsInRange(g,x,y,far,null)
   
  loop
  set t=FirstOfGroup(g)
  exitwhen t==null
    if IsUnitEnemy(t, p)==true and GetUnitState(t, UNIT_STATE_LIFE) > 0.00 and IsUnitType(t, UNIT_TYPE_MECHANICAL) ==false  and IsUnitType(t, UNIT_TYPE_GIANT) == false and GetUnitAbilityLevel(t,'Aloc')==0 then
    set tp=GetOwningPlayer(t)
    set tgl=GetPlayerState(tp, PLAYER_STATE_RESOURCE_GOLD)
    set r=(gol-tgl)*at
    call DestroyEffect( AddSpecialEffectTarget("Abilities\\Spells\\Items\\ResourceItems\\ResourceEffectTarget.mdl", t, "origin") )
    call DestroyEffect( AddSpecialEffectTarget("Abilities\\Spells\\Other\\Transmute\\PileofGold.mdl", t, "origin") )
    call UnitDamageTarget( u, t, r, true, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
        if r<200*level and IsUnitType(t, UNIT_TYPE_HERO) and IsUnitIllusion(t) == false then
        call SetPlayerState(tp,PLAYER_STATE_RESOURCE_GOLD,R2I((1-0.08*level)*tgl))
        call DestroyEffect( AddSpecialEffectTarget("UI\\Feedback\\GoldCredit\\GoldCredit.mdl", t, "overhead") )
        set gol=R2I(gol+(0.08*level)*tgl)
        call SetPlayerState(p,PLAYER_STATE_RESOURCE_GOLD,gol)
        endif
    endif
  call GroupRemoveUnit(g,t)
  set t=null
  endloop
  call DestroyGroup(g)

loop
exitwhen w>6+3*level
set w=w+1
call DestroyEffect( AddSpecialEffect("war3mapImported\\TheHolyBomb.mdx", x+GetRandomReal(-1*far,far), y+GetRandomReal(-1*far,far)) )
endloop



set u=null
set g=null
set p=null
set t=null
set tp=null
endfunction

//===========================================================================
function InitTrig_Tanlan takes nothing returns nothing
    set gg_trg_Tanlan = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_Tanlan, Condition( function Trig_Tanlan_Conditions ) )
    call TriggerAddAction( gg_trg_Tanlan, function Trig_Tanlan_Actions )
endfunction
