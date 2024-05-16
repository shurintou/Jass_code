
//===========================================================================
// Trigger: FireLoadVocalno
//===========================================================================
function Trig_FireLoadVocalno_Conditions takes nothing returns boolean
    local unit t=GetEventTargetUnit()
    local unit u=GetTriggerUnit()
    local integer i=R2I((GetHeroLevel(u)-4)/6)
    if IsUnitType(t, UNIT_TYPE_HERO) == true  then
        call IssueTargetOrderById( u, 852668, t )
        call IssuePointOrderById( u, 852669, GetUnitX(t), GetUnitY(t) )
    endif
    call IssueImmediateOrderById( u, 852667 )
    call SetUnitAbilityLevel( u, 'ANso', i )
    call SetUnitAbilityLevel( u, 'ANlm', i )
    set u=null
    set t=null
    return false
endfunction



//===========================================================================
function InitTrig_FireLoadVocalno takes nothing returns nothing
    set gg_trg_FireLoadVocalno = CreateTrigger(  )
    call DisableTrigger( gg_trg_FireLoadVocalno )
    call TriggerAddCondition( gg_trg_FireLoadVocalno, Condition( function Trig_FireLoadVocalno_Conditions ) )
endfunction
