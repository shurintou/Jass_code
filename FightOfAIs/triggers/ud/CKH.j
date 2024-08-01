
//===========================================================================
// Trigger: CKH
//===========================================================================
function Trig_CKH_Conditions takes nothing returns boolean
    local unit u= GetTriggerUnit()
    local real h=GetEventDamage()
    local real hp=GetUnitState(u, UNIT_STATE_LIFE)
    local real hm=GetUnitState(u, UNIT_STATE_MAX_LIFE)
    local real dh=hm-hp
    local integer i=GetConvertedPlayerId(GetTriggerPlayer())
    if h>dh then
        if udg_UGharm[i]>dh then
            call SetUnitState( u, UNIT_STATE_LIFE, hm )
            set udg_UGharm[i]=udg_UGharm[i]-dh
        else
            set udg_UGharm[i]=0
            call UnitRemoveAbility(u,'A059')
            call SetUnitState( u, UNIT_STATE_LIFE, hp+udg_UGharm[i] )
        endif
    else
        if udg_UGharm[i]>h then
            set udg_UGharm[i]=udg_UGharm[i]-h
            call SetUnitState( u, UNIT_STATE_LIFE, hp+h )
        else
            set udg_UGharm[i]=0
            call UnitRemoveAbility(u,'A059')
            call SetUnitState( u, UNIT_STATE_LIFE, hp+udg_UGharm[i] )
        endif
    endif
    set u=null
    return false
endfunction



//===========================================================================
function InitTrig_CKH takes nothing returns nothing
    set gg_trg_CKH = CreateTrigger(  )
    call DisableTrigger( gg_trg_CKH )
    call TriggerAddCondition( gg_trg_CKH, Condition( function Trig_CKH_Conditions ) )
endfunction
