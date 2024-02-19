
//===========================================================================
// Trigger: MonkeyH
//===========================================================================
function Trig_MonkeyH_Conditions takes nothing returns boolean
    local unit u= GetTriggerUnit()
    local unit m
    local integer g=R2I((GetHeroLevel(u)-5)/5)
    local real r=GetUnitState(u, UNIT_STATE_LIFE)
    local real h=GetEventDamage()
    
    if r/ GetUnitState(u, UNIT_STATE_MAX_LIFE)<0.6 then
        call IssueImmediateOrderById( u,852129 )
    endif
    
    if GetUnitAbilityLevel(u, 'B02E')>0 then
        call SetUnitState( u, UNIT_STATE_LIFE, r + 0.9* h )
    endif
    
    if GetUnitAbilityLevel(u, 'B02F')>0 then
        
    else
        if h>50 then
            call UnitAddAbility(u,'A0AF')
            call UnitRemoveAbility(u,'A0AF')
            call SetUnitState( u, UNIT_STATE_LIFE, 0.8*GetUnitState(u, UNIT_STATE_LIFE) + 0.2* GetUnitState(u, UNIT_STATE_MAX_LIFE) )
            set m= CreateUnit(getcorrectplayer(u),'u000',0,0,0)
            call UnitAddAbility(m,'AIil')
            call SetUnitAbilityLevel(m,'AIil',g)
            call IssueTargetOrderById( m, 852274,u )
            call UnitApplyTimedLife( m, 'BTLF', 0.50 )
        endif
    endif
    
    if IsUnitIllusion(GetEventDamageSource()) then
        call IssueImmediateOrderById( u,852183 )
    endif
    
    set u=null
    set m=null
    return false
endfunction



//===========================================================================
function InitTrig_MonkeyH takes nothing returns nothing
    set gg_trg_MonkeyH = CreateTrigger(  )
    call DisableTrigger( gg_trg_MonkeyH )
    call TriggerAddCondition( gg_trg_MonkeyH, Condition( function Trig_MonkeyH_Conditions ) )
endfunction
