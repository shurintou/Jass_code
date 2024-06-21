
//===========================================================================
// Trigger: souldragona
//===========================================================================
function Trig_souldragona_Conditions takes nothing returns boolean
    local unit t=GetEventTargetUnit()
    local unit u=GetTriggerUnit()
    local real r=GetUnitState(u, UNIT_STATE_MANA)
    local integer i=R2I((GetHeroLevel(u)-5)/5)
    call SetUnitState( u, UNIT_STATE_MANA,0.97*r)
    if IsUnitType(t, UNIT_TYPE_HERO) == true   then
        if GetUnitState(t, UNIT_STATE_LIFE)/GetUnitState(t, UNIT_STATE_MAX_LIFE)<0.7 then
            call IssueTargetOrderById( u, 852662, t )
            call SetUnitAbilityLevel( u, 'A00X', i )
            call SetUnitAbilityLevel( u, 'A00Z', i )
        endif
    endif
    call IssueTargetOrderById(u, 852231, t )
    call SetUnitState( t, UNIT_STATE_LIFE,GetUnitState(t, UNIT_STATE_LIFE)-0.03*r)
    set t=null
    set u=null
    return false
endfunction



//===========================================================================
function InitTrig_souldragona takes nothing returns nothing
    set gg_trg_souldragona = CreateTrigger(  )
    call DisableTrigger( gg_trg_souldragona )
    call TriggerAddCondition( gg_trg_souldragona, Condition( function Trig_souldragona_Conditions ) )
    
endfunction
