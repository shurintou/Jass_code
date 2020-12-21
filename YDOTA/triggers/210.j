
//===========================================================================
// Trigger: 未命名触发器 210
//===========================================================================
function Trig_210_Conditions takes nothing returns boolean
    if ( not ( GetOwningPlayer(GetTriggerUnit()) == Player(5) ) ) then
        return false
    endif
    if ( not ( IsUnitType(GetTriggerUnit(), UNIT_TYPE_HERO) == true ) ) then
        return false
    endif
    if ( not ( GetTriggerPlayer() == Player(5) ) ) then
        return false
    endif
    return true
endfunction

function Trig_210_Actions takes nothing returns nothing
    call DisplayTextToForce( bj_FORCE_PLAYER[5], ( "|c00fffc01" + ( "当前该英雄的移动速度是" + ( R2S(GetUnitMoveSpeed(GetTriggerUnit())) + "|r" ) ) ) )
    call TriggerSleepAction( 0.01 )
    call DisableTrigger( GetTriggeringTrigger() )
endfunction

//===========================================================================
function InitTrig_210 takes nothing returns nothing
    set gg_trg_210 = CreateTrigger(  )
    call TriggerRegisterPlayerChatEvent( gg_trg_210, Player(5), "-ms", true )
    call TriggerRegisterPlayerSelectionEventBJ( gg_trg_210, Player(5), true )
    call TriggerAddCondition( gg_trg_210, Condition( function Trig_210_Conditions ) )
    call TriggerAddAction( gg_trg_210, function Trig_210_Actions )
endfunction
