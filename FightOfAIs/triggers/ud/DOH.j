
//===========================================================================
// Trigger: DOH
//===========================================================================
function Trig_DOH_Conditions takes nothing returns boolean
    local unit u= GetTriggerUnit()
    local real h=GetEventDamage()
    local integer i = GetConvertedPlayerId( GetTriggerPlayer() )
    local integer g = R2I(h * 100/ GetUnitState(u, UNIT_STATE_MAX_LIFE))
    call SetUnitState( u, UNIT_STATE_LIFE, GetUnitState(u, UNIT_STATE_LIFE)+(0.15*h*GetUnitAbilityLevel(u, 'A0AK')) )
    set udg_Chaoxi[i] = udg_Chaoxi[i] + g
    set u=null
    return false
endfunction



//===========================================================================
function InitTrig_DOH takes nothing returns nothing
    set gg_trg_DOH = CreateTrigger(  )
    call DisableTrigger( gg_trg_DOH )
    call TriggerAddCondition( gg_trg_DOH, Condition( function Trig_DOH_Conditions ) )
endfunction
