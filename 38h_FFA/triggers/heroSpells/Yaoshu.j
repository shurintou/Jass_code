
//===========================================================================
// Trigger: Yaoshu
//===========================================================================
function Trig_Yaoshu_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A0AK' 
endfunction



function Trig_Yaoshu_Actions takes nothing returns nothing
  local unit u=GetTriggerUnit()
  local unit m
  local unit t=CreateUnit(GetTriggerPlayer(),'n001',GetUnitX(u),GetUnitY(u),0)
  local group g=CreateGroup()
  local integer level=GetUnitAbilityLevel(u, 'A0AK')
  local player p=GetOwningPlayer(u)
  local unit zt=GetSpellTargetUnit()

call GroupEnumUnitsInRange(g,GetSpellTargetX(),GetSpellTargetY(),175+25*level,null) 
call UnitAddAbility( t, 'ANhx' )
call SetUnitAbilityLevel( t, 'ANhx', level )
call UnitApplyTimedLife( t, 'BTLF', 3 )
call IssueTargetOrderById( t, 852502, zt )
call SetUnitAbilityLevel( t, 'ANhx', level+4 )

loop
set m=FirstOfGroup(g)
exitwhen m==null
if IsUnitIdType(GetUnitTypeId(m), UNIT_TYPE_STRUCTURE) == false and GetUnitState(m, UNIT_STATE_LIFE) > 0.00 ==true and IsUnitEnemy(m,p ) == true and m!=zt then
call IssueTargetOrderById( t, 852502, m )
endif
call GroupRemoveUnit(g,m)
set m=null
endloop

call GroupClear(g)
call DestroyGroup(g)

set u=null
set p=null
set g=null
set t=null
set zt=null
set m=null
endfunction

//===========================================================================
function InitTrig_Yaoshu takes nothing returns nothing
    set gg_trg_Yaoshu = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_Yaoshu, Condition( function Trig_Yaoshu_Conditions ) )
    call TriggerAddAction( gg_trg_Yaoshu, function Trig_Yaoshu_Actions )
endfunction
