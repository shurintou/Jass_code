
//===========================================================================
// Trigger: 未命名触发器 078
//===========================================================================
function Trig_078_Actions takes nothing returns nothing
    set udg_Zhongxin015 = GetRectCenter(gg_rct_015)
    call CreateNUnitsAtLoc( 1, 'n009', Player(PLAYER_NEUTRAL_AGGRESSIVE), udg_Zhongxin015, bj_UNIT_FACING )
    call PlaySoundBJ( gg_snd_BUTCHER )
endfunction

//===========================================================================
function InitTrig_078 takes nothing returns nothing
    set gg_trg_078 = CreateTrigger(  )
    call TriggerRegisterTimerEventPeriodic( gg_trg_078, 300.00 )
    call TriggerAddAction( gg_trg_078, function Trig_078_Actions )
endfunction
