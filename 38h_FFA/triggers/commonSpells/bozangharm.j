
//===========================================================================
// Trigger: bozangharm
//
// call TriggerRegisterUnitEvent( gg_trg_bozangharm, u, EVENT_UNIT_DAMAGED )
// local unit u=GetTriggerUnit()
// local real h=GetEventDamage()
// local real r=GetUnitState(u, UNIT_STATE_LIFE)-h
// local timer tm
//     if GetUnitAbilityLevel(u,'B02B')>0 then//薄葬
//     if r>0 then
//     call SetUnitState( u, UNIT_STATE_LIFE, r )
//     else
//     call SetUnitInvulnerable( u, true )
//     set tm=CreateTimer()
//     call SaveUnitHandle(udg_Hash2,GetHandleId(tm),1,u)
//     call TimerStart(tm,0.02,false,function bozangactcc)
//     call SetUnitState( u, UNIT_STATE_LIFE, 1 ) 
//     endif
//     endif
// set tm=null
// set u=null
// function bozangactcc takes nothing returns nothing
// local timer tm=GetExpiredTimer()
// local integer i=GetHandleId(tm)
// local unit u=LoadUnitHandle(udg_Hash2,i,1)
// call SetUnitInvulnerable( u, false )
// call FlushChildHashtable( udg_Hash2, i )
// call PauseTimer(tm)
// call DestroyTimer(tm)
// set tm=null
// set u=null
// endfunction
//===========================================================================
function Trig_bozangharm_Conditions takes nothing returns boolean
    return GetEventDamage()<6000 
endfunction



function Trig_bozangharm_Actions takes nothing returns nothing
local unit u=GetTriggerUnit()
local real h=GetEventDamage()
local real r=GetUnitState(u, UNIT_STATE_LIFE)-h
    
    if LoadInteger(udg_Hash3,GetHandleId(u),619)==1 then//多人重选技能模式下不能用
    if r>1 then
    else
    call SetUnitState( u, UNIT_STATE_LIFE, 1+h ) 
    endif
    endif
set u=null
endfunction

//===========================================================================
function InitTrig_bozangharm takes nothing returns nothing
    set gg_trg_bozangharm = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_bozangharm, Condition( function Trig_bozangharm_Conditions ) )
    call TriggerAddAction( gg_trg_bozangharm, function Trig_bozangharm_Actions )
endfunction
