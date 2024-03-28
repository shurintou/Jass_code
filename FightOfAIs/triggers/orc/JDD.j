
//===========================================================================
// Trigger: JDD
//===========================================================================
function Trig_JDD_Conditions takes nothing returns boolean
    local unit t=GetAttacker()
    local unit m
    local unit u
    if IsUnitType(t, UNIT_TYPE_STRUCTURE) == false  and IsUnitType(t, UNIT_TYPE_MECHANICAL) ==false and GetUnitAbilityLevel(t,'Aloc')==0 then
        set u=GetTriggerUnit()
        set m=CreateUnit(getcorrectplayer(u),'o007',GetUnitX(u),GetUnitY(u),GetUnitFacing(u))
        call SetUnitAbilityLevel(m,'Apoi',R2I((GetHeroLevel(u)-2)/7))
        call IssueTargetOrderById( m, 851985, t)
        call UnitApplyTimedLife( m, 'BTLF', 1.50 )
    endif
    set u=null
    set t=null
    set m=null
    return false
endfunction



//===========================================================================
function InitTrig_JDD takes nothing returns nothing
    set gg_trg_JDD = CreateTrigger(  )
    call DisableTrigger( gg_trg_JDD )
    call TriggerAddCondition( gg_trg_JDD, Condition( function Trig_JDD_Conditions ) )
endfunction
