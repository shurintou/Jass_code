
//===========================================================================
// Trigger: 未命名触发器 319
//===========================================================================
function Trig_319_Conditions takes nothing returns boolean
    if ( not ( GetItemTypeId(GetManipulatedItem()) == 'I025' ) ) then
        return false
    endif
    return true
endfunction

function Trig_319_Func001C takes nothing returns boolean
    if ( not ( GetItemTypeId(GetItemOfTypeFromUnitBJ(GetTriggerUnit(), 'rwiz')) == 'rwiz' ) ) then
        return false
    endif
    if ( not ( GetItemTypeId(GetItemOfTypeFromUnitBJ(GetTriggerUnit(), 'I026')) == 'I026' ) ) then
        return false
    endif
    if ( not ( GetItemTypeId(GetItemOfTypeFromUnitBJ(GetTriggerUnit(), 'rlif')) == 'rlif' ) ) then
        return false
    endif
    if ( not ( GetItemTypeId(GetManipulatedItem()) == 'I025' ) ) then
        return false
    endif
    return true
endfunction

function Trig_319_Actions takes nothing returns nothing
    if ( Trig_319_Func001C() ) then
        call RemoveItem( GetItemOfTypeFromUnitBJ(GetTriggerUnit(), 'rwiz') )
        call RemoveItem( GetItemOfTypeFromUnitBJ(GetTriggerUnit(), 'rlif') )
        call RemoveItem( GetItemOfTypeFromUnitBJ(GetTriggerUnit(), 'I026') )
        call UnitAddItemByIdSwapped( 'ofir', GetTriggerUnit() )
    else
        call AdjustPlayerStateBJ( 300, GetOwningPlayer(GetTriggerUnit()), PLAYER_STATE_RESOURCE_GOLD )
    endif
endfunction

//===========================================================================
function InitTrig_319 takes nothing returns nothing
    set gg_trg_319 = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_319, EVENT_PLAYER_UNIT_PICKUP_ITEM )
    call TriggerAddCondition( gg_trg_319, Condition( function Trig_319_Conditions ) )
    call TriggerAddAction( gg_trg_319, function Trig_319_Actions )
endfunction
