
//===========================================================================
// Trigger: deathknightC
//===========================================================================
function Trig_deathknightC_Conditions takes nothing returns boolean
    local unit u=GetTriggerUnit()
    local integer i
    local unit t=GetAttacker()
    
    if GetRandomInt(1,7)<=2*(1+GetUnitAbilityLevel(u,'B01T')) and GetUnitAbilityLevel(t,'Aloc')==0 then
        set i=GetHeroLevel(u)
        if IsUnitType(t, UNIT_TYPE_UNDEAD) == false then
            call SetUnitX(udg_DeathKnight,GetUnitX(u))
            call SetUnitY(udg_DeathKnight,GetUnitY(u))
            call SetUnitAbilityLevel( udg_DeathKnight, 'ACdc', R2I(i/5) )
            call IssueTargetOrderById( udg_DeathKnight, 852222, t )
            call DestroyEffect( AddSpecialEffectTarget("Abilities\\Spells\\Undead\\DeathPact\\DeathPactCaster.mdl", u, "origin") )
        endif
        call SetUnitState( u, UNIT_STATE_LIFE, GetUnitState(u, UNIT_STATE_LIFE)+3.5*(i+GetUnitLevel(t)) )
    endif
    set t=null
    set u=null
    
    return false
endfunction



//===========================================================================
function InitTrig_deathknightC takes nothing returns nothing
    set gg_trg_deathknightC = CreateTrigger(  )
    call DisableTrigger( gg_trg_deathknightC )
    call TriggerAddCondition( gg_trg_deathknightC, Condition( function Trig_deathknightC_Conditions ) )
endfunction
