
//===========================================================================
// Trigger: fangdaodan
//===========================================================================
function Trig_fangdaodan_Conditions takes nothing returns boolean
    local unit u
    local unit m
    local integer i=GetSpellAbilityId()
    
    
    
    if  i == 'ANc3'  then
        set u=GetTriggerUnit()
        set m=CreateUnit(getcorrectplayer(u),'u000',GetUnitX(u),GetUnitY(u),0)
        call UnitAddAbility( m, 'A00E' )
        call SetUnitAbilityLevel( m, 'A00E', R2I((GetHeroLevel(u)-4)/6)+GetUnitAbilityLevel(u,'B01T') )
        call UnitApplyTimedLife( m, 'BTLF', 10.00 )
        call IssuePointOrderById( m, 852652, GetSpellTargetX(), GetSpellTargetY() )
    elseif  i=='ANs3' then
        set u=GetTriggerUnit()
        set m=CreateUnit(getcorrectplayer(u),'u000',GetUnitX(u),GetUnitY(u),0)
        call UnitAddAbility( m, 'A02G' )
        call SetUnitAbilityLevel( m, 'A02G', R2I((GetHeroLevel(u)-4)/6)+GetUnitAbilityLevel(u,'B01T') )
        call IssuePointOrderById( m, 852593, GetUnitX(u)+GetRandomReal(-100,100),GetUnitY(u)+GetRandomReal(-100,100) )
        call UnitApplyTimedLife( m, 'BTLF', 15.00 )
    elseif i=='A02H' then
        set u=GetTriggerUnit()
        set m=CreateUnit(getcorrectplayer(u),'u000',GetUnitX(u),GetUnitY(u),0)
        call UnitAddAbility( m, 'A09Z' )
        call SetUnitAbilityLevel( m, 'A09Z', GetUnitAbilityLevel(u,'A02H') )
        call IssueImmediateOrderById( m, 852526 )
        call UnitApplyTimedLife( m, 'BTLF', 2.00 )
    endif
    
    
    set u=null
    set m=null
    return false
endfunction



//===========================================================================
function InitTrig_fangdaodan takes nothing returns nothing
    set gg_trg_fangdaodan = CreateTrigger(  )
    call DisableTrigger(gg_trg_fangdaodan)
    call TriggerAddCondition( gg_trg_fangdaodan, Condition( function Trig_fangdaodan_Conditions ) )
    
endfunction
