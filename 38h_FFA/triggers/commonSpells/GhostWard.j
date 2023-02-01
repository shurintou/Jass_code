
//===========================================================================
// Trigger: GhostWard
//===========================================================================
function Trig_GhostWard_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A05S' 
endfunction

function Trig_GhostWard_Actions takes nothing returns nothing
    local unit u=GetTriggerUnit()
    local unit m=CreateUnit(GetTriggerPlayer(),'efdr',GetUnitX(u),GetUnitY(u),0)
    local integer level=GetUnitAbilityLevel(u, 'A05S')
    call SetUnitAbilityLevel( m, 'A051', level )
    call SetUnitAbilityLevel( m, 'Amfl', level )
    call UnitApplyTimedLife( m, 'BTLF', 25 )
    call IssueImmediateOrderById( m, 852512 )
    set u=null
    set m=null
endfunction

//===========================================================================
function InitTrig_GhostWard takes nothing returns nothing
    set gg_trg_GhostWard = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_GhostWard, Condition( function Trig_GhostWard_Conditions ) )
    call TriggerAddAction( gg_trg_GhostWard, function Trig_GhostWard_Actions )
endfunction
