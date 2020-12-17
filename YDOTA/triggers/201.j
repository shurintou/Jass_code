
//===========================================================================
// Trigger: 未命名触发器 201
//===========================================================================
function Trig_201_Actions takes nothing returns nothing
    call DisplayTextToForce( bj_FORCE_PLAYER[0], "TRIGSTR_3845" )
    call EnableTrigger( gg_trg_200 )
endfunction

//===========================================================================
function InitTrig_201 takes nothing returns nothing
    set gg_trg_201 = CreateTrigger(  )
    call TriggerRegisterPlayerChatEvent( gg_trg_201, Player(0), "-ms", true )
    call TriggerAddAction( gg_trg_201, function Trig_201_Actions )
endfunction
