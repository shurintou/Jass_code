
//===========================================================================
// Trigger: MonkeyA
//===========================================================================
function Trig_MonkeyA_Conditions takes nothing returns boolean
    local unit u=GetTriggerUnit()
    local unit m
    local integer i=GetHeroLevel(u)
    local integer g=R2I((i-5)/5)
    local unit t=GetEventTargetUnit()
    local real r=10+(10*GetUnitAbilityLevel(u,'B01T')) + 2*g
    if IsUnitType(t, UNIT_TYPE_HERO) then
        call IssueTargetOrderById( u,852095, t )
        call IssueImmediateOrderById( u,852183 )
        set r=r*2
    endif
    
    if  IsUnitType(GetEventTargetUnit(), UNIT_TYPE_STRUCTURE) == false and GetRandomInt(1,100) < r  then
        set m= CreateUnit(getcorrectplayer(u),'u000',0,0,0)
        //set m= CreateUnit(GetOwningPlayer(u),'u000',0,0,0)
        call UnitAddAbility(m,'AIil')
        call SetUnitAbilityLevel(m,'AIil',g)
        call IssueTargetOrderById( m, 852274,u )
        call UnitApplyTimedLife( m, 'BTLF', 0.50 )
        call SetUnitState( u, UNIT_STATE_LIFE, 0.8*GetUnitState(u, UNIT_STATE_LIFE) + 0.25*GetUnitState(u, UNIT_STATE_MAX_LIFE)  )
    endif
    
    
    call SetUnitAbilityLevel(u,'A09V',g)
    call SetUnitAbilityLevel(u,'A0A5',g)
    call SetUnitAbilityLevel(u,'A0AB',R2I((i-4)/7))
    
    set u=null
    set t=null
    set m=null
    return false
endfunction



//===========================================================================
function InitTrig_MonkeyA takes nothing returns nothing
    set gg_trg_MonkeyA = CreateTrigger(  )
    call DisableTrigger( gg_trg_MonkeyA )
    call TriggerAddCondition( gg_trg_MonkeyA, Condition( function Trig_MonkeyA_Conditions ) )
endfunction
