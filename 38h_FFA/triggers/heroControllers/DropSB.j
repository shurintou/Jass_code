
//===========================================================================
// Trigger: DropSB
//===========================================================================
function Trig_DropSB_Conditions takes nothing returns boolean
    local integer i=GetItemTypeId(GetManipulatedItem())
    return  i== 'blba' or i == 'vddl' or i=='cosl'
endfunction

function Trig_DropSB_Actions takes nothing returns nothing
call UnitRemoveItem(GetTriggerUnit(),GetManipulatedItem())
endfunction

//===========================================================================
function InitTrig_DropSB takes nothing returns nothing
    set gg_trg_DropSB = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_DropSB, Condition( function Trig_DropSB_Conditions ) )
    call TriggerAddAction( gg_trg_DropSB, function Trig_DropSB_Actions )
endfunction
