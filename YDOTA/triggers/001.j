
//===========================================================================
// Trigger: 未命名触发器 001
//===========================================================================
function Trig_001_Conditions takes nothing returns boolean
    if ( not ( GetTerrainTypeBJ(GetRectCenter(gg_rct_000)) == GetTerrainTypeBJ(GetRectCenter(gg_rct_011)) ) ) then
        return false
    endif
    return true
endfunction

function Trig_001_Actions takes nothing returns nothing
    call SetPlayerFlagBJ( PLAYER_STATE_GIVES_BOUNTY, true, Player(0) )
    call SetPlayerFlagBJ( PLAYER_STATE_GIVES_BOUNTY, true, Player(1) )
    call SetPlayerFlagBJ( PLAYER_STATE_GIVES_BOUNTY, true, Player(2) )
    call SetPlayerFlagBJ( PLAYER_STATE_GIVES_BOUNTY, true, Player(3) )
    call SetPlayerFlagBJ( PLAYER_STATE_GIVES_BOUNTY, true, Player(4) )
    call SetPlayerFlagBJ( PLAYER_STATE_GIVES_BOUNTY, true, Player(5) )
    call SetPlayerFlagBJ( PLAYER_STATE_GIVES_BOUNTY, true, Player(6) )
    call SetPlayerFlagBJ( PLAYER_STATE_GIVES_BOUNTY, true, Player(7) )
    call SetPlayerFlagBJ( PLAYER_STATE_GIVES_BOUNTY, true, Player(8) )
    call SetPlayerFlagBJ( PLAYER_STATE_GIVES_BOUNTY, true, Player(9) )
    call SetPlayerFlagBJ( PLAYER_STATE_GIVES_BOUNTY, true, Player(10) )
    call SetPlayerFlagBJ( PLAYER_STATE_GIVES_BOUNTY, true, Player(11) )
endfunction

//===========================================================================
function InitTrig_001 takes nothing returns nothing
    set gg_trg_001 = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_001, Condition( function Trig_001_Conditions ) )
    call TriggerAddAction( gg_trg_001, function Trig_001_Actions )
endfunction
