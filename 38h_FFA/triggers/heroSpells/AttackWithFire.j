
//===========================================================================
// Trigger: AttackWithFire
//===========================================================================
function Trig_AttackWithFire_Conditions takes nothing returns boolean
    return IsUnitEnemy(GetEventTargetUnit(), GetTriggerPlayer()) == true 
endfunction

function Trig_AttackWithFire_Actions takes nothing returns nothing
call IssueTargetOrderById( LoadUnitHandle(udg_Hash1,GetHandleId(GetTriggerUnit()),598), 851983, GetEventTargetUnit() )
endfunction

//===========================================================================
function InitTrig_AttackWithFire takes nothing returns nothing
    set gg_trg_AttackWithFire = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_AttackWithFire, Condition( function Trig_AttackWithFire_Conditions ) )
    call TriggerAddAction( gg_trg_AttackWithFire, function Trig_AttackWithFire_Actions )
endfunction
