
//===========================================================================
// Trigger: Akamaillusion
//
//  
//===========================================================================
function Trig_Akamaillusion_Conditions takes nothing returns boolean
    local unit u=GetTriggerUnit()
    local unit t=GetEventTargetUnit()
    local integer i=GetHeroLevel(u)
    local integer g=R2I((i-3)/7)
    
    call SetUnitAbilityLevel(u,'A019',g)
    call SetUnitAbilityLevel(u,'A01A',g)
    call SetUnitAbilityLevel(u,'Ashs',g)
    call IssueImmediateOrderById( u, 852123 )
    call IssueTargetOrderById( u, 852570, t )
    if IsUnitType(t, UNIT_TYPE_STRUCTURE) == false then
        if GetUnitAbilityLevel(t,'Bshs')>0 or RAbsBJ(GetUnitFacing(u)-GetUnitFacing(t))<=105 then
            call UnitDamageTarget( u, t, (0.5+(0.5*g))*GetHeroAgi(u, true), true, true, ATTACK_TYPE_HERO, DAMAGE_TYPE_ENHANCED, WEAPON_TYPE_WHOKNOWS )
            call DestroyEffect( AddSpecialEffectTarget("Abilities\\Spells\\Other\\Stampede\\StampedeMissileDeath.mdl", t, "chest") )
        endif
    endif
    if g!=GetUnitAbilityLevel(u,'A018') then
        call SetUnitAbilityLevel( u, 'A018', g )
        call PauseUnit( u, true )
        call PauseUnit( u, false)
    endif
    set u=null
    set t=null
    return false
endfunction



//===========================================================================
function InitTrig_Akamaillusion takes nothing returns nothing
    set gg_trg_Akamaillusion = CreateTrigger(  )
    call DisableTrigger( gg_trg_Akamaillusion)
    call TriggerAddCondition( gg_trg_Akamaillusion, Condition( function Trig_Akamaillusion_Conditions ) )
    
endfunction
