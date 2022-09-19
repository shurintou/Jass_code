
//===========================================================================
// Trigger: MoveHero
//===========================================================================
function Trig_MoveHero_Conditions takes nothing returns boolean
    return GetIssuedOrderId() == 851986 or GetIssuedOrderId() == 851988 or GetIssuedOrderId() == 851971 
endfunction

function Trig_MoveHero_Actions takes nothing returns nothing
call IssuePointOrderById( udg_PlayerLockToHero[GetConvertedPlayerId(GetTriggerPlayer())], 851986, GetOrderPointX(), GetOrderPointY() )
endfunction

//===========================================================================
function InitTrig_MoveHero takes nothing returns nothing
    set gg_trg_MoveHero = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_MoveHero, Condition( function Trig_MoveHero_Conditions ) )
    call TriggerAddAction( gg_trg_MoveHero, function Trig_MoveHero_Actions )
endfunction
