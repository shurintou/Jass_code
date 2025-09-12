
//===========================================================================
// Trigger: TimeA
//===========================================================================
function Trig_TimeA_Conditions takes nothing returns boolean
    local unit t=GetEventTargetUnit()
    local unit u=GetTriggerUnit()
    local real r=GetUnitState(u, UNIT_STATE_MANA)
    local integer i=R2I((GetHeroLevel(u)-5)/5)
    call SetUnitState( u, UNIT_STATE_MANA,0.97*r)
    call SetUnitState( t, UNIT_STATE_LIFE,GetUnitState(t, UNIT_STATE_LIFE)-0.03*r)
    call SetUnitAbilityLevel( u, 'A04B', i )
    call SetUnitAbilityLevel( u, 'A04C', i )
    call SetUnitAbilityLevel( u, 'A04F', i )
    if GetOwningPlayer(u) != Player(0) then
        if  IsUnitType(t, UNIT_TYPE_HERO) == true  then
            call IssueTargetOrderById( u, 852662, t )
            call IssuePointOrderById( u, 852089, GetUnitX(t), GetUnitY(t) )
        else
            call IssuePointOrderById( u, 852652, GetUnitX(t), GetUnitY(t) )
        endif
    endif
    set u=null
    set t=null
    return false
endfunction



//===========================================================================
function InitTrig_TimeA takes nothing returns nothing
    set gg_trg_TimeA = CreateTrigger(  )
    call DisableTrigger( gg_trg_TimeA )
    call TriggerAddCondition( gg_trg_TimeA, Condition( function Trig_TimeA_Conditions ) )
endfunction
