
//===========================================================================
// Trigger: 未命名触发器 152
//===========================================================================
function Trig_152_Conditions takes nothing returns boolean
    if ( not ( GetItemTypeId(GetManipulatedItem()) == 'I019' ) ) then
        return false
    endif
    return true
endfunction

function Trig_152_Func001C takes nothing returns boolean
    if ( not ( GetItemTypeId(GetManipulatedItem()) == 'I019' ) ) then
        return false
    endif
    if ( not ( GetItemTypeId(GetItemOfTypeFromUnitBJ(GetTriggerUnit(), 'bspd')) == 'bspd' ) ) then
        return false
    endif
    return true
endfunction

function Trig_152_Actions takes nothing returns nothing
    if ( Trig_152_Func001C() ) then
        call RemoveItem( GetItemOfTypeFromUnitBJ(GetTriggerUnit(), 'bspd') )
        call UnitAddItemByIdSwapped( 'hbth', GetTriggerUnit() )
    else
        call AdjustPlayerStateBJ( 2200, GetOwningPlayer(GetTriggerUnit()), PLAYER_STATE_RESOURCE_GOLD )
    endif
endfunction

//===========================================================================
function InitTrig_152 takes nothing returns nothing
    set gg_trg_152 = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_152, EVENT_PLAYER_UNIT_PICKUP_ITEM )
    call TriggerAddCondition( gg_trg_152, Condition( function Trig_152_Conditions ) )
    call TriggerAddAction( gg_trg_152, function Trig_152_Actions )
endfunction
