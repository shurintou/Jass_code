
//===========================================================================
// Trigger: 未命名触发器 089
//===========================================================================
function Trig_089_Actions takes nothing returns nothing
    call ShareEverythingWithTeam( Player(8) )
endfunction

//===========================================================================
function InitTrig_089 takes nothing returns nothing
    set gg_trg_089 = CreateTrigger(  )
    call TriggerRegisterPlayerEventLeave( gg_trg_089, Player(8) )
    call TriggerAddAction( gg_trg_089, function Trig_089_Actions )
endfunction
