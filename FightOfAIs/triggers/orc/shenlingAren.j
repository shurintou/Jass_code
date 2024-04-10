
//===========================================================================
// Trigger: shenlingAren
//===========================================================================
function Trig_shenlingAren_Conditions takes nothing returns boolean
    local unit u=GetTriggerUnit()
    local unit m
    local unit t=GetEventTargetUnit()
    local real r=GetUnitState(u, UNIT_STATE_MAX_LIFE)
    
    if GetUnitState(u, UNIT_STATE_LIFE)/r >0.5 and IsUnitType(t, UNIT_TYPE_STRUCTURE) == false then
        set m=CreateUnit(getcorrectplayer(u),'o001',GetUnitX(u),GetUnitY(u),GetUnitFacing(u))
        call SetUnitAbilityLevel(m,'AEpa',R2I((GetHeroLevel(u)-5)/5))
        call UnitDamageTarget( t, u, 0.01*r, true, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
        call IssueTargetOrderById( m, 851985, t)
        call UnitApplyTimedLife( m, 'BTLF', 1.50 )
    endif
    
    if  IsUnitType(t, UNIT_TYPE_HERO) == true then
        call IssueTargetOrderById( u, 852095, t )
    endif
    
    set u=null
    set m=null
    set t=null
    return false
endfunction



//===========================================================================
function InitTrig_shenlingAren takes nothing returns nothing
    set gg_trg_shenlingAren = CreateTrigger(  )
    call DisableTrigger( gg_trg_shenlingAren )
    call TriggerAddCondition( gg_trg_shenlingAren, Condition( function Trig_shenlingAren_Conditions ) )
endfunction
