
//===========================================================================
// Trigger: ReduceWave
//
// 336：新加入的各种小技能
//===========================================================================
function UnitIsNotMB takes nothing returns boolean
return IsUnitEnemy(GetFilterUnit(), GetOwningPlayer(udg_lsu)) == true and ciwh(GetFilterUnit(),'wlsd')>=1
endfunction
function AddMagicBar takes nothing returns nothing
local unit u=GetEnumUnit()
local integer i=0
local integer n=0
local item e
loop
exitwhen i>=6 
set e=UnitItemInSlot(u, i)
if GetItemTypeId(e)=='wlsd' then
call DestroyEffect( AddSpecialEffectTarget("Abilities\\Spells\\Undead\\ReplenishMana\\SpiritTouchTarget.mdl", u , "origin") )
if GetItemCharges(e) >=15 then
call SetItemCharges(e,15)
else
call SetItemCharges(e,GetItemCharges(e)+1)
endif
set i=6
endif
set i=i+1
endloop

set u=null
set e=null
endfunction

function ChargeMagicBar takes unit u returns nothing
local group g=CreateGroup()
local boolexpr b=Condition(function UnitIsNotMB)

set udg_lsu=u
call GroupEnumUnitsInRange(g,GetUnitX(u),GetUnitY(u),1500,b)
call ForGroup(g,function AddMagicBar)
call GroupClear(g)
call DestroyGroup(g)
call DestroyBoolExpr(b)

set g=null
set b=null
endfunction


function ReduceAct takes unit u returns nothing
local real x=GetUnitX(u)
local real y=GetUnitY(u)
local unit m=CreateUnit(GetOwningPlayer(u),'n001',x,y,0)

call UnitAddAbility( m, 'A05C' )
call SetUnitAbilityLevel( m, 'A05C', GetUnitAbilityLevel(u, 'A05B') )
call UnitApplyTimedLife( m, 'BTLF', 2 )
call IssueImmediateOrderById( m, 852127 )
call DestroyEffect( AddSpecialEffect("Abilities\\Spells\\Orc\\EarthQuake\\EarthQuakeTarget.mdl", x, y) )
call DestroyEffect( AddSpecialEffect("Abilities\\Spells\\Other\\Volcano\\VolcanoDeath.mdl", x, y) )
call DestroyEffect( AddSpecialEffect("Abilities\\Spells\\Orc\\WarStomp\\WarStompCaster.mdl", x, y) )

set m=null
endfunction

function Trig_ReduceWave_Conditions takes nothing returns boolean//各种法球不触发小魔棒和余震
    local integer i=GetSpellAbilityId()
    
    return i != 'ANba' and i!='AEim' and i!='A01J' and i!='ANfa' and i!='A093' and i!='AHfa' and i!='A09G' and i!='Adev' and i!='A0B6'
endfunction



function Trig_ReduceWave_Actions takes nothing returns nothing
local unit u=GetTriggerUnit()
local integer m=GetHandleId(u)
local integer i=GetSpellAbilityId()
local integer n=GetConvertedPlayerId(GetTriggerPlayer())

if i==LoadInteger(udg_Hash3,m,332) or i==LoadInteger(udg_Hash3,m,333) or i==LoadInteger(udg_Hash3,m,336) or i==udg_Ability1[n] or i==udg_Ability2[n] then
if GetUnitAbilityLevel(u,'A05B') >0 then
call ReduceAct(u)
endif
call ChargeMagicBar(u)
endif

set u=null
endfunction

//===========================================================================
function InitTrig_ReduceWave takes nothing returns nothing
    set gg_trg_ReduceWave = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_ReduceWave, Condition( function Trig_ReduceWave_Conditions ) )
    call TriggerAddAction( gg_trg_ReduceWave, function Trig_ReduceWave_Actions )
endfunction
