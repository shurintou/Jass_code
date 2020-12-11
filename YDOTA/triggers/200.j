
//===========================================================================
// Trigger: 未命名触发器 200
//===========================================================================
function Trig_200_Conditions takes nothing returns boolean
    if ( not ( GetOwningPlayer(GetTriggerUnit()) == Player(0) ) ) then
        return false
    endif
    if ( not ( IsUnitType(GetTriggerUnit(), UNIT_TYPE_HERO) == true ) ) then
        return false
    endif
    if ( not ( GetTriggerPlayer() == Player(0) ) ) then
        return false
    endif
    return true
endfunction

function Trig_200_Actions takes nothing returns nothing
    call DisplayTextToForce( bj_FORCE_PLAYER[0], ( "|c00fffc01" + ( "当前该英雄的移动速度是" + ( R2S(GetUnitMoveSpeed(GetTriggerUnit())) + "|r" ) ) ) )
    call TriggerSleepAction( 0.01 )
    call DisableTrigger( GetTriggeringTrigger() )
endfunction

//===========================================================================
function InitTrig_200 takes nothing returns nothing
    set gg_trg_200 = CreateTrigger(  )
    call TriggerRegisterPlayerChatEvent( gg_trg_200, Player(0), "-ms", true )
    call TriggerRegisterPlayerSelectionEventBJ( gg_trg_200, Player(0), true )
    call TriggerAddCondition( gg_trg_200, Condition( function Trig_200_Conditions ) )
    call TriggerAddAction( gg_trg_200, function Trig_200_Actions )
endfunction
