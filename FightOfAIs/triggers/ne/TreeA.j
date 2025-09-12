
//===========================================================================
// Trigger: TreeA
//
//  
//                local integer x=10*GetUnitAbilityLevel(u,'B01T')
//     call SetUnitState( u, UNIT_STATE_MANA, r )
//     if r>100 and GetRandomInt(1,40)<=l+x 
//===========================================================================
function Trig_TreeA_Conditions takes nothing returns boolean
    local unit t=GetEventTargetUnit()
    local unit u=GetTriggerUnit()
    local unit m
    local real r=GetUnitState(u, UNIT_STATE_MANA)
    local real rm = 0.97*r
    local integer i=R2I((GetHeroLevel(u)-3)/7)
    local real x
    local real y
    local integer b=10*GetUnitAbilityLevel(u,'B01T')
    local integer l=GetHeroLevel(u)

    call SetUnitState( u, UNIT_STATE_MANA, rm)
    call SetUnitState( t, UNIT_STATE_LIFE, GetUnitState(t, UNIT_STATE_LIFE)-0.03*r)
    call SetUnitAbilityLevel( u, 'A03V', i )
    call SetUnitAbilityLevel( u, 'A03U', i )
    call SetUnitAbilityLevel( u, 'A03X', i )
    call SetUnitAbilityLevel( u, 'A05B', i )
    call SetUnitAbilityLevel( u, 'A03W', i )
    if  IsUnitType(t, UNIT_TYPE_HERO) == true  then
        call IssueImmediateOrderById(u, 852183 )
    endif
    set x=GetUnitX(t)
    set y=GetUnitY(t)
    call IssuePointOrderById( u, 852218, x, y )
    call IssuePointOrderById( u, 852504, x, y )
    call IssueImmediateOrderById( u, 852097 )
    if GetUnitState(u, UNIT_STATE_LIFE) / GetUnitState(t, UNIT_STATE_MAX_LIFE) < 0.5 then
        call IssueImmediateOrderById(u, 852183 )
    endif


    if rm>100 and GetRandomInt(1,70)<=l+b and IsUnitType(t, UNIT_TYPE_MAGIC_IMMUNE) == false and IsUnitType(t, UNIT_TYPE_STRUCTURE) == false then
        set m=CreateUnit(getcorrectplayer(u) ,'u000',0,0,0)
        call UnitAddAbility( m, 'A00S' )
        call UnitApplyTimedLife( m, 'BTLF', 1.00 )
        call SetUnitAbilityLevel(m,'A00S',R2I((l-6)/6))
        call IssueTargetOrderById( m, 852171, t )
        call SetUnitState( u, UNIT_STATE_MANA, rm-60-l+b )
    endif
    set u=null
    set t=null
    set m=null
    return false
endfunction



//===========================================================================
function InitTrig_TreeA takes nothing returns nothing
    set gg_trg_TreeA = CreateTrigger(  )
    call DisableTrigger( gg_trg_TreeA )
    call TriggerAddCondition( gg_trg_TreeA, Condition( function Trig_TreeA_Conditions ) )
endfunction
