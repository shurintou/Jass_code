
//===========================================================================
// Trigger: BingLie
//===========================================================================
function Trig_BingLie_Conditions takes nothing returns boolean
    return IsUnitEnemy(GetEventTargetUnit(), GetTriggerPlayer()) == true 
endfunction

function Trig_BingLie_Actions takes nothing returns nothing
    local unit p
    local unit u=GetTriggerUnit()
    local integer level=(2*GetUnitAbilityLevel(u, 'A05E'))+2   
    local integer n=GetRandomInt(1,100)

    if n<level then
    set p=CreateUnit(GetTriggerPlayer(), 'n001', 0, 0, 0)
    call UnitApplyTimedLife( p, 'BTLF', 2.00 )
    call UnitAddAbility( p, 'A05D' )
    call IssueTargetOrderById( p, 852274, u ) 
    endif

    set p= null
    set u=null
endfunction

//===========================================================================
function InitTrig_BingLie takes nothing returns nothing
    set gg_trg_BingLie = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_BingLie, Condition( function Trig_BingLie_Conditions ) )
    call TriggerAddAction( gg_trg_BingLie, function Trig_BingLie_Actions )
endfunction
