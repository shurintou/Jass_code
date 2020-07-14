
//===========================================================================
// Trigger: 未命名触发器 327
//===========================================================================
function Trig_327_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A00I' ) ) then
        return false
    endif
    return true
endfunction

function Trig_327_Actions takes nothing returns nothing
    set udg_chuanciweizhi = GetSpellTargetLoc()
    set udg_chuancidanwei = GetTriggerUnit()
    call TriggerSleepAction( 0.20 )
    call SetUnitAnimation( udg_chuancidanwei, "slam" )
    call AddSpecialEffectLocBJ( udg_chuanciweizhi, "Abilities\\Spells\\NightElf\\Blink\\BlinkTarget.mdl" )
    set udg_chuancitexiao = bj_lastCreatedEffect
    call TriggerSleepAction( 0.10 )
    call SetUnitPositionLoc( udg_chuancidanwei, udg_chuanciweizhi )
    call ResetUnitAnimation( udg_chuancidanwei )
    call RemoveLocation( udg_chuanciweizhi )
    call DestroyEffect( udg_chuancitexiao )
endfunction

//===========================================================================
function InitTrig_327 takes nothing returns nothing
    set gg_trg_327 = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_327, EVENT_PLAYER_UNIT_SPELL_CAST )
    call TriggerAddCondition( gg_trg_327, Condition( function Trig_327_Conditions ) )
    call TriggerAddAction( gg_trg_327, function Trig_327_Actions )
endfunction
