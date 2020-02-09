
//===========================================================================
// Trigger: 未命名触发器 176
//===========================================================================
function Trig_176_Conditions takes nothing returns boolean
    if ( not ( GetItemTypeId(GetManipulatedItem()) == 'I020' ) ) then
        return false
    endif
    return true
endfunction

function Trig_176_Func001C takes nothing returns boolean
    if ( not ( GetItemTypeId(GetItemOfTypeFromUnitBJ(GetTriggerUnit(), 'cnob')) == 'cnob' ) ) then
        return false
    endif
    if ( not ( GetItemTypeId(GetItemOfTypeFromUnitBJ(GetTriggerUnit(), 'bgst')) == 'bgst' ) ) then
        return false
    endif
    if ( not ( GetItemTypeId(GetManipulatedItem()) == 'I020' ) ) then
        return false
    endif
    return true
endfunction

function Trig_176_Actions takes nothing returns nothing
    if ( Trig_176_Func001C() ) then
        call RemoveItem( GetItemOfTypeFromUnitBJ(GetTriggerUnit(), 'bgst') )
        call RemoveItem( GetItemOfTypeFromUnitBJ(GetTriggerUnit(), 'cnob') )
        call UnitAddItemByIdSwapped( 'mcou', GetTriggerUnit() )
    else
        call AdjustPlayerStateBJ( 315, GetOwningPlayer(GetTriggerUnit()), PLAYER_STATE_RESOURCE_GOLD )
    endif
endfunction

//===========================================================================
function InitTrig_176 takes nothing returns nothing
    set gg_trg_176 = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_176, EVENT_PLAYER_UNIT_PICKUP_ITEM )
    call TriggerAddCondition( gg_trg_176, Condition( function Trig_176_Conditions ) )
    call TriggerAddAction( gg_trg_176, function Trig_176_Actions )
endfunction
