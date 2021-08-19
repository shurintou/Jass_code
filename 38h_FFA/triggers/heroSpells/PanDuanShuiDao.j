
//===========================================================================
// Trigger: PanDuanShuiDao
//===========================================================================
function Trig_PanDuanShuiDao_Conditions takes nothing returns boolean
   local real r =GetEventDamage()
   return GetTriggerUnit() == GetEventDamageSource() and r < 5 and r>0 and GetUnitAbilityLevel(GetTriggerUnit(), 'A0AI')>0               
endfunction

function Trig_PanDuanShuiDao_Actions takes nothing returns nothing
local unit u=GetTriggerUnit()
local timer tm=LoadTimerHandle(udg_Hash1,GetHandleId(u),8304)
call SaveInteger(udg_Hash1,GetHandleId(tm),2,11-2*GetUnitAbilityLevel(u, 'A0AH') )
call UnitRemoveAbility( u, 'A009' )
call UnitRemoveAbility( u, 'A0AF' )
call DisableTrigger( GetTriggeringTrigger() )
set u=null
set tm=null
endfunction

//===========================================================================
function InitTrig_PanDuanShuiDao takes nothing returns nothing
    set gg_trg_PanDuanShuiDao = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_PanDuanShuiDao, Condition( function Trig_PanDuanShuiDao_Conditions ) )
    call TriggerAddAction( gg_trg_PanDuanShuiDao, function Trig_PanDuanShuiDao_Actions )
endfunction
