
//===========================================================================
// Trigger: moping2
//===========================================================================
function Trig_moping2_Conditions takes nothing returns boolean
    if ( not ( GetItemTypeId(GetManipulatedItem()) == 'k3m2' ) ) then
        return false
    endif
    return true
endfunction

function Trig_moping2_Actions takes nothing returns nothing
    call RemoveItem( GetManipulatedItem() )
    call UnitAddItemByIdSwapped( 'k3m1', GetManipulatingUnit() )
endfunction

//===========================================================================
function InitTrig_moping2 takes nothing returns nothing
    set gg_trg_moping2 = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_moping2, EVENT_PLAYER_UNIT_USE_ITEM )
    call TriggerAddCondition( gg_trg_moping2, Condition( function Trig_moping2_Conditions ) )
    call TriggerAddAction( gg_trg_moping2, function Trig_moping2_Actions )
endfunction
