
//===========================================================================
// Trigger: TTH
//===========================================================================
function Trig_TTH_Conditions takes nothing returns boolean
    local unit u=GetTriggerUnit()
    
    if GetEventDamageSource()==udg_SpellTarget[GetConvertedPlayerId(GetTriggerPlayer())] then
        call SetUnitState( u, UNIT_STATE_LIFE,GetUnitState(u, UNIT_STATE_LIFE)+GetEventDamage())
    else
        if GetRandomInt(1,100)<25+GetHeroLevel(u) then
            call SetUnitState( u, UNIT_STATE_LIFE,GetUnitState(u, UNIT_STATE_LIFE)+0.5*GetEventDamage())
        endif
    endif
    
    set u=null
    return false
endfunction



//===========================================================================
function InitTrig_TTH takes nothing returns nothing
    set gg_trg_TTH = CreateTrigger(  )
    call DisableTrigger( gg_trg_TTH )
    call TriggerAddCondition( gg_trg_TTH, Condition( function Trig_TTH_Conditions ) )
endfunction
