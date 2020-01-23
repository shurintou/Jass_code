
//===========================================================================
// Trigger: 未命名触发器 204
//===========================================================================
function Trig_204_Conditions takes nothing returns boolean
    if ( not ( GetOwningPlayer(GetTriggerUnit()) == Player(2) ) ) then
        return false
    endif
    if ( not ( IsUnitType(GetTriggerUnit(), UNIT_TYPE_HERO) == true ) ) then
        return false
    endif
    if ( not ( GetTriggerPlayer() == Player(2) ) ) then
        return false
    endif
    return true
endfunction

function Trig_204_Actions takes nothing returns nothing
    call DisplayTextToForce( bj_FORCE_PLAYER[2], ( "|c00fffc01" + ( "当前该英雄的移动速度是" + ( R2S(GetUnitMoveSpeed(GetTriggerUnit())) + "|r" ) ) ) )
    call TriggerSleepAction( 0.01 )
    call DisableTrigger( GetTriggeringTrigger() )
endfunction

//===========================================================================
function InitTrig_204 takes nothing returns nothing
    set gg_trg_204 = CreateTrigger(  )
    call TriggerRegisterPlayerChatEvent( gg_trg_204, Player(2), "-ms", true )
    call TriggerRegisterPlayerSelectionEventBJ( gg_trg_204, Player(2), true )
    call TriggerAddCondition( gg_trg_204, Condition( function Trig_204_Conditions ) )
    call TriggerAddAction( gg_trg_204, function Trig_204_Actions )
endfunction
