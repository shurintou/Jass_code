
//===========================================================================
// Trigger: 未命名触发器 206
//===========================================================================
function Trig_206_Conditions takes nothing returns boolean
    if ( not ( GetOwningPlayer(GetTriggerUnit()) == Player(3) ) ) then
        return false
    endif
    if ( not ( IsUnitType(GetTriggerUnit(), UNIT_TYPE_HERO) == true ) ) then
        return false
    endif
    if ( not ( GetTriggerPlayer() == Player(3) ) ) then
        return false
    endif
    return true
endfunction

function Trig_206_Actions takes nothing returns nothing
    call DisplayTextToForce( bj_FORCE_PLAYER[3], ( "|c00fffc01" + ( "当前该英雄的移动速度是" + ( R2S(GetUnitMoveSpeed(GetTriggerUnit())) + "|r" ) ) ) )
    call TriggerSleepAction( 0.01 )
    call DisableTrigger( GetTriggeringTrigger() )
endfunction

//===========================================================================
function InitTrig_206 takes nothing returns nothing
    set gg_trg_206 = CreateTrigger(  )
    call TriggerRegisterPlayerChatEvent( gg_trg_206, Player(3), "-ms", true )
    call TriggerRegisterPlayerSelectionEventBJ( gg_trg_206, Player(3), true )
    call TriggerAddCondition( gg_trg_206, Condition( function Trig_206_Conditions ) )
    call TriggerAddAction( gg_trg_206, function Trig_206_Actions )
endfunction
