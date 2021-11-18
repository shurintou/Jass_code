
//===========================================================================
// Trigger: LinkenHudun
//===========================================================================
function Trig_LinkenHudun_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A09H' 
endfunction

function Trig_LinkenHudun_Actions takes nothing returns nothing
local unit u=LoadUnitHandle(udg_Hash2,GetHandleId(GetTriggerUnit()),4620)
call UnitUseItemPoint( u, UnitItemInSlot(u,0), GetSpellTargetX(), GetSpellTargetY() )
set u=null
endfunction

//===========================================================================
function InitTrig_LinkenHudun takes nothing returns nothing
    set gg_trg_LinkenHudun = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_LinkenHudun, Condition( function Trig_LinkenHudun_Conditions ) )
    call TriggerAddAction( gg_trg_LinkenHudun, function Trig_LinkenHudun_Actions )
endfunction
