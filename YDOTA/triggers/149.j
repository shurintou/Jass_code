
//===========================================================================
// Trigger: 未命名触发器 149
//===========================================================================
function Trig_149_Conditions takes nothing returns boolean
    if ( not ( GetItemTypeId(GetManipulatedItem()) == 'I01I' ) ) then
        return false
    endif
    return true
endfunction

function Trig_149_Func001C takes nothing returns boolean
    if ( not ( GetItemTypeId(GetItemOfTypeFromUnitBJ(GetTriggerUnit(), 'I01E')) == 'I01E' ) ) then
        return false
    endif
    if ( not ( GetItemTypeId(GetItemOfTypeFromUnitBJ(GetTriggerUnit(), 'I01F')) == 'I01F' ) ) then
        return false
    endif
    if ( not ( GetItemTypeId(GetManipulatedItem()) == 'I01I' ) ) then
        return false
    endif
    return true
endfunction

function Trig_149_Actions takes nothing returns nothing
    if ( Trig_149_Func001C() ) then
        call RemoveItem( GetItemOfTypeFromUnitBJ(GetTriggerUnit(), 'I01E') )
        call RemoveItem( GetItemOfTypeFromUnitBJ(GetTriggerUnit(), 'I01F') )
        call UnitAddItemByIdSwapped( 'bgst', GetTriggerUnit() )
    else
        call AdjustPlayerStateBJ( 300, GetOwningPlayer(GetTriggerUnit()), PLAYER_STATE_RESOURCE_GOLD )
    endif
endfunction

//===========================================================================
function InitTrig_149 takes nothing returns nothing
    set gg_trg_149 = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_149, EVENT_PLAYER_UNIT_PICKUP_ITEM )
    call TriggerAddCondition( gg_trg_149, Condition( function Trig_149_Conditions ) )
    call TriggerAddAction( gg_trg_149, function Trig_149_Actions )
endfunction
