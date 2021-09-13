
//===========================================================================
// Trigger: jinu
//===========================================================================
function Trig_jinu_Conditions takes nothing returns boolean
   return GetSpellAbilityId() == 'A0BM' 
endfunction

function Trig_jinu_Actions takes nothing returns nothing
    local unit m=CreateUnit(GetTriggerPlayer(),'n001',0,0,0)
    call UnitAddAbility( m, 'ACls' )
//call SetUnitAbilityLevel( null, 'A041', GetUnitAbilityLevel(GetTriggerUnit(), 'A041') )
call UnitApplyTimedLife( m, 'BTLF', 6 )
    call IssueTargetOrderById( m, 852110, GetTriggerUnit() )
set m=null
endfunction

//===========================================================================
function InitTrig_jinu takes nothing returns nothing
    set gg_trg_jinu = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_jinu, Condition( function Trig_jinu_Conditions ) )
    call TriggerAddAction( gg_trg_jinu, function Trig_jinu_Actions )
endfunction
