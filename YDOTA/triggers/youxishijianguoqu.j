
//===========================================================================
// Trigger: youxishijianguoqu
//===========================================================================
function Trig_youxishijianguoqu_Actions takes nothing returns nothing
    call DisplayTimedTextToForce( GetPlayersAll(), 30, "TRIGSTR_3216" )
    call DisplayTimedTextToForce( GetPlayersAll(), 30, "TRIGSTR_3963" )
    call DisplayTimedTextToForce( GetPlayersAll(), 30, "TRIGSTR_3964" )
    call DisableTrigger( gg_trg_shili1deyanshen )
    call DisableTrigger( gg_trg_shili2deyanshen )
    call EnableTrigger( gg_trg_shili2222 )
    call EnableTrigger( gg_trg_shili1111 )
endfunction

//===========================================================================
function InitTrig_youxishijianguoqu takes nothing returns nothing
    set gg_trg_youxishijianguoqu = CreateTrigger(  )
    call TriggerRegisterTimerEventSingle( gg_trg_youxishijianguoqu, 600.00 )
    call TriggerAddAction( gg_trg_youxishijianguoqu, function Trig_youxishijianguoqu_Actions )
endfunction
