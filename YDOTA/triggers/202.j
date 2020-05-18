
//===========================================================================
// Trigger: 未命名触发器 202
//===========================================================================
function Trig_202_Conditions takes nothing returns boolean
    if ( not ( GetOwningPlayer(GetTriggerUnit()) == Player(1) ) ) then
        return false
    endif
    if ( not ( IsUnitType(GetTriggerUnit(), UNIT_TYPE_HERO) == true ) ) then
        return false
    endif
    if ( not ( GetTriggerPlayer() == Player(1) ) ) then
        return false
    endif
    return true
endfunction

function Trig_202_Actions takes nothing returns nothing
    call DisplayTextToForce( bj_FORCE_PLAYER[1], ( "|c00fffc01" + ( "当前该英雄的移动速度是" + ( R2S(GetUnitMoveSpeed(GetTriggerUnit())) + "|r" ) ) ) )
    call TriggerSleepAction( 0.01 )
    call DisableTrigger( GetTriggeringTrigger() )
endfunction

//===========================================================================
function InitTrig_202 takes nothing returns nothing
    set gg_trg_202 = CreateTrigger(  )
    call TriggerRegisterPlayerChatEvent( gg_trg_202, Player(1), "-ms", true )
    call TriggerRegisterPlayerSelectionEventBJ( gg_trg_202, Player(1), true )
    call TriggerAddCondition( gg_trg_202, Condition( function Trig_202_Conditions ) )
    call TriggerAddAction( gg_trg_202, function Trig_202_Actions )
endfunction
