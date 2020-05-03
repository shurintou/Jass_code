
//===========================================================================
// Trigger: 未命名触发器 214
//===========================================================================
function Trig_214_Conditions takes nothing returns boolean
    if ( not ( GetOwningPlayer(GetTriggerUnit()) == Player(7) ) ) then
        return false
    endif
    if ( not ( IsUnitType(GetTriggerUnit(), UNIT_TYPE_HERO) == true ) ) then
        return false
    endif
    if ( not ( GetTriggerPlayer() == Player(7) ) ) then
        return false
    endif
    return true
endfunction

function Trig_214_Actions takes nothing returns nothing
    call DisplayTextToForce( bj_FORCE_PLAYER[7], ( "|c00fffc01" + ( "当前该英雄的移动速度是" + ( R2S(GetUnitMoveSpeed(GetTriggerUnit())) + "|r" ) ) ) )
    call TriggerSleepAction( 0.01 )
    call DisableTrigger( GetTriggeringTrigger() )
endfunction

//===========================================================================
function InitTrig_214 takes nothing returns nothing
    set gg_trg_214 = CreateTrigger(  )
    call TriggerRegisterPlayerChatEvent( gg_trg_214, Player(7), "-ms", true )
    call TriggerRegisterPlayerSelectionEventBJ( gg_trg_214, Player(7), true )
    call TriggerAddCondition( gg_trg_214, Condition( function Trig_214_Conditions ) )
    call TriggerAddAction( gg_trg_214, function Trig_214_Actions )
endfunction
