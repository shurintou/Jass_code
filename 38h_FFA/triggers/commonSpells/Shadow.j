
//===========================================================================
// Trigger: Shadow
//===========================================================================
function Trig_Shadow_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A04U' 
endfunction

function Trig_Shadow_Actions takes nothing returns nothing
    local unit p=CreateUnit(GetTriggerPlayer(), 'n001', 0, 0, 0)
    local unit u=GetTriggerUnit()
    call UnitApplyTimedLife( p, 'BTLF', 2.00 )
    call UnitAddAbility( p, 'AIil' )
    call SetUnitAbilityLevel( p, 'AIil', GetUnitAbilityLevel(u, 'A04U') )
    call IssueTargetOrderById( p, 852274, u )
    call IssueTargetOrderById( p, 852274, u )//只分一次好了
    set p=null
    set u=null
endfunction

//===========================================================================
function InitTrig_Shadow takes nothing returns nothing
    set gg_trg_Shadow = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_Shadow, Condition( function Trig_Shadow_Conditions ) )
    call TriggerAddAction( gg_trg_Shadow, function Trig_Shadow_Actions )
endfunction
