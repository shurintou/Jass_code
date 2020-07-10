
//===========================================================================
// Trigger: 未命名触发器 335
//===========================================================================
function Trig_335_Conditions takes nothing returns boolean
    if ( not ( GetItemTypeId(GetManipulatedItem()) == 'ktrm' ) ) then
        return false
    endif
    return true
endfunction

function Trig_335_Actions takes nothing returns nothing
    call RemoveItem( GetManipulatedItem() )
    call UnitAddItemByIdSwapped( 'k3m3', GetManipulatingUnit() )
endfunction

//===========================================================================
function InitTrig_335 takes nothing returns nothing
    set gg_trg_335 = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_335, EVENT_PLAYER_UNIT_USE_ITEM )
    call TriggerAddCondition( gg_trg_335, Condition( function Trig_335_Conditions ) )
    call TriggerAddAction( gg_trg_335, function Trig_335_Actions )
endfunction
