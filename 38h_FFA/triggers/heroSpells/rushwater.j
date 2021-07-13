
//===========================================================================
// Trigger: rushwater
//===========================================================================
function Trig_rushwater_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'ANhs' 
endfunction

function Trig_rushwater_Actions takes nothing returns nothing
    local unit u=GetTriggerUnit()
    local unit m=CreateUnit(GetTriggerPlayer(),'n001',GetUnitX(u),GetUnitY(u),0)
    call UnitAddAbility( m, 'A05G' )
    call SetUnitAbilityLevel( m, 'A05G', GetUnitAbilityLevel(u, 'ANhs') )
    call UnitApplyTimedLife( m, 'BTLF', 10 )
    call IssuePointOrderById( m, 852664, GetSpellTargetX(), GetSpellTargetY() )
    set u=null
    set m=null
endfunction

//===========================================================================
function InitTrig_rushwater takes nothing returns nothing
    set gg_trg_rushwater = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_rushwater, Condition( function Trig_rushwater_Conditions ) )
    call TriggerAddAction( gg_trg_rushwater, function Trig_rushwater_Actions )
endfunction
