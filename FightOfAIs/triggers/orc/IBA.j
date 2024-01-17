
//===========================================================================
// Trigger: IBA
//===========================================================================
function Trig_IBA_Conditions takes nothing returns boolean
    local unit u=GetTriggerUnit()
    local integer level=GetHeroLevel(u)
    local integer i=R2I((level-3)/7)
    local integer n=GetConvertedPlayerId(GetTriggerPlayer())
    call SetUnitAbilityLevel( u, 'A09K', i )
    call SetUnitAbilityLevel( u, 'A09J', i )
    call IssueImmediateOrderById( u, 852526 )
    call IssueTargetOrderById( u, 852095, GetEventTargetUnit())
    
    if GetUnitAbilityLevel(u,'B028')>0 then
        set udg_Chaoxi[n]=  udg_Chaoxi[n]+1
    else
        set udg_Chaoxi[n]=i
    endif
    if udg_Chaoxi[n]>=20+level then
        set udg_Chaoxi[n]=20+level
    endif
    call UnitAddAbility(u,'A09M')
    call UnitRemoveAbility(u,'A09M')
    call SetUnitAbilityLevel(u,'A02P',udg_Chaoxi[n])
    call SetUnitMoveSpeed( u, GetUnitDefaultMoveSpeed(u)+(4*udg_Chaoxi[n]) )
    set u=null
    return false
endfunction



//===========================================================================
function InitTrig_IBA takes nothing returns nothing
    set gg_trg_IBA = CreateTrigger(  )
    call DisableTrigger( gg_trg_IBA )
    call TriggerAddCondition( gg_trg_IBA, Condition( function Trig_IBA_Conditions ) )
endfunction
