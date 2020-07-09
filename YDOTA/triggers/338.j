
//===========================================================================
// Trigger: 未命名触发器 338
//===========================================================================
function Trig_338_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A06T' ) ) then
        return false
    endif
    return true
endfunction

function Trig_338_Actions takes nothing returns nothing
    set udg_shanduotexiao = bj_lastCreatedEffect
    set udg_shanduodian = GetUnitLoc(GetTriggerUnit())
    set udg_shanduodanwei = GetTriggerUnit()
    call TriggerSleepAction( 1.10 )
    call SetUnitAnimation( udg_shanduodanwei, "channel" )
    call AddSpecialEffectLocBJ( udg_shanduodian, "Abilities\\Spells\\NightElf\\Blink\\BlinkCaster.mdl" )
    call SetUnitPositionLoc( udg_shanduodanwei, PolarProjectionBJ(udg_shanduodian, 650.00, Deg2Rad(80.00)) )
    call ResetUnitAnimation( udg_shanduodanwei )
    call RemoveLocation( udg_shanduodian )
    call DestroyEffect( udg_shanduotexiao )
endfunction

//===========================================================================
function InitTrig_338 takes nothing returns nothing
    set gg_trg_338 = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_338, EVENT_PLAYER_UNIT_SPELL_CAST )
    call TriggerAddCondition( gg_trg_338, Condition( function Trig_338_Conditions ) )
    call TriggerAddAction( gg_trg_338, function Trig_338_Actions )
endfunction
