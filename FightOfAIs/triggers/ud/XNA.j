
//===========================================================================
// Trigger: XNA
//===========================================================================
function Trig_XNA_Conditions takes nothing returns boolean
    local unit t=GetEventTargetUnit()
    local unit u=GetTriggerUnit()
    local integer i
    local real r=GetUnitState(u, UNIT_STATE_MANA)
    call SetUnitState( u, UNIT_STATE_MANA,0.97*r)
    call SetUnitState( t, UNIT_STATE_LIFE,GetUnitState(t, UNIT_STATE_LIFE)-0.03*r)
    if  IsUnitType(t, UNIT_TYPE_HERO) == true  then
        set i=R2I((GetHeroLevel(u)-3)/7)
        call IssueTargetOrderById( u, 852209, t )
        call IssueTargetOrderById( u, 852662, t )
        call SetUnitAbilityLevel(u,'A05R',i)
        call SetUnitAbilityLevel(u,'A05P',i)
        call SetUnitAbilityLevel(u,'A05M',i)
        call SetUnitAbilityLevel(u,'A05O',i)
    endif
    call IssueTargetOrderById( u, 852095, t )
    set t=null
    set u=null
    return false
endfunction



//===========================================================================
function InitTrig_XNA takes nothing returns nothing
    set gg_trg_XNA = CreateTrigger(  )
    call DisableTrigger( gg_trg_XNA )
    call TriggerAddCondition( gg_trg_XNA, Condition( function Trig_XNA_Conditions ) )
endfunction
