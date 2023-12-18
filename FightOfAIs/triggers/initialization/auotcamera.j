
//===========================================================================
// Trigger: auotcamera
//===========================================================================
function Trig_auotcamera_Conditions takes nothing returns boolean
    if IsUnitType(GetTriggerUnit(), UNIT_TYPE_HERO) == true  then
        call SelectUnitForPlayerSingle( GetTriggerUnit(), Player(0) )
        call DestroyTrigger( GetTriggeringTrigger() )
    endif
    return false
endfunction



//===========================================================================
function InitTrig_auotcamera takes nothing returns nothing
    set gg_trg_auotcamera = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_auotcamera, EVENT_PLAYER_UNIT_ATTACKED )
    call TriggerAddCondition( gg_trg_auotcamera, Condition( function Trig_auotcamera_Conditions ) )
endfunction
