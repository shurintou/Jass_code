
//===========================================================================
// Trigger: dedaoshengjian
//===========================================================================
function Trig_dedaoshengjian_Conditions takes nothing returns boolean
    return GetItemTypeId(GetManipulatedItem()) == 'blba' 
endfunction

function Trig_dedaoshengjian_Actions takes nothing returns nothing
    call SetItemDropOnDeath( GetManipulatedItem(), false )
endfunction

//===========================================================================
function InitTrig_dedaoshengjian takes nothing returns nothing
    set gg_trg_dedaoshengjian = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_dedaoshengjian, Condition( function Trig_dedaoshengjian_Conditions ) )
    call TriggerAddAction( gg_trg_dedaoshengjian, function Trig_dedaoshengjian_Actions )
endfunction
