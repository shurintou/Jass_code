
//===========================================================================
// Trigger: bianyang
//===========================================================================
function Trig_bianyang_Conditions takes nothing returns boolean
    
    local unit u=GetTriggerUnit()
    local real r=GetUnitState(u, UNIT_STATE_MANA)
    local unit t=GetEventTargetUnit()
    local integer i=GetHeroLevel(u)
    local integer x=10* GetUnitAbilityLevel(u,'B01T')
    if r>105 and GetRandomInt(1,100)<=20+i+x-GetHeroLevel(t) and IsUnitType(t, UNIT_TYPE_MAGIC_IMMUNE) == false and IsUnitType(t, UNIT_TYPE_POLYMORPHED) == false and IsUnitType(t, UNIT_TYPE_STRUCTURE) == false and GetOwningPlayer(t) != Player(PLAYER_NEUTRAL_AGGRESSIVE) then
        call SetUnitState( u, UNIT_STATE_MANA, r-100 )
        call SetUnitAnimationByIndex(u, 8 )
        call SetUnitAbilityLevel( udg_DeathKnight, 'AChx', R2I((i+6)/6) )
        call IssueTargetOrderById( udg_DeathKnight, 852502, t )
    endif
    call IssuePointOrderById(u, 852504, GetUnitX(u), GetUnitY(u) )
    call IssueTargetOrderById( u, 852502, t )
    set u=null
    set t=null
    return false
    
endfunction



//===========================================================================
function InitTrig_bianyang takes nothing returns nothing
    set gg_trg_bianyang = CreateTrigger(  )
    call DisableTrigger( gg_trg_bianyang)
    call TriggerAddCondition( gg_trg_bianyang, Condition( function Trig_bianyang_Conditions ) )
    
endfunction
