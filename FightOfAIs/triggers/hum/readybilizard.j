
//===========================================================================
// Trigger: readybilizard
//===========================================================================


function Trig_readybilizard_Conditions takes nothing returns boolean
    local unit u=GetTriggerUnit()
    local real r
    local real n
    if  GetSpellAbilityId()=='AHmt' then
        set r=GetUnitState(u, UNIT_STATE_LIFE)
        set n=GetUnitState(u, UNIT_STATE_MANA)
        call SetUnitState( u, UNIT_STATE_LIFE,r+n)
        if GetUnitAbilityLevel(u,'B01T')==0 then
            call SetUnitState( u, UNIT_STATE_MANA,n-(GetUnitState(u, UNIT_STATE_MAX_LIFE)-r))
        endif
    endif
    set u=null
    return false
endfunction


//===========================================================================
function InitTrig_readybilizard takes nothing returns nothing
    set gg_trg_readybilizard = CreateTrigger(  )
    call DisableTrigger( gg_trg_readybilizard )
    call TriggerAddCondition( gg_trg_readybilizard, Condition( function Trig_readybilizard_Conditions ) )
endfunction
