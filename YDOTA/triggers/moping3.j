
//===========================================================================
// Trigger: moping3
//===========================================================================
function Trig_moping3_Conditions takes nothing returns boolean
    if ( not ( GetItemTypeId(GetManipulatedItem()) == 'k3m1' ) ) then
        return false
    endif
    return true
endfunction

function Trig_moping3_Actions takes nothing returns nothing
    call RemoveItem( GetManipulatedItem() )
    call UnitAddItemByIdSwapped( 'ktrm', GetManipulatingUnit() )
endfunction

//===========================================================================
function InitTrig_moping3 takes nothing returns nothing
    set gg_trg_moping3 = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_moping3, EVENT_PLAYER_UNIT_USE_ITEM )
    call TriggerAddCondition( gg_trg_moping3, Condition( function Trig_moping3_Conditions ) )
    call TriggerAddAction( gg_trg_moping3, function Trig_moping3_Actions )
endfunction
