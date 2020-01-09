
//===========================================================================
// Trigger: Nova
//===========================================================================
function Trig_Nova_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A04G' ) ) then
        return false
    endif
    return true
endfunction

function Trig_Nova_Actions takes nothing returns nothing
    set udg_Point_nova = GetSpellTargetLoc()
    set udg_Dis1 = 0
    set udg_Azhengshu = 1
    loop
        exitwhen udg_Azhengshu > 12
        set udg_Dis1 = ( udg_Dis1 + 50 )
        set udg_Bzhengshu = 1
        loop
            exitwhen udg_Bzhengshu > 6
            set udg_Angel = ( udg_Bzhengshu * 60 )
            call AddSpecialEffectLocBJ( PolarProjectionBJ(udg_Point_nova, I2R(udg_Dis1), I2R(udg_Angel)), "Abilities\\Spells\\Undead\\FrostNova\\FrostNovaTarget.mdl" )
            set udg_Novatexiao = GetLastCreatedEffectBJ()
            call DestroyEffect( udg_Novatexiao )
            set udg_Bzhengshu = udg_Bzhengshu + 1
        endloop
        set udg_Azhengshu = udg_Azhengshu + 1
    endloop
endfunction

//===========================================================================
function InitTrig_Nova takes nothing returns nothing
    set gg_trg_Nova = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_Nova, EVENT_PLAYER_UNIT_SPELL_CAST )
    call TriggerAddCondition( gg_trg_Nova, Condition( function Trig_Nova_Conditions ) )
    call TriggerAddAction( gg_trg_Nova, function Trig_Nova_Actions )
endfunction
