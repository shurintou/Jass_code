
//===========================================================================
// Trigger: haojiao
//===========================================================================
function Trig_haojiao_Actions takes nothing returns nothing
    call DisplayTextToForce( GetPlayersAll(), "TRIGSTR_2599" )
    call PlaySoundBJ( gg_snd_Warning )
    call TriggerSleepAction( 1.60 )
    call PlaySoundBJ( gg_snd_Warning )
    call TriggerSleepAction( 1.60 )
    call PlaySoundBJ( gg_snd_Warning )
endfunction

//===========================================================================
function InitTrig_haojiao takes nothing returns nothing
    set gg_trg_haojiao = CreateTrigger(  )
    call TriggerRegisterTimerEventSingle( gg_trg_haojiao, 100.00 )
    call TriggerAddAction( gg_trg_haojiao, function Trig_haojiao_Actions )
endfunction
