
//===========================================================================
// Trigger: attackwithfengkuang
//===========================================================================
function Trig_attackwithfengkuang_Conditions takes nothing returns boolean
    return IsUnitEnemy(GetEventTargetUnit(), GetTriggerPlayer()) == true 
endfunction


function attackattack takes nothing returns nothing
call IssueTargetOrderById( GetEnumUnit(), 851983, LoadUnitHandle(udg_Hash1,GetHandleId(gg_trg_attackwithfengkuang),1) )
endfunction


function Trig_attackwithfengkuang_Actions takes nothing returns nothing
call SaveUnitHandle(udg_Hash1,GetHandleId(gg_trg_attackwithfengkuang),1,GetEventTargetUnit())
call ForGroup(LoadGroupHandle(udg_Hash1,GetHandleId(gg_trg_fengkuangshalu),2),function attackattack)
endfunction

//===========================================================================
function InitTrig_attackwithfengkuang takes nothing returns nothing
    set gg_trg_attackwithfengkuang = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_attackwithfengkuang, Condition( function Trig_attackwithfengkuang_Conditions ) )
    call TriggerAddAction( gg_trg_attackwithfengkuang, function Trig_attackwithfengkuang_Actions )
endfunction
