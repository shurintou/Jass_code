
//===========================================================================
// Trigger: illusionControler
//===========================================================================
function Trig_illusionControler_Conditions takes nothing returns boolean
    local unit u=GetTriggerUnit()
    if IsUnitIllusion(u) then
        call IssuePointOrderById( u, 851983, GetUnitX(u), GetUnitY(u) )
        if IsUnitAlly(u,Player(5))==true then
            //call SetUnitColor( u, GetPlayerColor(Player(4)) )
            call SetUnitOwner( u,Player(4), true )
        else
            //call SetUnitColor( u, GetPlayerColor(Player(6)) )
            call SetUnitOwner( u,Player(6), true )
        endif
    endif
    set u=null
    return false
endfunction



//===========================================================================
function InitTrig_illusionControler takes nothing returns nothing
    set gg_trg_illusionControler = CreateTrigger(  )
    call DisableTrigger( gg_trg_illusionControler )
    call TriggerAddCondition( gg_trg_illusionControler, Condition( function Trig_illusionControler_Conditions ) )
endfunction
