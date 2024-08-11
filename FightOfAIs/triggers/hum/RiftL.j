
//===========================================================================
// Trigger: RiftL
//===========================================================================
function Trig_RiftL_Conditions takes nothing returns boolean
    local integer i=GetHeroLevel(GetTriggerUnit())
    if i <= 25  then
        call SetPlayerTechResearched(GetTriggerPlayer(), 'R005', i-10)
    endif
    return false
endfunction


//===========================================================================
function InitTrig_RiftL takes nothing returns nothing
    set gg_trg_RiftL = CreateTrigger(  )
    call DisableTrigger( gg_trg_RiftL )
    call TriggerAddCondition( gg_trg_RiftL, Condition( function Trig_RiftL_Conditions ) )
endfunction
