
//===========================================================================
// Trigger: FireRain
//===========================================================================
function Trig_FireRain_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'ANrf' 
endfunction

function Trig_FireRain_Actions takes nothing returns nothing
    local unit m=CreateUnit(GetTriggerPlayer(),'n001',0,0,0)
    call UnitAddAbility( m, 'ACrg' )
    call SetUnitAbilityLevel( m, 'ACrg', GetUnitAbilityLevel(GetTriggerUnit(), 'ANrf') )
    call UnitApplyTimedLife( m, 'BTLF', 20 )
    call IssuePointOrderById( m, 852238, GetSpellTargetX(), GetSpellTargetY() )

    set m=null
endfunction

//===========================================================================
function InitTrig_FireRain takes nothing returns nothing
    set gg_trg_FireRain = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_FireRain, Condition( function Trig_FireRain_Conditions ) )
    call TriggerAddAction( gg_trg_FireRain, function Trig_FireRain_Actions )
endfunction
