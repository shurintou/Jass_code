
//===========================================================================
// Trigger: Bloodmageattacked
//===========================================================================
function Trig_Bloodmageattacked_Conditions takes nothing returns boolean
    local unit u=GetTriggerUnit()
    local unit t=GetAttacker()
    if IsUnitType(t, UNIT_TYPE_HERO) == true  then
        call IssueTargetOrderById( u, 852487, t )
    endif
    
    
    if GetRandomInt(1,35)<GetHeroLevel(u) then
        call IssueTargetOrderById( udg_DeathKnight, 852486, t )
    endif
    if GetUnitAbilityLevel(u,'B01T')>0 then
        call IssueImmediateOrderById( u, 852489 )
    endif
    call IssuePointOrderById( u, 852488, GetUnitX(t),GetUnitY(t) )
    set u=null
    set t=null
    return false
endfunction



//===========================================================================
function InitTrig_Bloodmageattacked takes nothing returns nothing
    set gg_trg_Bloodmageattacked = CreateTrigger(  )
    call DisableTrigger( gg_trg_Bloodmageattacked )
    call TriggerAddCondition( gg_trg_Bloodmageattacked, Condition( function Trig_Bloodmageattacked_Conditions ) )
endfunction
