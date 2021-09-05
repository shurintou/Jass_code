
//===========================================================================
// Trigger: AngryElec
//
// set udg_lsu=GetTriggerUnit()
// call ForGroup(udg_CheckHpGroup,function angryact)
// function angryact takes nothing returns nothing
// local unit u=GetEnumUnit()
// local unit m/                                             //////////////////丢视野问题可能会导致没有伤害
// local unit n
// local player p=GetOwningPlayer(udg_lsu)
// local real x
// local real y
// if IsUnitEnemy(u, p) == true  then
// set x=GetUnitX(u)
// set y=GetUnitY(u)
// set n=CreateUnit(p,'echm',x,y,0)
// call UnitApplyTimedLife( n, 'BTLF', 1.3 )
// if IsUnitVisible(u, p) == true then
// set m=CreateUnit(p,'n001',0,0,0)
// call SetUnitScale( m, 1.4, 1.4, 1.4 )
// call UnitAddAbility( m, 'AUdd' )
// call SetUnitAbilityLevel( m, 'AUdd',GetUnitAbilityLevel(udg_lsu, 'A06X')  )
// call UnitApplyTimedLife( m, 'BTLF', 10 )
// call IssuePointOrderById( m, 852221,x , y )
// call IssueTargetOrderById( n, 851983, u )
// call UnitDamageTarget( udg_lsu, u, 140+110*GetUnitAbilityLevel(udg_lsu, 'A06Y'), true, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
// endif
// endif
// set u=null
// set m=null
// set n=null
// set p=null
// endfunction
//===========================================================================
function Trig_AngryElec_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A06Y' 
endfunction





function Trig_AngryElec_Actions takes nothing returns nothing
local group g=CreateGroup()
local unit u=GetSpellAbilityUnit()
local unit t
local player p=GetOwningPlayer(u)
local integer level=GetUnitAbilityLevel(u,'A06Y')
local integer ll=GetUnitAbilityLevel(u, 'A06X')
local real r=140+110*level
local unit m
local unit n
local real x
local real y

set g=GetUnitsInRectMatching(GetPlayableMapRect(),null)
loop
set t=FirstOfGroup(g)
exitwhen t==null
    if IsUnitEnemy(t, p) and IsUnitType(t, UNIT_TYPE_HERO) and GetUnitState(t, UNIT_STATE_LIFE)>0 and IsUnitIllusion(t) == false and GetUnitTypeId(t)!='Hdgo'  then
    set x=GetUnitX(t)
    set y=GetUnitY(t)
    set n=CreateUnit(p,'echm',x,y,0)
    call UnitApplyTimedLife( n, 'BTLF', 1.3 )
    set m=CreateUnit(p,'n001',0,0,0)
    call SetUnitScale( m, 1.4, 1.4, 1.4 )
    call UnitAddAbility( m, 'AUdd' )
    call SetUnitAbilityLevel( m, 'AUdd',ll  )
    call UnitApplyTimedLife( m, 'BTLF', 10 )
    call IssuePointOrderById( m, 852221,x , y )
    call IssueTargetOrderById( n, 851983, t )
        if IsUnitVisible(t, p) then
        call UnitDamageTarget( u, t, r, true, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
           if udg_WeatherN==1 then
           call UnitDamageTarget( u, t, 200, true, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
           endif
        endif
    endif
  call GroupRemoveUnit(g,t)
  set t=null
  endloop
  call DestroyGroup(g)

set g=null
set u=null
set m=null
set n=null
set t=null
set p=null
endfunction

//===========================================================================
function InitTrig_AngryElec takes nothing returns nothing
    set gg_trg_AngryElec = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_AngryElec, Condition( function Trig_AngryElec_Conditions ) )
    call TriggerAddAction( gg_trg_AngryElec, function Trig_AngryElec_Actions )
endfunction
