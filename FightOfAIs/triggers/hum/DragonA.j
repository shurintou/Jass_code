
//===========================================================================
// Trigger: DragonA
//===========================================================================
function Trig_DragonA_Conditions takes nothing returns boolean
    local unit t=GetEventTargetUnit()
    local unit u
    local integer i
    local integer g
    if  IsUnitType(t, UNIT_TYPE_HERO) == true  then
        set u=GetTriggerUnit()
        set g=GetHeroLevel(u)
        set i=R2I((g-3)/7)
        call IssueTargetOrderById( u, 852095, t )
        call IssueImmediateOrderById( u, 852097 )
        if GetUnitDefaultFlyHeight(u) < 10 then
            call IssueImmediateOrderById( u, 852180 )
        endif
        call SetUnitAbilityLevel(u,'A03L',i)
        call SetUnitAbilityLevel(u,'A03J',i)
        call SetPlayerTechResearched(GetTriggerPlayer(), 'R007', R2I((g-6)/4))
        call SetUnitAbilityLevel(u,'A03I',1+GetUnitAbilityLevel(u,'B01T'))
    endif
    set t=null
    set u=null
    return false
endfunction


//===========================================================================
function InitTrig_DragonA takes nothing returns nothing
    set gg_trg_DragonA = CreateTrigger(  )
    call DisableTrigger( gg_trg_DragonA )
    call TriggerAddCondition( gg_trg_DragonA, Condition( function Trig_DragonA_Conditions ) )
endfunction
