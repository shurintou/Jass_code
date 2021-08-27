
//===========================================================================
// Trigger: HuiJi
//===========================================================================
function Trig_HuiJi_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A09Z' 
endfunction

function Trig_HuiJi_Actions takes nothing returns nothing
local unit u=GetTriggerUnit()
call SetPlayerAbilityAvailable( GetTriggerPlayer(), 'A09Z', false )
call UnitAddAbility( u, 'A0A0' )
call SetUnitAbilityLevel( u, 'A09Y', GetUnitAbilityLevel(u, 'A09Z') )
call SetPlayerAbilityAvailable( GetTriggerPlayer(), 'A0A0', false )
call EnableTrigger( gg_trg_AttackWithHuiJi )
set u=null
endfunction

//===========================================================================
function InitTrig_HuiJi takes nothing returns nothing
    set gg_trg_HuiJi = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_HuiJi, Condition( function Trig_HuiJi_Conditions ) )
    call TriggerAddAction( gg_trg_HuiJi, function Trig_HuiJi_Actions )
endfunction
