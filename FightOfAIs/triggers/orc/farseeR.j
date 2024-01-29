//===========================================================================
// Trigger: farseeR
//===========================================================================
function Trig_farseeR_Conditions takes nothing returns boolean
    local unit u=GetTriggerUnit()
    local real r=0.97*GetUnitState(u, UNIT_STATE_MANA)
    local unit t=GetEventTargetUnit()
    local integer i
    local integer l=GetHeroLevel(u)
    local unit m
    local integer x=10* GetUnitAbilityLevel(u,'B01T')
    call SetUnitState( u, UNIT_STATE_MANA,r)
    call SetUnitState( t, UNIT_STATE_LIFE,GetUnitState(t, UNIT_STATE_LIFE)-0.03*r)
    if r>100 and GetRandomInt(1,40)<=l+x and IsUnitType(t, UNIT_TYPE_MAGIC_IMMUNE) == false and IsUnitType(t, UNIT_TYPE_STRUCTURE) == false then
        set m=CreateUnit(getcorrectplayer(u) ,'u000',GetUnitX(u),GetUnitY(u),0)
        call UnitAddAbility( m, 'A04S' )
        call SetUnitAbilityLevel(m,'A04S',R2I((l-6)/6))
        call UnitApplyTimedLife( m, 'BTLF', 1.00 )
        call SetUnitAnimationByIndex(u, 4 )
        call IssueTargetOrderById( m, 852119, t )
        call SetUnitState( u, UNIT_STATE_MANA, r-60-l+x )
    endif
    call IssuePointOrderById( u, 852122, GetUnitX(u),GetUnitY(u) )
    call IssueTargetOrderById( u, 852119, t )
    set u=null
    set t=null
    set m=null
    return false
endfunction



//===========================================================================
function InitTrig_farseeR takes nothing returns nothing
    set gg_trg_farseeR = CreateTrigger(  )
    call DisableTrigger( gg_trg_farseeR )
    call TriggerAddCondition( gg_trg_farseeR, Condition( function Trig_farseeR_Conditions ) )
endfunction
