
//===========================================================================
// Trigger: LessHarm
//===========================================================================
function Trig_LessHarm_Conditions takes nothing returns boolean
    local unit u=GetTriggerUnit()
    local integer i=LoadInteger(udg_Hash1,GetHandleId(u),754)
    local real r
    local real h=GetEventDamage()*(1-0.05*i)
    local integer n=0
    local integer d
    local real sc
    if GetOwningPlayer(GetEventDamageSource()) != Player(PLAYER_NEUTRAL_AGGRESSIVE) and h>25 then
    if i>0 then
    call SaveInteger(udg_Hash1,GetHandleId(u),754,i-1)
    endif
    call SetUnitState( u, UNIT_STATE_LIFE, ( GetUnitState(u, UNIT_STATE_LIFE) + 0.05*i*GetEventDamage() ) )
    if GetUnitAbilityLevel(u,'Asp1')>0 then//狂暴状态
    call SetUnitAbilityLevel(u,'A085',GetUnitAbilityLevel(u,'A07W'))
    set d=GetHandleId(u)
    set n=GetUnitAbilityLevel(u,'B01Y')
    set r=LoadReal(udg_Hash1,d,9466)+h
    call SaveReal(udg_Hash1,d,9466,r)
    set r=r-n*120
    loop
    exitwhen r<120 
    set r=r-120
    set n=n+1
    set sc=1.3+0.08*n
    call SetUnitScale( u, sc, sc, sc )
    call SetUnitAbilityLevel(LoadUnitHandle(udg_Hash1,d,9467),'ACbl',n)
    call IssueTargetOrderById( LoadUnitHandle(udg_Hash1,d,9467), 852101, u )
    endloop
    else
    call UnitRemoveAbility( u, 'B01Y' )
    endif
    endif
    set u=null
    return false
endfunction



//===========================================================================
function InitTrig_LessHarm takes nothing returns nothing
    set gg_trg_LessHarm = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_LessHarm, Condition( function Trig_LessHarm_Conditions ) )
endfunction
