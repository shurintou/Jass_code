
//===========================================================================
// Trigger: LearnLiquidBurn
//===========================================================================
function Trig_LearnLiquidBurn_Conditions takes nothing returns boolean
    return GetLearnedSkill() == 'A03J' 
endfunction

function Trig_LearnLiquidBurn_Actions takes nothing returns nothing
local unit u=GetTriggerUnit()
local integer i=GetUnitAbilityLevel(u,'A03J')
if i==1 then
    call UnitAddAbility( u, 'A03K' )
    call SetPlayerAbilityAvailable( GetOwningPlayer(u), 'A03K', false )
    call SetPlayerAbilityAvailable( GetOwningPlayer(u), 'Aliq', false )
    endif
    call SetUnitAbilityLevel(u,'Aliq',i)
    if i==4 then
    call DestroyTrigger( GetTriggeringTrigger() )
    endif

    set u=null
endfunction

//===========================================================================
function InitTrig_LearnLiquidBurn takes nothing returns nothing
    set gg_trg_LearnLiquidBurn = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_LearnLiquidBurn, Condition( function Trig_LearnLiquidBurn_Conditions ) )
    call TriggerAddAction( gg_trg_LearnLiquidBurn, function Trig_LearnLiquidBurn_Actions )
endfunction
