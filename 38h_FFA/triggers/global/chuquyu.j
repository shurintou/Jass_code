
//===========================================================================
// Trigger: chuquyu
//===========================================================================
function Trig_chuquyu_Conditions takes nothing returns boolean
    return GetUnitTypeId(GetLeavingUnit()) == 'n00R' 
endfunction

function Trig_chuquyu_Actions takes nothing returns nothing
    call IssuePointOrderById( GetLeavingUnit(), 851986,  6720, 4660 )
endfunction

//===========================================================================
function InitTrig_chuquyu takes nothing returns nothing
    set gg_trg_chuquyu = CreateTrigger(  )
    call TriggerRegisterLeaveRectSimple( gg_trg_chuquyu, gg_rct_boss )
    call TriggerAddCondition( gg_trg_chuquyu, Condition( function Trig_chuquyu_Conditions ) )
    call TriggerAddAction( gg_trg_chuquyu, function Trig_chuquyu_Actions )
endfunction
