
//===========================================================================
// Trigger: 未命名触发器 024
//===========================================================================
function Trig_024_Conditions takes nothing returns boolean
    if ( not ( GetItemTypeId(GetManipulatedItem()) == 'I01G' ) ) then
        return false
    endif
    return true
endfunction

function Trig_024_Func001C takes nothing returns boolean
    if ( not ( GetItemTypeId(GetItemOfTypeFromUnitBJ(GetTriggerUnit(), 'I01C')) == 'I01C' ) ) then
        return false
    endif
    if ( not ( GetItemTypeId(GetItemOfTypeFromUnitBJ(GetTriggerUnit(), 'I01F')) == 'I01F' ) ) then
        return false
    endif
    if ( not ( GetItemTypeId(GetManipulatedItem()) == 'I01G' ) ) then
        return false
    endif
    return true
endfunction

function Trig_024_Actions takes nothing returns nothing
    if ( Trig_024_Func001C() ) then
        call RemoveItem( GetItemOfTypeFromUnitBJ(GetTriggerUnit(), 'I01C') )
        call RemoveItem( GetItemOfTypeFromUnitBJ(GetTriggerUnit(), 'I01F') )
        call UnitAddItemByIdSwapped( 'belv', GetTriggerUnit() )
    else
        call AdjustPlayerStateBJ( 300, GetOwningPlayer(GetTriggerUnit()), PLAYER_STATE_RESOURCE_GOLD )
    endif
endfunction

//===========================================================================
function InitTrig_024 takes nothing returns nothing
    set gg_trg_024 = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_024, EVENT_PLAYER_UNIT_PICKUP_ITEM )
    call TriggerAddCondition( gg_trg_024, Condition( function Trig_024_Conditions ) )
    call TriggerAddAction( gg_trg_024, function Trig_024_Actions )
endfunction
