
//===========================================================================
// Trigger: nelaolu
//===========================================================================
function Trig_nelaolu_Conditions takes nothing returns boolean
    local unit u=GetTriggerUnit()
    local unit t= GetEventTargetUnit()
    local real r=GetUnitState(u, UNIT_STATE_MANA)
    local integer i=R2I((GetHeroLevel(u)-4)/6)+GetUnitAbilityLevel(u,'B01T')
    call SetUnitState( u, UNIT_STATE_MANA,0.97*r)
    call SetUnitState( t, UNIT_STATE_LIFE,GetUnitState(t, UNIT_STATE_LIFE)-0.03*r)
    if  IsUnitType(t, UNIT_TYPE_HERO) == true  then
        call SetUnitAbilityLevel( u, 'A00G', i )
        call SetUnitAbilityLevel( u, 'A00F', i )
        call SetUnitAbilityLevel( u, 'ANmo', i )
        call SetUnitAbilityLevel( u, 'ANto', i )
        call IssueTargetOrderById( u, 852095, t )
    else
        if IsUnitType(t, UNIT_TYPE_STRUCTURE) == true then
            call IssuePointOrderById( u, 852597, GetUnitX(t), GetUnitY(t) )
        else
            call IssuePointOrderById( u, 852560, GetUnitX(t), GetUnitY(t) )
        endif
    endif
    set u=null
    set t=null
    return false
endfunction



//===========================================================================
function InitTrig_nelaolu takes nothing returns nothing
    set gg_trg_nelaolu = CreateTrigger(  )
    call DisableTrigger(gg_trg_nelaolu)
    call TriggerAddCondition( gg_trg_nelaolu, Condition( function Trig_nelaolu_Conditions ) )
    
endfunction
