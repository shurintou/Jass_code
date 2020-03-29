
//===========================================================================
// Trigger: 未命名触发器 046
//===========================================================================
function Trig_046_Conditions takes nothing returns boolean
    if ( not ( GetItemTypeId(GetManipulatedItem()) == 'I01Z' ) ) then
        return false
    endif
    return true
endfunction

function Trig_046_Func001C takes nothing returns boolean
    if ( not ( GetItemTypeId(GetItemOfTypeFromUnitBJ(GetTriggerUnit(), 'cnob')) == 'cnob' ) ) then
        return false
    endif
    if ( not ( GetItemTypeId(GetItemOfTypeFromUnitBJ(GetTriggerUnit(), 'belv')) == 'belv' ) ) then
        return false
    endif
    if ( not ( GetItemTypeId(GetManipulatedItem()) == 'I01Z' ) ) then
        return false
    endif
    return true
endfunction

function Trig_046_Actions takes nothing returns nothing
    if ( Trig_046_Func001C() ) then
        call RemoveItem( GetItemOfTypeFromUnitBJ(GetTriggerUnit(), 'belv') )
        call RemoveItem( GetItemOfTypeFromUnitBJ(GetTriggerUnit(), 'cnob') )
        call UnitAddItemByIdSwapped( 'hcun', GetManipulatingUnit() )
    else
        call AdjustPlayerStateBJ( 315, GetOwningPlayer(GetTriggerUnit()), PLAYER_STATE_RESOURCE_GOLD )
    endif
endfunction

//===========================================================================
function InitTrig_046 takes nothing returns nothing
    set gg_trg_046 = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_046, EVENT_PLAYER_UNIT_PICKUP_ITEM )
    call TriggerAddCondition( gg_trg_046, Condition( function Trig_046_Conditions ) )
    call TriggerAddAction( gg_trg_046, function Trig_046_Actions )
endfunction
