
//===========================================================================
// Trigger: GFA
//===========================================================================
function Trig_GFA_Conditions takes nothing returns boolean
    local unit u=GetTriggerUnit()
    local real r=0.97*GetUnitState(u, UNIT_STATE_MANA)
    local unit t=GetEventTargetUnit()
    local integer i=GetHeroLevel(u)
    local integer l=R2I((i-3)/7)
    local real x
    local real y
    if IsUnitType(t, UNIT_TYPE_HERO) == true then
        set x=GetUnitX(t)
        set y=GetUnitY(t)
        call IssuePointOrderById( u, 852232, x, y )
        call IssueTargetOrderById( u, 852095, t )
        call IssuePointOrderById( u, 852560, x, y )
    endif
    call SetUnitAbilityLevel(u,'A05C',l)
    call SetUnitAbilityLevel(u,'A05F',l)
    call SetUnitAbilityLevel(u,'A05G',l)
    if GetUnitState(t, UNIT_STATE_MANA)>0 then
        call SetUnitAbilityLevel(udg_DeathKnight,'ANmr',R2I((i-6)/4))
        call IssueTargetOrderById( udg_DeathKnight, 852565, t )
    endif
    call SetUnitState( u, UNIT_STATE_MANA,r)
    call SetUnitState( t, UNIT_STATE_LIFE,GetUnitState(t, UNIT_STATE_LIFE)-0.03*r)
    set u=null
    set t=null
    return false
endfunction



//===========================================================================
function InitTrig_GFA takes nothing returns nothing
    set gg_trg_GFA = CreateTrigger(  )
    call DisableTrigger( gg_trg_GFA )
    call TriggerAddCondition( gg_trg_GFA, Condition( function Trig_GFA_Conditions ) )
endfunction
