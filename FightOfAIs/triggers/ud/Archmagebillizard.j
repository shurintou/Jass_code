
//===========================================================================
// Trigger: Archmagebillizard
//===========================================================================
function Trig_Archmagebillizard_Conditions takes nothing returns boolean
    local unit u=GetTriggerUnit()
    local unit m
    
    if  GetSpellAbilityId() == 'ANrf'  then
        set m=CreateUnit(getcorrectplayer(u),'u000',0,0,0)
        call UnitApplyTimedLife( m, 'BTLF', 15.00 )
        call UnitAddAbility(m,'A020')
        call SetUnitAbilityLevel(m,'A020',R2I((GetHeroLevel(u)+5)/10))
        call IssuePointOrderById( m, 852238, GetSpellTargetX(),GetSpellTargetY() )
    endif
    
    set u=null
    set m=null
    return false
endfunction



//===========================================================================
function InitTrig_Archmagebillizard takes nothing returns nothing
    set gg_trg_Archmagebillizard = CreateTrigger(  )
    call DisableTrigger(gg_trg_Archmagebillizard)
    call TriggerAddCondition( gg_trg_Archmagebillizard, Condition( function Trig_Archmagebillizard_Conditions ) )
    
endfunction
