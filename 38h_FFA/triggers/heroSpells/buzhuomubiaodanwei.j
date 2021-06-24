
//===========================================================================
// Trigger: buzhuomubiaodanwei
//===========================================================================
function Trig_buzhuomubiaodanwei_Actions takes nothing returns nothing
call SaveUnitHandle(udg_Hash1,GetHandleId(gg_trg_wuqiluanwu),6,GetEventTargetUnit())
endfunction

//===========================================================================
function InitTrig_buzhuomubiaodanwei takes nothing returns nothing
    set gg_trg_buzhuomubiaodanwei = CreateTrigger(  )
    call TriggerAddAction( gg_trg_buzhuomubiaodanwei, function Trig_buzhuomubiaodanwei_Actions )
endfunction
