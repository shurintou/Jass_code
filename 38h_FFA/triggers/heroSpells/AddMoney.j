
//===========================================================================
// Trigger: AddMoney
//===========================================================================
function Trig_AddMoney_Conditions takes nothing returns boolean
    return GetLearnedSkill() == 'A041' 
endfunction

function Trig_AddMoney_Actions takes nothing returns nothing
    local unit u=GetTriggerUnit()
    local integer i=GetUnitAbilityLevel(u, 'A041' )
    if i==1 then
    call UnitAddAbility( u, 'A005' )
    call SetPlayerAbilityAvailable( GetOwningPlayer(u), 'A005', false )
    else
    call SetUnitAbilityLevel( u, 'Asal', i )
    endif
    if i==4 then
    call DestroyTrigger( GetTriggeringTrigger() )
    endif
    set u=null
endfunction

//===========================================================================
function InitTrig_AddMoney takes nothing returns nothing
    set gg_trg_AddMoney = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_AddMoney, Condition( function Trig_AddMoney_Conditions ) )
    call TriggerAddAction( gg_trg_AddMoney, function Trig_AddMoney_Actions )
endfunction
