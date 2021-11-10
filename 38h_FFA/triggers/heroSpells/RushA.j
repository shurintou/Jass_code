
//===========================================================================
// Trigger: RushA
//===========================================================================
function Trig_RushA_Conditions takes nothing returns boolean
    return GetLearnedSkill() == 'A03O' 
endfunction

function Trig_RushA_Actions takes nothing returns nothing
local unit u=GetTriggerUnit()
local integer i=GetUnitAbilityLevel(u,'A03O')
if i==1 then
    call UnitAddAbility( u, 'A03I' )
    call UnitAddAbility(u,'A03R')
    call SetPlayerAbilityAvailable( GetOwningPlayer(u), 'A03R', false )
    call SetPlayerAbilityAvailable( GetOwningPlayer(u), 'A03I', false )
    call UnitRemoveAbility(u,'B012')
    endif
    call SetUnitAbilityLevel(u,'AHbh',i)
    call SetUnitAbilityLevel(u,'A03R',i)
    if i==4 then
    call DestroyTrigger( GetTriggeringTrigger() )
    endif

    set u=null
endfunction

//===========================================================================
function InitTrig_RushA takes nothing returns nothing
    set gg_trg_RushA = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_RushA, Condition( function Trig_RushA_Conditions ) )
    call TriggerAddAction( gg_trg_RushA, function Trig_RushA_Actions )
endfunction
