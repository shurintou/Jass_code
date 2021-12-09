
//===========================================================================
// Trigger: chaoqiangstrong
//
// 攻击目标保存于该触发的索引中
// call SaveInteger(udg_Hash1,GetHandleId(gg_trg_chaoqiangstrong),4,1)//已攻击次数,大于则删除BUFF
//===========================================================================
function Trig_chaoqiangstrong_Conditions takes nothing returns boolean
    if IsUnitEnemy(GetEventTargetUnit(), GetTriggerPlayer()) == true  then
    call EnableTrigger( gg_trg_panduanchaoqiang )
    return true    
    endif
    call DisableTrigger( gg_trg_panduanchaoqiang )
    return false
endfunction

function Trig_chaoqiangstrong_Actions takes nothing returns nothing
call SaveUnitHandle(udg_Hash1,GetHandleId(gg_trg_chaoqiangstrong),2,GetEventTargetUnit())
endfunction

//===========================================================================
function InitTrig_chaoqiangstrong takes nothing returns nothing
    set gg_trg_chaoqiangstrong = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_chaoqiangstrong, Condition( function Trig_chaoqiangstrong_Conditions ) )
    call TriggerAddAction( gg_trg_chaoqiangstrong, function Trig_chaoqiangstrong_Actions )
endfunction
