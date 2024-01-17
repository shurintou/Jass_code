
//===========================================================================
// Trigger: JDA
//===========================================================================
function Trig_JDA_Conditions takes nothing returns boolean
    local unit t=GetEventTargetUnit()
    local unit u=GetTriggerUnit()
    local real x=GetUnitX(t)
    local real y=GetUnitY(t)
    local integer i= GetHeroLevel(u)
    call SetUnitAbilityLevel(u,'Apoi',R2I((i-3)/6))
    call SetUnitAbilityLevel(u,'A040',R2I((i-1)/9))
    call SetUnitAbilityLevel(u,'A042',R2I((i-2)/8))
    call IssuePointOrderById( u, 852504, x, y )
    call IssuePointOrderById( u, 852089, x, y )
    if  IsUnitType(t, UNIT_TYPE_HERO) == true  then
        call IssueImmediateOrderById(u,  852183 )
    endif
    set t=null
    set u=null
    return false
endfunction



//===========================================================================
function InitTrig_JDA takes nothing returns nothing
    set gg_trg_JDA = CreateTrigger(  )
    call DisableTrigger( gg_trg_JDA )
    call TriggerAddCondition( gg_trg_JDA, Condition( function Trig_JDA_Conditions ) )
endfunction
