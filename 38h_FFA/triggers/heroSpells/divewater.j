
//===========================================================================
// Trigger: divewater
//
// EVENT_UNIT_SPELL_CHANNEL gg_trg_divewater
//===========================================================================
function Trig_divewater_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A081' and GetUnitAbilityLevel(GetTriggerUnit(),'A082')==0
endfunction

function Trig_divewater_Actions takes nothing returns nothing
    local unit u=GetTriggerUnit()
    local location l=GetUnitLoc(u)
    local real r=GetLocationZ(l)
    if r>295 then
    //call PlaySoundBJ( gg_snd_Error )
    call IssueImmediateOrderById( u, 851972 )
    //call DisplayTextToPlayer( GetTriggerPlayer(), 0, 0, "|cfffeba0e必须在有水的地方才能潜水|r" )
    call RemoveItem( UnitAddItemById(u, 'I03P'))
    call SetUnitState( u, UNIT_STATE_MANA, GetUnitState(u, UNIT_STATE_MANA)+10 )
    endif 
    call RemoveLocation(l)
    set l=null
    set u=null
endfunction

//===========================================================================
function InitTrig_divewater takes nothing returns nothing
    set gg_trg_divewater = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_divewater, Condition( function Trig_divewater_Conditions ) )
    call TriggerAddAction( gg_trg_divewater, function Trig_divewater_Actions )
endfunction
