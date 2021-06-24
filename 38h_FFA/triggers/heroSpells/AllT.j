
//===========================================================================
// Trigger: AllT
//===========================================================================
function Trig_AllT_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A06O' 
endfunction

function UnitIsNotAT takes nothing returns boolean 
return IsUnitIdType(GetUnitTypeId(GetFilterUnit()), UNIT_TYPE_STRUCTURE) == false and GetUnitState(GetFilterUnit(), UNIT_STATE_LIFE) > 0.00 ==true and IsUnitEnemy(GetFilterUnit(), GetOwningPlayer(udg_lsu)) == true
endfunction 


function Trig_AllT_Actions takes nothing returns nothing
  local unit u=GetTriggerUnit()
  local unit m
  local unit t=CreateUnit(GetTriggerPlayer(),'n001',GetUnitX(u),GetUnitY(u),0)
  local group g=CreateGroup()
  local boolexpr b=Condition(function UnitIsNotAT)

set udg_lsu=u
call GroupEnumUnitsInRange(g,GetSpellTargetX(),GetSpellTargetY(),255,b) 
call UnitAddAbility( t, 'ANsb' )
call SetUnitAbilityLevel( t, 'ANsb', GetUnitAbilityLevel(u, 'A06O') )
call UnitApplyTimedLife( t, 'BTLF', 3 )
call SetUnitScale( t, 2.2, 2.2, 2.2 )
loop
exitwhen IsUnitGroupEmptyBJ(g) == true
set m=FirstOfGroup(g)
call IssueTargetOrderById( t, 852095, m )
call GroupRemoveUnit(g,m)
endloop
call GroupClear(g)
call DestroyGroup(g)
call DestroyBoolExpr(b)

set u=null
set g=null
set b=null
set t=null
set m=null
endfunction

//===========================================================================
function InitTrig_AllT takes nothing returns nothing
    set gg_trg_AllT = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_AllT, Condition( function Trig_AllT_Conditions ) )
    call TriggerAddAction( gg_trg_AllT, function Trig_AllT_Actions )
endfunction
