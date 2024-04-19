
//===========================================================================
// Trigger: FLvocalno
//===========================================================================
function Trig_FLvocalno_Conditions takes nothing returns boolean
    local unit m
    local unit u
    local integer i
    if  GetSpellAbilityId()== 'ANvc' then
        set u=GetTriggerUnit()
        set m=CreateUnit(getcorrectplayer(u),'u000',0,0,0)
        set i=R2I((GetHeroLevel(u)-3)/7)
        call UnitAddAbility(m,'A04H')
        call UnitApplyTimedLife( m, 'BTLF', 15 )
        call SetUnitAbilityLevel(m,'A04H',i+GetUnitAbilityLevel(u,'B01T'))
        call SetUnitAbilityLevel(u,'ANic',i)
        call IssuePointOrderById( m, 852669, GetSpellTargetX(), GetSpellTargetY() )
    endif
    set m=null
    set u=null
    return false
endfunction


//===========================================================================
function InitTrig_FLvocalno takes nothing returns nothing
    set gg_trg_FLvocalno = CreateTrigger(  )
    call DisableTrigger( gg_trg_FLvocalno )
    call TriggerAddCondition( gg_trg_FLvocalno, Condition( function Trig_FLvocalno_Conditions ) )
endfunction
