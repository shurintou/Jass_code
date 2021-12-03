
//===========================================================================
// Trigger: FreshMeat
//===========================================================================
function Trig_FreshMeat_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A038' 
endfunction

function Trig_FreshMeat_Actions takes nothing returns nothing
    call PlaySoundBJ( gg_snd_BUTCHER )
endfunction

//===========================================================================
function InitTrig_FreshMeat takes nothing returns nothing
    set gg_trg_FreshMeat = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_FreshMeat, Condition( function Trig_FreshMeat_Conditions ) )
    call TriggerAddAction( gg_trg_FreshMeat, function Trig_FreshMeat_Actions )
endfunction
