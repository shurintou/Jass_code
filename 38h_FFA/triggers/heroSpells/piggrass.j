
//===========================================================================
// Trigger: piggrass
//
// SPLK
//===========================================================================
function Trig_piggrass_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'AHwe' 
endfunction


function UnitIsNotgrass takes nothing returns boolean 
return IsUnitIdType(GetUnitTypeId(GetFilterUnit()), UNIT_TYPE_STRUCTURE) == false and GetUnitState(GetFilterUnit(), UNIT_STATE_LIFE) > 0.00 ==true and IsUnitEnemy(GetFilterUnit(), GetOwningPlayer(udg_lsu)) == true
endfunction






function Trig_piggrass_Actions takes nothing returns nothing
local unit u=GetTriggerUnit()
local real x=GetUnitX(u)
local real y=GetUnitY(u)
local group g=CreateGroup()
local integer level=GetUnitAbilityLevel(u,'AHwe')
local boolexpr b
local unit m
local unit n=CreateUnit(GetTriggerPlayer(),'n001',x,y,0)

call UnitAddAbility( n, 'A05V' )
call SetUnitAbilityLevel( n, 'A05V', 1+level )
call UnitAddAbility( n, 'A05W' )
call SetUnitAbilityLevel( n, 'A05W', level )
call UnitApplyTimedLife( n, 'BTLF', 7.00 )
set b=Condition(function UnitIsNotgrass)
set udg_lsu=u
call GroupEnumUnitsInRange(g,x,y,750,b) 

loop
exitwhen IsUnitGroupEmptyBJ(g) == true
set m=FirstOfGroup(g)
call IssueTargetOrderById( n, 852106, m )
call IssueTargetOrderById( n, 852662, m )
call GroupRemoveUnit(g,m)
endloop
call GroupClear(g)
call DestroyGroup(g)
call DestroyBoolExpr(b)

set u=null
set g=null
set n=null
set b=null
set m=null
endfunction

//===========================================================================
function InitTrig_piggrass takes nothing returns nothing
    set gg_trg_piggrass = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_piggrass, Condition( function Trig_piggrass_Conditions ) )
    call TriggerAddAction( gg_trg_piggrass, function Trig_piggrass_Actions )
endfunction
