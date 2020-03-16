
//===========================================================================
// Trigger: 未命名触发器 106
//===========================================================================
function Trig_106_Func003001 takes nothing returns boolean
    return ( GetItemTypeId(GetManipulatedItem()) == 'sbch' )
endfunction

function Trig_106_Func003002 takes nothing returns boolean
    return ( GetItemTypeId(GetManipulatedItem()) == 'gcel' )
endfunction

function Trig_106_Conditions takes nothing returns boolean
    if ( not GetBooleanAnd( Trig_106_Func003001(), Trig_106_Func003002() ) ) then
        return false
    endif
    return true
endfunction

function Trig_106_Actions takes nothing returns nothing
    call RemoveItem( GetManipulatedItem() )
    call UnitAddItemByIdSwapped( 'modt', GetManipulatingUnit() )
endfunction

//===========================================================================
function InitTrig_106 takes nothing returns nothing
    set gg_trg_106 = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_106, EVENT_PLAYER_UNIT_PICKUP_ITEM )
    call TriggerAddCondition( gg_trg_106, Condition( function Trig_106_Conditions ) )
    call TriggerAddAction( gg_trg_106, function Trig_106_Actions )
endfunction
