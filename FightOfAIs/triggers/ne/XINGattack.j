
//===========================================================================
// Trigger: XINGattack
//===========================================================================
function Trig_XINGattack_Conditions takes nothing returns boolean
    local unit t=GetEventTargetUnit()
    local unit u=GetTriggerUnit()
    local integer i=GetConvertedPlayerId(GetTriggerPlayer())
    local real r=GetHeroStr(u, true)*(1-(GetUnitState(u, UNIT_STATE_LIFE)/GetUnitState(u, UNIT_STATE_MAX_LIFE)))
    
    if udg_UGharm[i]>r then
        set udg_UGharm[i]=udg_UGharm[i]-r
        call DestroyEffect( AddSpecialEffectTarget("war3mapImported\\AncientsWrath.mdx", t, "chest") )
        call UnitDamageTarget( u, t, r, true, true, ATTACK_TYPE_CHAOS, DAMAGE_TYPE_UNIVERSAL, WEAPON_TYPE_WHOKNOWS )
    elseif udg_UGharm[i]<r and udg_UGharm[i]>0 then
        set udg_UGharm[i]=0
        call DestroyEffect( AddSpecialEffectTarget("war3mapImported\\AncientsWrath.mdx", t, "chest") )
        call UnitDamageTarget( u, t, udg_UGharm[i], true, true, ATTACK_TYPE_CHAOS, DAMAGE_TYPE_UNIVERSAL, WEAPON_TYPE_WHOKNOWS )
    endif
    
    if  IsUnitType(t, UNIT_TYPE_HERO) == true  then
        call IssueImmediateOrderById( u, 852183 )
    endif
    set u=null
    set t=null
    return false
endfunction



//===========================================================================
function InitTrig_XINGattack takes nothing returns nothing
    set gg_trg_XINGattack = CreateTrigger(  )
    call DisableTrigger( gg_trg_XINGattack )
    call TriggerAddCondition( gg_trg_XINGattack, Condition( function Trig_XINGattack_Conditions ) )
endfunction
