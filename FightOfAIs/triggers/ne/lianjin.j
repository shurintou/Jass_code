
//===========================================================================
// Trigger: lianjin
//===========================================================================
function Trig_lianjin_Conditions takes nothing returns boolean
    local unit u=GetTriggerUnit()
    local unit t=GetEventTargetUnit()
    local integer i=R2I((GetHeroLevel(u)-3)/7)
    call SetUnitAbilityLevel( u, 'ANab', i )
    call SetUnitAbilityLevel( u, 'ANcr', i )
    call SetUnitAbilityLevel( u, 'ANhs', i )
    if  IsUnitType(t, UNIT_TYPE_HERO) == true  then
        call IssuePointOrderById(u, 852089, GetUnitX(t), GetUnitY(t) )
    endif
    call IssueTargetOrderById( u, 852662, t )
    set u=null
    set t=null
    return false
endfunction



//===========================================================================
function InitTrig_lianjin takes nothing returns nothing
    set gg_trg_lianjin = CreateTrigger(  )
    call DisableTrigger(gg_trg_lianjin)
    call TriggerAddCondition( gg_trg_lianjin, Condition( function Trig_lianjin_Conditions ) )
    
endfunction
