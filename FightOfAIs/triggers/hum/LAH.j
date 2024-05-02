
//===========================================================================
// Trigger: LAH
//===========================================================================
function Trig_LAH_Conditions takes nothing returns boolean
    local unit u=GetTriggerUnit()
    local integer i=GetConvertedPlayerId(GetTriggerPlayer())
    local real h=GetEventDamage()
    local unit t=GetEventDamageSource()
    
    
    if GetUnitState(udg_SpellTarget[i], UNIT_STATE_LIFE)>0 then
        if u==t then
            if GetUnitState(u, UNIT_STATE_LIFE)<h then
                call SetUnitState( u, UNIT_STATE_LIFE, 5+h)
                call SetUnitAnimationByIndex( u, 42 )
                call KillUnit( u )
                call SetUnitAnimationByIndex( u, 42 )
            endif
        else
            call SetUnitState( u, UNIT_STATE_LIFE, GetUnitState(u, UNIT_STATE_LIFE)+h)
            if IsUnitType(t, UNIT_TYPE_HERO) == true then
                call AddHeroXP( t, R2I(0.08*h), true )
            endif
            call UnitDamageTarget( t, udg_SpellTarget[i], 0.3*h, true, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
            call UnitDamageTarget( u, u, 0.7*h, true, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
        endif
    else
        if IsUnitType(t, UNIT_TYPE_HERO) == true and u!=t then
            call AddHeroXP( t, R2I(0.15*h), true )
        endif
        if GetUnitState(u, UNIT_STATE_LIFE)<h then
            call SetUnitState( u, UNIT_STATE_LIFE, 5+h)
            call SetUnitAnimationByIndex( u, 42 )
            call KillUnit( u )
            call SetUnitAnimationByIndex( u, 42 )
        endif
    endif
    
    set t=null
    set u=null
    return false
endfunction



//===========================================================================
function InitTrig_LAH takes nothing returns nothing
    set gg_trg_LAH = CreateTrigger(  )
    call DisableTrigger( gg_trg_LAH )
    call TriggerAddCondition( gg_trg_LAH, Condition( function Trig_LAH_Conditions ) )
endfunction
