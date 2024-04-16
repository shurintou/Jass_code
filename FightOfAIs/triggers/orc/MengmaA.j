
//===========================================================================
// Trigger: MengmaA
//===========================================================================
function Trig_MengmaA_Conditions takes nothing returns boolean
    local unit u=GetTriggerUnit()
    local unit t=GetEventTargetUnit()
    local integer i
    
    if  IsUnitType(t, UNIT_TYPE_HERO) == true  then
        set i=R2I((GetHeroLevel(u)-3)/7)
        call SetUnitAbilityLevel(u,'A02R',i)
        call SetUnitAbilityLevel(u,'A04I',i)
        call SetUnitAbilityLevel(u,'A045',i)
        call SetUnitAbilityLevel(u,'A04J',i)
        call IssueTargetOrderById( u, 852095, t )
        call IssueImmediateOrderById( u, 852096 )//da
    endif
    call IssueImmediateOrderById( u, 852127 )
    set u=null
    set t=null
    return false
endfunction



//===========================================================================
function InitTrig_MengmaA takes nothing returns nothing
    set gg_trg_MengmaA = CreateTrigger(  )
    call DisableTrigger( gg_trg_MengmaA )
    call TriggerAddCondition( gg_trg_MengmaA, Condition( function Trig_MengmaA_Conditions ) )
endfunction
