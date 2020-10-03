
//===========================================================================
// Trigger: moping1
//===========================================================================
function Trig_moping1_Conditions takes nothing returns boolean
    if ( not ( GetItemTypeId(GetManipulatedItem()) == 'k3m3' ) ) then
        return false
    endif
    return true
endfunction

function Trig_moping1_Actions takes nothing returns nothing
    call RemoveItem( GetManipulatedItem() )
    call UnitAddItemByIdSwapped( 'k3m2', GetManipulatingUnit() )
endfunction

//===========================================================================
function InitTrig_moping1 takes nothing returns nothing
    set gg_trg_moping1 = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_moping1, EVENT_PLAYER_UNIT_USE_ITEM )
    call TriggerAddCondition( gg_trg_moping1, Condition( function Trig_moping1_Conditions ) )
    call TriggerAddAction( gg_trg_moping1, function Trig_moping1_Actions )
endfunction
