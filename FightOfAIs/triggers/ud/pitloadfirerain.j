
//===========================================================================
// Trigger: pitloadfirerain
//===========================================================================
function Trig_pitloadfirerain_Conditions takes nothing returns boolean
    local unit t=GetEventTargetUnit()
    local unit u=GetTriggerUnit()
    local integer i
    if  IsUnitType(t, UNIT_TYPE_HERO) == true  then
        set i= R2I((GetHeroLevel(u)-3)/7)
        call SetUnitAbilityLevel( u, 'ANht',i)
        call SetUnitAbilityLevel( u, 'ANrf', i )
        call SetUnitAbilityLevel( u, 'ANdo', i+GetUnitAbilityLevel(u,'B01T') )
        call IssueTargetOrderById( u, 852583, t )
    endif
    call IssuePointOrderById( u, 852238, GetUnitX(t), GetUnitY(t) )
    set t=null
    set u=null
    return false
endfunction



//===========================================================================
function InitTrig_pitloadfirerain takes nothing returns nothing
    set gg_trg_pitloadfirerain = CreateTrigger(  )
    call DisableTrigger( gg_trg_pitloadfirerain )
    call TriggerAddCondition( gg_trg_pitloadfirerain, Condition( function Trig_pitloadfirerain_Conditions ) )
endfunction
