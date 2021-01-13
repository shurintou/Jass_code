
//===========================================================================
// Trigger: TypeOrder
//
// (udg_Hash2,GetHandleId(u),15 ) um指令的计时器
//===========================================================================
function ShowUnitA takes nothing returns nothing
local timer tm=GetExpiredTimer()
local integer i=GetHandleId(tm)
local unit u=LoadUnitHandle(udg_Hash2,i,1)
local integer n=GetRandomInt(1,8)

call SetUnitPathing( u, true )
call RefreshColor(u)
call RefreshScale(u)
call UnitAddAbility( u, 'Amrf' )
call UnitRemoveAbility( u, 'Amrf' )
call SetUnitFlyHeight(  u, GetUnitDefaultFlyHeight(u), 2000.00 )
call SetUnitTurnSpeed( u, GetUnitDefaultTurnSpeed(u) )
if GetUnitAbilityLevel(u,'Amgl')>0 then//小招没有恢复
call RefreshSmallAbility(u)
endif 
if GetUnitAbilityLevel(u,'Amgr')>0 then//大招没有恢复
call RefreshBigAbility(u)
endif 
call SetUnitX(u,udg_ReviveX[n])
call SetUnitY(u,udg_ReviveY[n])
call PanCameraToForPlayer( GetOwningPlayer(u),udg_ReviveX[n], udg_ReviveY[n] )
call DisplayTextToPlayer( GetOwningPlayer(u), 0, 0, "你的英雄已经重新回到地图上。")
call ShowUnit( u, true )
call FlushChildHashtable( udg_Hash2, i )
call PauseTimer(tm)
call DestroyTimer(tm)

set tm=null
set u=null
endfunction


function HideUnit takes unit u returns nothing
local integer n=GetHandleId(u)
local timer tm=LoadTimerHandle(udg_Hash2,n,15)

if tm!=null then
call DisplayTextToPlayer( GetOwningPlayer(u), 0, 0, "系统正在处理中，请稍候。")
else
set tm=CreateTimer()
call SaveTimerHandle(udg_Hash2,n,15,tm)
call SaveUnitHandle(udg_Hash2,GetHandleId(tm),1,u)
call TimerStart(tm,60,false,function ShowUnitA)
call DisplayTextToPlayer( GetOwningPlayer(u), 0, 0, "你的英雄将在60秒后重新出现在地图上。")
endif

set tm=null
endfunction



function Trig_TypeOrder_Actions takes nothing returns nothing
local player p=GetTriggerPlayer()
local unit u=udg_PlayerLockToHero[GetConvertedPlayerId(p)]

if GetEventPlayerChatString() == "-ms" then
call DisplayTextToPlayer( p, 0, 0, "移动速度:"+R2S(GetUnitMoveSpeed(u)))
else
if GetEventPlayerChatString() == "-roll" then
call DisplayTextToForce( udg_OnlinePlayer, GetPlayerName(p)+"掷出了"+I2S(GetRandomInt(1, 100)) )
else
if GetEventPlayerChatString() == "-um" then//单位被卡住
call ShowUnit( u, false )
call HideUnit(u)
else
endif
endif
endif

set p=null
set u=null
endfunction

//===========================================================================
function InitTrig_TypeOrder takes nothing returns nothing
    set gg_trg_TypeOrder = CreateTrigger(  )
    call TriggerAddAction( gg_trg_TypeOrder, function Trig_TypeOrder_Actions )
endfunction
