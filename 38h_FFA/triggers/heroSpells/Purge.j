
//===========================================================================
// Trigger: Purge
//===========================================================================
function Trig_Purge_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A03T' 
endfunction

function UnitIsNotPurge takes nothing returns boolean 
return IsUnitIdType(GetUnitTypeId(GetFilterUnit()), UNIT_TYPE_STRUCTURE) == false and GetUnitState(GetFilterUnit(), UNIT_STATE_LIFE) > 0.00 ==true and IsUnitEnemy(GetFilterUnit(), GetOwningPlayer(udg_lsu)) == true
endfunction

function Trig_Purge_Actions takes nothing returns nothing
local unit u=GetTriggerUnit()
local real x=GetSpellTargetX()
local real y=GetSpellTargetY()
local group g=CreateGroup()
local integer level=GetUnitAbilityLevel(u,'A03T')
local boolexpr b
local unit m
local unit n=CreateUnit(GetTriggerPlayer(),'n001',x,y,0)

call UnitAddAbility( n, 'Apg2' )
call SetUnitAbilityLevel( n, 'Apg2', level )
call UnitApplyTimedLife( n, 'BTLF', 5.00 )
set b=Condition(function UnitIsNotPurge)
set udg_lsu=u
call GroupEnumUnitsInRange(g,x,y,450,b) 
loop
exitwhen IsUnitGroupEmptyBJ(g) == true
set m=FirstOfGroup(g)
call IssueTargetOrderById( n, 852111, m )
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
function InitTrig_Purge takes nothing returns nothing
    set gg_trg_Purge = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_Purge, Condition( function Trig_Purge_Conditions ) )
    call TriggerAddAction( gg_trg_Purge, function Trig_Purge_Actions )
endfunction
