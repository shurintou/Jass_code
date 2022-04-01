
//===========================================================================
// Trigger: view
//===========================================================================
function Trig_view_Func001Func002001 takes nothing returns boolean
    return ( GetEventPlayerChatString() == "-viewoff" )
endfunction

function Trig_view_Func001C takes nothing returns boolean
    if ( not ( GetEventPlayerChatString() == "-viewon" ) ) then
        return false
    endif
    return true
endfunction

function Trig_view_Actions takes nothing returns nothing
    if ( Trig_view_Func001C() ) then
        call DisplayTextToPlayer( Player(0), 0, 0, "TRIGSTR_4080" )
        call CreateFogModifierRectBJ( true, Player(0), FOG_OF_WAR_VISIBLE, GetPlayableMapRect() )
    else
        if ( Trig_view_Func001Func002001() ) then
            call DestroyFogModifier( GetLastCreatedFogModifier() )
        else
            call DoNothing(  )
        endif
    endif
endfunction

//===========================================================================
function InitTrig_view takes nothing returns nothing
    set gg_trg_view = CreateTrigger(  )
    call TriggerAddAction( gg_trg_view, function Trig_view_Actions )
endfunction
