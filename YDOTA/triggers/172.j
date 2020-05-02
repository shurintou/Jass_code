
//===========================================================================
// Trigger: 未命名触发器 172
//===========================================================================
function Trig_172_Conditions takes nothing returns boolean
    if ( not ( GetItemTypeId(GetManipulatedItem()) == 'I01H' ) ) then
        return false
    endif
    return true
endfunction

function Trig_172_Func001C takes nothing returns boolean
    if ( not ( GetItemTypeId(GetItemOfTypeFromUnitBJ(GetTriggerUnit(), 'I01D')) == 'I01D' ) ) then
        return false
    endif
    if ( not ( GetItemTypeId(GetItemOfTypeFromUnitBJ(GetTriggerUnit(), 'I01F')) == 'I01F' ) ) then
        return false
    endif
    if ( not ( GetItemTypeId(GetManipulatedItem()) == 'I01H' ) ) then
        return false
    endif
    return true
endfunction

function Trig_172_Actions takes nothing returns nothing
    if ( Trig_172_Func001C() ) then
        call RemoveItem( GetItemOfTypeFromUnitBJ(GetTriggerUnit(), 'I01D') )
        call RemoveItem( GetItemOfTypeFromUnitBJ(GetTriggerUnit(), 'I01F') )
        call UnitAddItemByIdSwapped( 'ciri', GetTriggerUnit() )
    else
        call AdjustPlayerStateBJ( 300, GetOwningPlayer(GetTriggerUnit()), PLAYER_STATE_RESOURCE_GOLD )
    endif
endfunction

//===========================================================================
function InitTrig_172 takes nothing returns nothing
    set gg_trg_172 = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_172, EVENT_PLAYER_UNIT_PICKUP_ITEM )
    call TriggerAddCondition( gg_trg_172, Condition( function Trig_172_Conditions ) )
    call TriggerAddAction( gg_trg_172, function Trig_172_Actions )
endfunction
