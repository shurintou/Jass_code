
//===========================================================================
// Trigger: STOP
//===========================================================================
function Trig_STOP_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A00K' ) ) then
        return false
    endif
    return true
endfunction

function Trig_STOP_Func002A takes nothing returns nothing
    call RemoveUnit( GetEnumUnit() )
endfunction

function Trig_STOP_Func003A takes nothing returns nothing
    call SetUnitPathing( GetEnumUnit(), true )
    call GroupRemoveUnitSimple( GetEnumUnit(), udg_nongminzu )
endfunction

function Trig_STOP_Actions takes nothing returns nothing
    call DisableTrigger( gg_trg_GO_AROUND )
    call ForGroupBJ( udg_xiaojinglingzu, function Trig_STOP_Func002A )
    call ForGroupBJ( udg_nongminzu, function Trig_STOP_Func003A )
    call TerrainDeformationStopBJ( udg_bo_wen, 1.00 )
endfunction

//===========================================================================
function InitTrig_STOP takes nothing returns nothing
    set gg_trg_STOP = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_STOP, EVENT_PLAYER_UNIT_SPELL_ENDCAST )
    call TriggerAddCondition( gg_trg_STOP, Condition( function Trig_STOP_Conditions ) )
    call TriggerAddAction( gg_trg_STOP, function Trig_STOP_Actions )
endfunction
