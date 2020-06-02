
//===========================================================================
// Trigger: shasi
//===========================================================================
function Trig_shasi_Conditions takes nothing returns boolean
    if ( not ( IsUnitType(GetKillingUnitBJ(), UNIT_TYPE_STRUCTURE) == false ) ) then
        return false
    endif
    if ( not ( GetUnitTypeId(GetDyingUnit()) == 'n009' ) ) then
        return false
    endif
    return true
endfunction

function Trig_shasi_Func001Func001001 takes nothing returns boolean
    return ( GetOwningPlayer(GetKillingUnitBJ()) == Player(10) )
endfunction

function Trig_shasi_Func001Func001002 takes nothing returns boolean
    return ( GetOwningPlayer(GetKillingUnitBJ()) == Player(11) )
endfunction

function Trig_shasi_Func001C takes nothing returns boolean
    if ( not GetBooleanOr( Trig_shasi_Func001Func001001(), Trig_shasi_Func001Func001002() ) ) then
        return false
    endif
    return true
endfunction

function Trig_shasi_Func002C takes nothing returns boolean
    if ( not ( GetOwningPlayer(GetKillingUnitBJ()) == Player(9) ) ) then
        return false
    endif
    return true
endfunction

function Trig_shasi_Func003C takes nothing returns boolean
    if ( not ( GetOwningPlayer(GetKillingUnitBJ()) == Player(8) ) ) then
        return false
    endif
    return true
endfunction

function Trig_shasi_Func004C takes nothing returns boolean
    if ( not ( GetOwningPlayer(GetKillingUnitBJ()) == Player(7) ) ) then
        return false
    endif
    return true
endfunction

function Trig_shasi_Func005C takes nothing returns boolean
    if ( not ( GetOwningPlayer(GetKillingUnitBJ()) == Player(6) ) ) then
        return false
    endif
    return true
endfunction

function Trig_shasi_Func006C takes nothing returns boolean
    if ( not ( GetOwningPlayer(GetKillingUnitBJ()) == Player(5) ) ) then
        return false
    endif
    return true
endfunction

function Trig_shasi_Func007C takes nothing returns boolean
    if ( not ( GetOwningPlayer(GetKillingUnitBJ()) == Player(4) ) ) then
        return false
    endif
    return true
endfunction

function Trig_shasi_Func008C takes nothing returns boolean
    if ( not ( GetOwningPlayer(GetKillingUnitBJ()) == Player(3) ) ) then
        return false
    endif
    return true
endfunction

function Trig_shasi_Func009C takes nothing returns boolean
    if ( not ( GetOwningPlayer(GetKillingUnitBJ()) == Player(2) ) ) then
        return false
    endif
    return true
endfunction

function Trig_shasi_Func010C takes nothing returns boolean
    if ( not ( GetOwningPlayer(GetKillingUnitBJ()) == Player(1) ) ) then
        return false
    endif
    return true
endfunction

function Trig_shasi_Func011C takes nothing returns boolean
    if ( not ( GetOwningPlayer(GetKillingUnitBJ()) == Player(0) ) ) then
        return false
    endif
    return true
endfunction

