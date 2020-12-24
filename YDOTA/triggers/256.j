
//===========================================================================
// Trigger: 未命名触发器 256
//===========================================================================
function Trig_256_Actions takes nothing returns nothing
    call CreateMultiboardBJ( 4, 12, "TRIGSTR_3919" )
    call MultiboardSetItemsStyle( bj_lastCreatedMultiboard, true, false )
    call MultiboardSetItemValueBJ( GetLastCreatedMultiboard(), 1, 2, ( "|cffff0303" + ( GetPlayerName(Player(0)) + "|r " ) ) )
    call MultiboardSetItemValueBJ( GetLastCreatedMultiboard(), 1, 3, ( "|cff0042ff" + ( GetPlayerName(Player(1)) + "|r " ) ) )
    call MultiboardSetItemValueBJ( GetLastCreatedMultiboard(), 1, 4, ( "|cff1ce6b9" + ( GetPlayerName(Player(2)) + "|r " ) ) )
    call MultiboardSetItemValueBJ( GetLastCreatedMultiboard(), 1, 5, ( "|cff540081" + ( GetPlayerName(Player(3)) + "|r " ) ) )
    call MultiboardSetItemValueBJ( GetLastCreatedMultiboard(), 1, 6, ( "|c00fffc01" + ( GetPlayerName(Player(4)) + "|r " ) ) )
    call MultiboardSetItemValueBJ( GetLastCreatedMultiboard(), 1, 7, ( "|cfffeba0e" + ( GetPlayerName(Player(5)) + "|r " ) ) )
    call MultiboardSetItemValueBJ( GetLastCreatedMultiboard(), 1, 8, ( "|cff20c000" + ( GetPlayerName(Player(6)) + "|r " ) ) )
    call MultiboardSetItemValueBJ( GetLastCreatedMultiboard(), 1, 9, ( "|cffd55bb0" + ( GetPlayerName(Player(7)) + "|r " ) ) )
    call MultiboardSetItemValueBJ( GetLastCreatedMultiboard(), 1, 10, ( "|cff959697" + ( GetPlayerName(Player(8)) + "|r " ) ) )
    call MultiboardSetItemValueBJ( GetLastCreatedMultiboard(), 1, 11, ( "|cff7ebff1" + ( GetPlayerName(Player(9)) + "|r " ) ) )
    call MultiboardSetItemValueBJ( GetLastCreatedMultiboard(), 1, 12, "TRIGSTR_3929" )
    call MultiboardSetItemValueBJ( GetLastCreatedMultiboard(), 2, 1, ( "|cffff0303" + ( "杀人数" + "|r " ) ) )
    call MultiboardSetItemValueBJ( GetLastCreatedMultiboard(), 3, 1, ( "|cfffeba0e" + ( "单位数" + "|r " ) ) )
    call MultiboardSetItemValueBJ( GetLastCreatedMultiboard(), 4, 1, ( "|cff1ce6b9" + ( "反补数" + "|r " ) ) )
endfunction

//===========================================================================
function InitTrig_256 takes nothing returns nothing
    set gg_trg_256 = CreateTrigger(  )
    call TriggerRegisterTimerEventSingle( gg_trg_256, 0.50 )
    call TriggerAddAction( gg_trg_256, function Trig_256_Actions )
endfunction
