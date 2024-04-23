
//===========================================================================
// Trigger: WLH
//===========================================================================
function addhpwithjianmo takes nothing returns nothing
    local timer tm=GetExpiredTimer()
    local integer i=GetHandleId(tm)
    local unit u=LoadUnitHandle(udg_hash, i, 1)
    local integer n=LoadInteger(udg_hash, i, 5)
    
    if n>0 then
        call SaveInteger(udg_hash,i,5,n-1)
        call SetUnitState( u, UNIT_STATE_LIFE,LoadReal(udg_hash,i,3)+GetUnitState(u, UNIT_STATE_LIFE))
    else
        call UnitRemoveAbility(u,'Avul')
        call PauseUnit( u, false)
        call FlushChildHashtable( udg_hash, i )
        call PauseTimer(tm)
        call DestroyTimer(tm)
    endif
    set tm=null
    set u=null
endfunction



function Revivewithjianmo takes unit u,integer n returns nothing
    local timer tm=CreateTimer()
    local integer i=GetHandleId(tm)
    call SaveInteger(udg_hash,i,5,20)
    call SaveUnitHandle(udg_hash,i,1,u)
    if n>125 then
        set n=125
    endif
    call SaveReal(udg_hash,i,3,n*0.0004*GetUnitState(u, UNIT_STATE_MAX_LIFE))
    call TimerStart(tm,0.2,true,function addhpwithjianmo)
    set tm=null
endfunction

function Trig_WLH_Conditions takes nothing returns boolean
    local unit u= GetTriggerUnit()
    local integer i=GetConvertedPlayerId(GetTriggerPlayer())
    
    set udg_Chaoxi[i]=udg_Chaoxi[i]+1+GetUnitAbilityLevel(u,'B01T')
    call IssueTargetOrderById( u, 852095, GetEventDamageSource() )
    if GetUnitState(u, UNIT_STATE_LIFE)-GetEventDamage() <2 then
        if udg_Chaoxi[i]>100 then
            set udg_Chaoxi[i]=udg_Chaoxi[i]-100
            call UnitAddAbility(u,'Avul')
            call UnitRemoveAbility(u,'A06M')
            call SetUnitState( u, UNIT_STATE_LIFE,1)
            call PauseUnit( u, true )
            call SetUnitAnimationByIndex( u, 13 )
            call Revivewithjianmo(u,20+udg_Chaoxi[i])
            set udg_Chaoxi[i]=0
        endif
    else
        if udg_Chaoxi[i]>100 then
            call UnitAddAbility(u,'A06M')
        else
            call UnitRemoveAbility(u,'A06M')
        endif
    endif
    
    set u=null
    return false
endfunction



//===========================================================================
function InitTrig_WLH takes nothing returns nothing
    set gg_trg_WLH = CreateTrigger(  )
    call DisableTrigger( gg_trg_WLH )
    call TriggerAddCondition( gg_trg_WLH, Condition( function Trig_WLH_Conditions ) )
endfunction