function Trig_shasi_Actions takes nothing returns nothing
    if ( Trig_shasi_Func001C() ) then
        call DisplayTimedTextToForce( GetPlayersAll(), 30, "TRIGSTR_3186" )
    else
    endif
    if ( Trig_shasi_Func002C() ) then
        call AdjustPlayerStateBJ( 350, Player(5), PLAYER_STATE_RESOURCE_GOLD )
        call AdjustPlayerStateBJ( 350, Player(6), PLAYER_STATE_RESOURCE_GOLD )
        call AdjustPlayerStateBJ( 350, Player(7), PLAYER_STATE_RESOURCE_GOLD )
        call AdjustPlayerStateBJ( 350, Player(8), PLAYER_STATE_RESOURCE_GOLD )
        call AdjustPlayerStateBJ( 350, Player(9), PLAYER_STATE_RESOURCE_GOLD )
        call DisplayTimedTextToForce( GetPlayersAll(), 30, "TRIGSTR_3797" )
        call DisplayTimedTextToForce( GetPlayersAll(), 30, "TRIGSTR_3065" )
    else
    endif
    if ( Trig_shasi_Func003C() ) then
        call DisplayTimedTextToForce( GetPlayersAll(), 30, "TRIGSTR_3064" )
        call AdjustPlayerStateBJ( 350, Player(5), PLAYER_STATE_RESOURCE_GOLD )
        call AdjustPlayerStateBJ( 350, Player(6), PLAYER_STATE_RESOURCE_GOLD )
        call AdjustPlayerStateBJ( 350, Player(7), PLAYER_STATE_RESOURCE_GOLD )
        call AdjustPlayerStateBJ( 350, Player(8), PLAYER_STATE_RESOURCE_GOLD )
        call AdjustPlayerStateBJ( 350, Player(9), PLAYER_STATE_RESOURCE_GOLD )
        call DisplayTimedTextToForce( GetPlayersAll(), 30, "TRIGSTR_3798" )
    else
    endif
    if ( Trig_shasi_Func004C() ) then
        call DisplayTimedTextToForce( GetPlayersAll(), 30, "TRIGSTR_3063" )
        call AdjustPlayerStateBJ( 350, Player(5), PLAYER_STATE_RESOURCE_GOLD )
        call AdjustPlayerStateBJ( 350, Player(6), PLAYER_STATE_RESOURCE_GOLD )
        call AdjustPlayerStateBJ( 350, Player(7), PLAYER_STATE_RESOURCE_GOLD )
        call AdjustPlayerStateBJ( 350, Player(8), PLAYER_STATE_RESOURCE_GOLD )
        call AdjustPlayerStateBJ( 350, Player(9), PLAYER_STATE_RESOURCE_GOLD )
        call DisplayTimedTextToForce( GetPlayersAll(), 30, "TRIGSTR_3799" )
    else
    endif
    if ( Trig_shasi_Func005C() ) then
        call DisplayTimedTextToForce( GetPlayersAll(), 30, "TRIGSTR_3062" )
        call AdjustPlayerStateBJ( 350, Player(5), PLAYER_STATE_RESOURCE_GOLD )
        call AdjustPlayerStateBJ( 350, Player(6), PLAYER_STATE_RESOURCE_GOLD )
        call AdjustPlayerStateBJ( 350, Player(7), PLAYER_STATE_RESOURCE_GOLD )
        call AdjustPlayerStateBJ( 350, Player(8), PLAYER_STATE_RESOURCE_GOLD )
        call AdjustPlayerStateBJ( 350, Player(9), PLAYER_STATE_RESOURCE_GOLD )
        call DisplayTimedTextToForce( GetPlayersAll(), 30, "TRIGSTR_3800" )
    else
    endif
    if ( Trig_shasi_Func006C() ) then
        call DisplayTimedTextToForce( GetPlayersAll(), 30, "TRIGSTR_3061" )
        call AdjustPlayerStateBJ( 350, Player(5), PLAYER_STATE_RESOURCE_GOLD )
        call AdjustPlayerStateBJ( 350, Player(6), PLAYER_STATE_RESOURCE_GOLD )
        call AdjustPlayerStateBJ( 350, Player(7), PLAYER_STATE_RESOURCE_GOLD )
        call AdjustPlayerStateBJ( 350, Player(8), PLAYER_STATE_RESOURCE_GOLD )
        call AdjustPlayerStateBJ( 350, Player(9), PLAYER_STATE_RESOURCE_GOLD )
        call DisplayTimedTextToForce( GetPlayersAll(), 30, "TRIGSTR_3801" )
    else
    endif
    if ( Trig_shasi_Func007C() ) then
        call DisplayTimedTextToForce( GetPlayersAll(), 30, "TRIGSTR_3060" )
        call AdjustPlayerStateBJ( 350, Player(0), PLAYER_STATE_RESOURCE_GOLD )
        call AdjustPlayerStateBJ( 350, Player(1), PLAYER_STATE_RESOURCE_GOLD )
        call AdjustPlayerStateBJ( 350, Player(2), PLAYER_STATE_RESOURCE_GOLD )
        call AdjustPlayerStateBJ( 350, Player(3), PLAYER_STATE_RESOURCE_GOLD )
        call AdjustPlayerStateBJ( 350, Player(4), PLAYER_STATE_RESOURCE_GOLD )
        call DisplayTimedTextToForce( GetPlayersAll(), 30, "TRIGSTR_3802" )
    else
    endif
    if ( Trig_shasi_Func008C() ) then
        call DisplayTimedTextToForce( GetPlayersAll(), 30, "TRIGSTR_3059" )
        call AdjustPlayerStateBJ( 350, Player(0), PLAYER_STATE_RESOURCE_GOLD )
        call AdjustPlayerStateBJ( 350, Player(1), PLAYER_STATE_RESOURCE_GOLD )
        call AdjustPlayerStateBJ( 350, Player(2), PLAYER_STATE_RESOURCE_GOLD )
        call AdjustPlayerStateBJ( 350, Player(3), PLAYER_STATE_RESOURCE_GOLD )
        call AdjustPlayerStateBJ( 350, Player(4), PLAYER_STATE_RESOURCE_GOLD )
        call DisplayTimedTextToForce( GetPlayersAll(), 30, "TRIGSTR_3803" )
    else
    endif
    if ( Trig_shasi_Func009C() ) then
        call DisplayTimedTextToForce( GetPlayersAll(), 30, "TRIGSTR_3058" )
        call AdjustPlayerStateBJ( 350, Player(0), PLAYER_STATE_RESOURCE_GOLD )
        call AdjustPlayerStateBJ( 350, Player(1), PLAYER_STATE_RESOURCE_GOLD )
        call AdjustPlayerStateBJ( 350, Player(2), PLAYER_STATE_RESOURCE_GOLD )
        call AdjustPlayerStateBJ( 350, Player(3), PLAYER_STATE_RESOURCE_GOLD )
        call AdjustPlayerStateBJ( 350, Player(4), PLAYER_STATE_RESOURCE_GOLD )
        call DisplayTimedTextToForce( GetPlayersAll(), 30, "TRIGSTR_3804" )
    else
    endif
    if ( Trig_shasi_Func010C() ) then
        call DisplayTimedTextToForce( GetPlayersAll(), 30, "TRIGSTR_3057" )
        call AdjustPlayerStateBJ( 350, Player(0), PLAYER_STATE_RESOURCE_GOLD )
        call AdjustPlayerStateBJ( 350, Player(1), PLAYER_STATE_RESOURCE_GOLD )
        call AdjustPlayerStateBJ( 350, Player(2), PLAYER_STATE_RESOURCE_GOLD )
        call AdjustPlayerStateBJ( 350, Player(3), PLAYER_STATE_RESOURCE_GOLD )
        call AdjustPlayerStateBJ( 350, Player(4), PLAYER_STATE_RESOURCE_GOLD )
        call DisplayTimedTextToForce( GetPlayersAll(), 30, "TRIGSTR_3805" )
    else
    endif
    if ( Trig_shasi_Func011C() ) then
        call DisplayTimedTextToForce( GetPlayersAll(), 30, "TRIGSTR_3056" )
        call AdjustPlayerStateBJ( 350, Player(0), PLAYER_STATE_RESOURCE_GOLD )
        call AdjustPlayerStateBJ( 350, Player(1), PLAYER_STATE_RESOURCE_GOLD )
        call AdjustPlayerStateBJ( 350, Player(2), PLAYER_STATE_RESOURCE_GOLD )
        call AdjustPlayerStateBJ( 350, Player(3), PLAYER_STATE_RESOURCE_GOLD )
        call AdjustPlayerStateBJ( 350, Player(4), PLAYER_STATE_RESOURCE_GOLD )
        call DisplayTimedTextToForce( GetPlayersAll(), 30, "TRIGSTR_3806" )
    else
    endif
endfunction

//===========================================================================
function InitTrig_shasi takes nothing returns nothing
    set gg_trg_shasi = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_shasi, EVENT_PLAYER_UNIT_DEATH )
    call TriggerAddCondition( gg_trg_shasi, Condition( function Trig_shasi_Conditions ) )
    call TriggerAddAction( gg_trg_shasi, function Trig_shasi_Actions )
endfunction
