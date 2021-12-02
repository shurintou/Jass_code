
//===========================================================================
// Trigger: siwangsiwang
//===========================================================================
function Trig_siwangsiwang_Conditions takes nothing returns boolean
 return   GetUnitTypeId(GetTriggerUnit())=='O00D'
endfunction

function Trig_siwangsiwang_Actions takes nothing returns nothing
call GroupRemoveUnit( LoadGroupHandle(udg_Hash1,GetHandleId(gg_trg_fengkuangshalu),2), GetTriggerUnit() )
call DisableTrigger( gg_trg_attackwithfengkuang )
call DisableTrigger( gg_trg_walkaournd )
endfunction

//===========================================================================
function InitTrig_siwangsiwang takes nothing returns nothing
    set gg_trg_siwangsiwang = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_siwangsiwang, Condition( function Trig_siwangsiwang_Conditions ) )
    call TriggerAddAction( gg_trg_siwangsiwang, function Trig_siwangsiwang_Actions )
endfunction
