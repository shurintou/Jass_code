
//===========================================================================
// Trigger: BuyToRevive
//
// function deadxiangwei takes unit u returns nothing
// local timer tm=LoadTimerHandle(udg_Hash3,GetHandleId(u),6)
// local integer m=GetHandleId(tm)
// local integer i=0
// local integer n=0
// local item t=LoadItemHandle(udg_Hash3,m,2)
// loop
// exitwhen i>5
// if GetItemTypeId(UnitItemInSlot(u, i)) == 'I01D' then
// set n=i
// set i=10
// else
// set i=i+1
// endif
// endloop
// call UnitRemoveAbility( u, 'B00R' )
// call SetUnitPathing( u, true )
// call RemoveItem( UnitItemInSlot(u, n) )
// call SetItemVisible( t, true )
// call UnitAddItemToSlotById( u, 'tmmt', n )
// call RemoveItem(t)
// call PauseTimer(tm)
// call FlushChildHashtable( udg_Hash3, m )
// call DestroyTimer(tm)
// set tm=null
// set t=null
// endfunction
//===========================================================================
function Trig_BuyToRevive_Actions takes nothing returns nothing
local unit u=GetTriggerUnit()
local integer e=GetHandleId(u)
local timer tm=LoadTimerHandle(udg_Hash2,e,20 )
local integer i=GetHandleId(tm)
local integer n=GetRandomInt(1,8)
local player p=GetOwningPlayer(u)
local real r
local integer level=GetUnitAbilityLevel(u,'Acdb')//醉拳

call UnitRemoveAbility(u,'A09C')//删除猛犸授予力量
call UnitRemoveAbility(u,'B030')
call UnitRemoveAbility(u,'A08Y')//删除白虎大招效果
call ShowUnit( udg_Bag[GetConvertedPlayerId(GetOwningPlayer(u))], true )
///////////////////////////////////////恢复单位各种BUG状态////////////////////////////////////////////////////////////
if ciwh(u,'I01D')>=1 then
call deadxiangwei(u)
endif
call SetUnitPathing( u, true )

if level>0 then //调整颜色
call SetUnitVertexColor( u, LoadInteger(udg_Hash2,e,10002), LoadInteger(udg_Hash2,e,10003), LoadInteger(udg_Hash2,e,10004), R2I(255-(level/100)*255) )
else
call SetUnitVertexColor( u, LoadInteger(udg_Hash2,e,10002), LoadInteger(udg_Hash2,e,10003), LoadInteger(udg_Hash2,e,10004),255)
endif

call UnitRemoveAbility(u,'A02A')
set r=LoadReal(udg_Hash2,e,10001)
call SetUnitScale( u, r, r, r )///恢复大小

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
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

call SetUnitX(u,udg_ReviveX[n])
call SetUnitY(u,udg_ReviveY[n])

call SetUnitState( u, UNIT_STATE_MANA, GetUnitState(u, UNIT_STATE_MAX_MANA) )
call PanCameraToForPlayer( GetOwningPlayer(u),udg_ReviveX[n], udg_ReviveY[n] )
if TimerGetRemaining(tm) > 0 then
call DisplayTimedTextToForce( udg_OnlinePlayer, 30, udg_YANSE[GetConvertedPlayerId(GetOwningPlayer(u))]+GetUnitName(u)+"|r买活了！")
else
call DisplayTimedTextToForce( udg_OnlinePlayer, 30, udg_YANSE[GetConvertedPlayerId(GetOwningPlayer(u))]+GetUnitName(u)+"|r复活了！")
endif
call FlushChildHashtable( udg_Hash2, i )
call PauseTimer(tm)
call DestroyTimer(tm)

call IssueNeutralTargetOrderById(p, gg_unit_nmer_0003, 852566, u )
call IssueNeutralTargetOrderById(p, gg_unit_nmr5_0105, 852566, u )
call IssueNeutralTargetOrderById(p, gg_unit_nmr2_0021, 852566, u )
call IssueNeutralTargetOrderById(p, gg_unit_nmr6_0106, 852566, u )
call IssueNeutralTargetOrderById(p, gg_unit_nmr3_0090, 852566, u )
call IssueNeutralTargetOrderById(p, gg_unit_nmr7_0107, 852566, u )
call IssueNeutralTargetOrderById(p, gg_unit_utom_0132, 852566, u )
call IssueNeutralTargetOrderById(p, gg_unit_ovln_0129, 852566, u )
call IssueNeutralTargetOrderById(p, gg_unit_ngme_0005, 852566, u )
call IssueNeutralTargetOrderById(p, gg_unit_eden_0131, 852566, u )
call IssueNeutralTargetOrderById(p, gg_unit_ngad_0133, 852566, u )
call IssueNeutralTargetOrderById(p, gg_unit_nmrd_0136, 852566, u )
call IssueNeutralTargetOrderById(p, gg_unit_nmr4_0135, 852566, u )
call IssueNeutralTargetOrderById(p, gg_unit_hvlt_0020, 852566, u )
call IssueNeutralTargetOrderById(p, gg_unit_nmr0_0138, 852566, u )
call IssueNeutralTargetOrderById(p, gg_unit_nmrf_0134, 852566, u )

call PauseUnit( u, false )
call SetUnitTimeScalePercent( u, 100 )
call SetUnitTurnSpeed( u, GetUnitDefaultTurnSpeed(u) )

set tm=null
set u=null
set p=null
endfunction

//===========================================================================
function InitTrig_BuyToRevive takes nothing returns nothing
    set gg_trg_BuyToRevive = CreateTrigger(  )
    call TriggerAddAction( gg_trg_BuyToRevive, function Trig_BuyToRevive_Actions )
endfunction
