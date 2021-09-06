
//===========================================================================
// Trigger: huigui
//===========================================================================
function Trig_huigui_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A070' 
endfunction

function Trig_huigui_Actions takes nothing returns nothing
local unit u=GetTriggerUnit()
local unit t=LoadUnitHandle(udg_Hash1,GetHandleId(gg_trg_zhaohuanxiong),1)
call SetUnitX(u,GetUnitX(t))
call SetUnitY(u,GetUnitY(t))
call DestroyEffect( AddSpecialEffectTarget("Abilities\\Spells\\Orc\\FeralSpirit\\feralspiritdone.mdl", u, "chest") )
set u=null
set t=null
endfunction

//===========================================================================
function InitTrig_huigui takes nothing returns nothing
    set gg_trg_huigui = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_huigui, Condition( function Trig_huigui_Conditions ) )
    call TriggerAddAction( gg_trg_huigui, function Trig_huigui_Actions )
endfunction
