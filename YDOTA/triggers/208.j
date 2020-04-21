
//===========================================================================
// Trigger: 未命名触发器 208
//===========================================================================
function Trig_208_Conditions takes nothing returns boolean
    if ( not ( GetOwningPlayer(GetTriggerUnit()) == Player(4) ) ) then
        return false
    endif
    if ( not ( IsUnitType(GetTriggerUnit(), UNIT_TYPE_HERO) == true ) ) then
        return false
    endif
    if ( not ( GetTriggerPlayer() == Player(4) ) ) then
        return false
    endif
    return true
endfunction

function Trig_208_Actions takes nothing returns nothing
    call DisplayTextToForce( bj_FORCE_PLAYER[4], ( "|c00fffc01" + ( "当前该英雄的移动速度是" + ( R2S(GetUnitMoveSpeed(GetTriggerUnit())) + "|r" ) ) ) )
    call TriggerSleepAction( 0.01 )
    call DisableTrigger( GetTriggeringTrigger() )
endfunction

//===========================================================================
function InitTrig_208 takes nothing returns nothing
    set gg_trg_208 = CreateTrigger(  )
    call TriggerRegisterPlayerChatEvent( gg_trg_208, Player(4), "-ms", true )
    call TriggerRegisterPlayerSelectionEventBJ( gg_trg_208, Player(4), true )
    call TriggerAddCondition( gg_trg_208, Condition( function Trig_208_Conditions ) )
    call TriggerAddAction( gg_trg_208, function Trig_208_Actions )
endfunction
