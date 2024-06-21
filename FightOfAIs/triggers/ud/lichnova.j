
//===========================================================================
// Trigger: lichnova
//===========================================================================
function Trig_lichnova_Conditions takes nothing returns boolean
    local unit u=GetTriggerUnit()
    local real r=0.97*GetUnitState(u, UNIT_STATE_MANA)
    local unit t=GetEventTargetUnit()
    local integer i
    local integer l=GetHeroLevel(u)
    local unit m
    local integer x=10*GetUnitAbilityLevel(u,'B01T')
    call SetUnitState( u, UNIT_STATE_MANA, r )
    if r>100 and GetRandomInt(1,40)<=l+x and IsUnitType(t, UNIT_TYPE_MAGIC_IMMUNE) == false and IsUnitType(t, UNIT_TYPE_STRUCTURE) == false then
        set m=CreateUnit(getcorrectplayer(u) ,'u000',0,0,0)
        call UnitAddAbility( m, 'ACfn' )
        
        call UnitApplyTimedLife( m, 'BTLF', 1.00 )
        call SetUnitAbilityLevel(m,'ACfn',R2I((l-6)/6))
        call SetUnitAnimationByIndex(u, 7 )
        call IssueTargetOrderById( m, 852226, t )
        call SetUnitState( u, UNIT_STATE_MANA, r-60-l+x )
    endif
    call SetUnitState( t, UNIT_STATE_LIFE,GetUnitState(t, UNIT_STATE_LIFE)-0.03*r)
    set u=null
    set t=null
    set m=null
    return false
endfunction



//===========================================================================
function InitTrig_lichnova takes nothing returns nothing
    set gg_trg_lichnova = CreateTrigger(  )
    call DisableTrigger( gg_trg_lichnova)
    call TriggerAddCondition( gg_trg_lichnova, Condition( function Trig_lichnova_Conditions ) )
    
endfunction
