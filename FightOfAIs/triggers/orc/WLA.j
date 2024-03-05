
//===========================================================================
// Trigger: WLA
//===========================================================================
function Trig_WLA_Conditions takes nothing returns boolean
    local unit t=GetEventTargetUnit()
    local unit u=GetTriggerUnit()
    local real r=GetUnitState(u, UNIT_STATE_MANA)
    local integer i=R2I((GetHeroLevel(u)-5)/5)
    local integer n=GetConvertedPlayerId(GetTriggerPlayer())
    set udg_Chaoxi[n]=udg_Chaoxi[n]+2*(1+GetUnitAbilityLevel(u,'B01T'))
    if udg_Chaoxi[n]>100 then
        call UnitAddAbility(u,'A06M')
    else
        call UnitRemoveAbility(u,'A06M')
    endif
    call SetUnitState( u, UNIT_STATE_MANA,0.97*r)
    call SetUnitState( t, UNIT_STATE_LIFE,GetUnitState(t, UNIT_STATE_LIFE)-0.03*r)
    call SetUnitAbilityLevel( u, 'A06L', i )
    call SetUnitAbilityLevel( u, 'A06K', i )
    call SetUnitAbilityLevel( u, 'AOs2', i )
    if n != 1 then
        if  IsUnitType(t, UNIT_TYPE_HERO) == true  then
            call IssueTargetOrderById( u, 852095, t )
        endif
        call IssuePointOrderById( u, 852125, GetUnitX(t), GetUnitY(t) )
        call IssueImmediateOrderById( u, 852096 )
    endif
    set u=null
    set t=null
    return false
endfunction



//===========================================================================
function InitTrig_WLA takes nothing returns nothing
    set gg_trg_WLA = CreateTrigger(  )
    call DisableTrigger( gg_trg_WLA )
    call TriggerAddCondition( gg_trg_WLA, Condition( function Trig_WLA_Conditions ) )
endfunction
