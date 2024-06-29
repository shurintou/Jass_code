
//===========================================================================
// Trigger: FTA
//===========================================================================
function Trig_FTA_Conditions takes nothing returns boolean
    local unit u=GetTriggerUnit()
    local unit t=GetEventTargetUnit()
    local integer l=R2I((GetHeroLevel(u)-3)/7)
    local integer i
    if IsUnitType(t, UNIT_TYPE_STRUCTURE) == false and IsUnitType(t, UNIT_TYPE_MAGIC_IMMUNE) ==false and IsUnitType(t, UNIT_TYPE_MECHANICAL) ==false then
        call IssueImmediateOrderById(u, 852183 )
        call IssueImmediateOrderById(u, 852127 )
        if  IsUnitType(t, UNIT_TYPE_HERO) == true  then
            call IssueTargetOrderById( u, 852095, t )
        endif
    endif
    
    
    
    call SetUnitAbilityLevel(u,'A069',l)
    call SetUnitAbilityLevel(u,'A068',l)
    call SetUnitAbilityLevel(u,'A067',l)
    call SetUnitAbilityLevel(u,'A04O',l)
    
    
    
    
    set u=null
    set t=null
    return false
endfunction



//===========================================================================
function InitTrig_FTA takes nothing returns nothing
    set gg_trg_FTA = CreateTrigger(  )
    call DisableTrigger( gg_trg_FTA )
    call TriggerAddCondition( gg_trg_FTA, Condition( function Trig_FTA_Conditions ) )
endfunction
