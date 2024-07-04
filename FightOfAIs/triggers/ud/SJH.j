
//===========================================================================
// Trigger: SJH
//===========================================================================
function Trig_SJH_Conditions takes nothing returns boolean
    local unit u=GetTriggerUnit()
    local integer i=GetConvertedPlayerId(GetTriggerPlayer())
    local real h=GetEventDamage()
    local unit t=GetEventDamageSource()
    
    set  udg_UGharm[i]= udg_UGharm[i]+h
    call SetUnitState( u, UNIT_STATE_LIFE, GetUnitState(u, UNIT_STATE_LIFE)+h)
    
    if IsUnitType(t, UNIT_TYPE_HERO) == true then
        set  udg_SpellTarget[i]=t
        call AddHeroXP( t, R2I(20*GetHeroLevel(u)*(h/GetUnitState(u, UNIT_STATE_MAX_LIFE))), true )
    else
        call AddHeroXP(udg_SpellTarget[i], R2I(10*GetHeroLevel(u)*(h/GetUnitState(u, UNIT_STATE_MAX_LIFE))), true )
    endif
    set t=null
    set u=null
    return false
endfunction



//===========================================================================
function InitTrig_SJH takes nothing returns nothing
    set gg_trg_SJH = CreateTrigger(  )
    call DisableTrigger( gg_trg_SJH )
    call TriggerAddCondition( gg_trg_SJH, Condition( function Trig_SJH_Conditions ) )
endfunction
