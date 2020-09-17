
//===========================================================================
// Trigger: 未命名触发器 175
//===========================================================================
function Trig_175_Conditions takes nothing returns boolean
    if ( not ( GetItemTypeId(GetManipulatedItem()) == 'I021' ) ) then
        return false
    endif
    return true
endfunction

function Trig_175_Func001C takes nothing returns boolean
    if ( not ( GetItemTypeId(GetItemOfTypeFromUnitBJ(GetTriggerUnit(), 'cnob')) == 'cnob' ) ) then
        return false
    endif
    if ( not ( GetItemTypeId(GetItemOfTypeFromUnitBJ(GetTriggerUnit(), 'ciri')) == 'ciri' ) ) then
        return false
    endif
    if ( not ( GetItemTypeId(GetManipulatedItem()) == 'I021' ) ) then
        return false
    endif
    return true
endfunction

function Trig_175_Actions takes nothing returns nothing
    if ( Trig_175_Func001C() ) then
        call RemoveItem( GetItemOfTypeFromUnitBJ(GetTriggerUnit(), 'ciri') )
        call RemoveItem( GetItemOfTypeFromUnitBJ(GetTriggerUnit(), 'cnob') )
        call UnitAddItemByIdSwapped( 'hval', GetTriggerUnit() )
    else
        call AdjustPlayerStateBJ( 315, GetOwningPlayer(GetTriggerUnit()), PLAYER_STATE_RESOURCE_GOLD )
    endif
endfunction

//===========================================================================
function InitTrig_175 takes nothing returns nothing
    set gg_trg_175 = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_175, EVENT_PLAYER_UNIT_PICKUP_ITEM )
    call TriggerAddCondition( gg_trg_175, Condition( function Trig_175_Conditions ) )
    call TriggerAddAction( gg_trg_175, function Trig_175_Actions )
endfunction
