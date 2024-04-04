
//===========================================================================
// Trigger: ZDA
//===========================================================================
function Trig_ZDA_Conditions takes nothing returns boolean
    local unit u=GetTriggerUnit()
    local real r=0.97*GetUnitState(u, UNIT_STATE_MANA)
    local unit t=GetEventTargetUnit()
    local real x=GetUnitX(t)
    local real y=GetUnitY(t)
    local integer i=GetHeroLevel(u)
    local unit m
    local player p
    if GetRandomInt(1,90)<i then
        set p=getcorrectplayer(u)
        set m=CreateUnit(p,'u000',x,y,0)
        call UnitAddAbility(m,'A062')
        call UnitApplyTimedLife( m, 'BTLF', 15.00 )
        call SetUnitAbilityLevel(m,'A062',3)
        call IssueImmediateOrderById(m, 852183 )
        set m=CreateUnit(p,'u000',x,y,0)
        call UnitApplyTimedLife( m, 'BTLF', 1.00 )
        call UnitAddAbility(m,'A063')
        call SetUnitAbilityLevel(m,'A063',R2I((i-5)/5))
        call IssuePointOrderById( m, 852560, x, y )
    endif
    if IsUnitType(t, UNIT_TYPE_STRUCTURE) == false then
        call IssuePointOrderById(u, 852664, x, y )
        call IssuePointOrderById(u, 852504, x, y )
        if IsUnitType(t, UNIT_TYPE_HERO) == true then
            call IssuePointOrderById( u, 852224, x, y )
        endif
    endif
    call SetUnitState( u, UNIT_STATE_MANA,r)
    call SetUnitState( t, UNIT_STATE_LIFE,GetUnitState(t, UNIT_STATE_LIFE)-0.03*r)
    set u=null
    set t=null
    set m=null
    set p=null
    return false
endfunction



//===========================================================================
function InitTrig_ZDA takes nothing returns nothing
    set gg_trg_ZDA = CreateTrigger(  )
    call DisableTrigger( gg_trg_ZDA )
    call TriggerAddCondition( gg_trg_ZDA, Condition( function Trig_ZDA_Conditions ) )
endfunction
