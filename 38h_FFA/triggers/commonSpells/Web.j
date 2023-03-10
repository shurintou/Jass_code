
//===========================================================================
// Trigger: Web
//===========================================================================
function Trig_Web_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A05O' 
endfunction

function Trig_Web_Actions takes nothing returns nothing
    local unit u=GetTriggerUnit()
    local unit m=CreateUnit(GetTriggerPlayer(),'n001',GetUnitX(u),GetUnitY(u),0)
    call UnitAddAbility( m, 'Aweb' )
    call SetUnitAbilityLevel( m, 'Aweb', GetUnitAbilityLevel(u, 'A05O') )
    call UnitApplyTimedLife( m, 'BTLF', 5 )
    call IssueTargetOrderById( m, 852211, GetSpellTargetUnit() )
    set u=null
    set m=null
endfunction

//===========================================================================
function InitTrig_Web takes nothing returns nothing
    set gg_trg_Web = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_Web, Condition( function Trig_Web_Conditions ) )
    call TriggerAddAction( gg_trg_Web, function Trig_Web_Actions )
endfunction
