
//===========================================================================
// Trigger: CreateItem
//===========================================================================
function Trig_CreateItem_Actions takes nothing returns nothing
    set udg_TS = GetEventPlayerChatString()
    set udg_N= debugS2I(udg_TS) 
    call SetItemPlayer( CreateItem(udg_N,-350,-280), Player(0), false ) 
endfunction

//===========================================================================
function InitTrig_CreateItem takes nothing returns nothing
    set gg_trg_CreateItem = CreateTrigger(  )
    call DisableTrigger( gg_trg_CreateItem )
    call TriggerRegisterPlayerChatEvent( gg_trg_CreateItem, Player(0), "", false )
    call TriggerAddAction( gg_trg_CreateItem, function Trig_CreateItem_Actions )
endfunction
