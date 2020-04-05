
//===========================================================================
// Trigger: 未命名触发器 253
//===========================================================================
function Trig_253_Conditions takes nothing returns boolean
    if ( not ( IsUnitAlly(GetAttacker(), GetOwningPlayer(GetAttackedUnitBJ())) == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_253_Func001C takes nothing returns boolean
    if ( not ( GetUnitLifePercent(GetAttackedUnitBJ()) >= 20.00 ) ) then
        return false
    endif
    return true
endfunction

function Trig_253_Actions takes nothing returns nothing
    if ( Trig_253_Func001C() ) then
        call IssueImmediateOrder( GetAttacker(), "stop" )
    else
        return
    endif
endfunction

//===========================================================================
function InitTrig_253 takes nothing returns nothing
    set gg_trg_253 = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_253, EVENT_PLAYER_UNIT_ATTACKED )
    call TriggerAddCondition( gg_trg_253, Condition( function Trig_253_Conditions ) )
    call TriggerAddAction( gg_trg_253, function Trig_253_Actions )
endfunction
