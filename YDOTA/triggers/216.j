
//===========================================================================
// Trigger: 未命名触发器 216
//===========================================================================
function Trig_216_Conditions takes nothing returns boolean
    if ( not ( GetOwningPlayer(GetTriggerUnit()) == Player(8) ) ) then
        return false
    endif
    if ( not ( IsUnitType(GetTriggerUnit(), UNIT_TYPE_HERO) == true ) ) then
        return false
    endif
    if ( not ( GetTriggerPlayer() == Player(8) ) ) then
        return false
    endif
    return true
endfunction

function Trig_216_Actions takes nothing returns nothing
    call DisplayTextToForce( bj_FORCE_PLAYER[8], ( "|c00fffc01" + ( "当前该英雄的移动速度是" + ( R2S(GetUnitMoveSpeed(GetTriggerUnit())) + "|r" ) ) ) )
    call TriggerSleepAction( 0.01 )
    call DisableTrigger( GetTriggeringTrigger() )
endfunction

//===========================================================================
function InitTrig_216 takes nothing returns nothing
    set gg_trg_216 = CreateTrigger(  )
    call TriggerRegisterPlayerChatEvent( gg_trg_216, Player(8), "-ms", true )
    call TriggerRegisterPlayerSelectionEventBJ( gg_trg_216, Player(8), true )
    call TriggerAddCondition( gg_trg_216, Condition( function Trig_216_Conditions ) )
    call TriggerAddAction( gg_trg_216, function Trig_216_Actions )
endfunction
