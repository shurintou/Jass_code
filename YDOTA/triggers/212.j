
//===========================================================================
// Trigger: 未命名触发器 212
//===========================================================================
function Trig_212_Conditions takes nothing returns boolean
    if ( not ( GetOwningPlayer(GetTriggerUnit()) == Player(6) ) ) then
        return false
    endif
    if ( not ( IsUnitType(GetTriggerUnit(), UNIT_TYPE_HERO) == true ) ) then
        return false
    endif
    if ( not ( GetTriggerPlayer() == Player(6) ) ) then
        return false
    endif
    return true
endfunction

function Trig_212_Actions takes nothing returns nothing
    call DisplayTextToForce( bj_FORCE_PLAYER[6], ( "|c00fffc01" + ( "当前该英雄的移动速度是" + ( R2S(GetUnitMoveSpeed(GetTriggerUnit())) + "|r" ) ) ) )
    call TriggerSleepAction( 0.01 )
    call DisableTrigger( GetTriggeringTrigger() )
endfunction

//===========================================================================
function InitTrig_212 takes nothing returns nothing
    set gg_trg_212 = CreateTrigger(  )
    call TriggerRegisterPlayerChatEvent( gg_trg_212, Player(6), "-ms", true )
    call TriggerRegisterPlayerSelectionEventBJ( gg_trg_212, Player(6), true )
    call TriggerAddCondition( gg_trg_212, Condition( function Trig_212_Conditions ) )
    call TriggerAddAction( gg_trg_212, function Trig_212_Actions )
endfunction
