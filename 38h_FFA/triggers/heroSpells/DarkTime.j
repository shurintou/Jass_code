
//===========================================================================
// Trigger: DarkTime
//===========================================================================
function Trig_DarkTime_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A05J' 
endfunction

function Trig_DarkTime_Actions takes nothing returns nothing
    call CinematicFadeBJ( bj_CINEFADETYPE_FADEOUTIN, 5.00, "ReplaceableTextures\\CameraMasks\\Black_mask.blp", 0, 0, 0, 0 )
endfunction

//===========================================================================
function InitTrig_DarkTime takes nothing returns nothing
    set gg_trg_DarkTime = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_DarkTime, Condition( function Trig_DarkTime_Conditions ) )
    call TriggerAddAction( gg_trg_DarkTime, function Trig_DarkTime_Actions )
endfunction
