
//===========================================================================
// Trigger: GodHand
//===========================================================================
function Trig_GodHand_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A06Z' 
endfunction


function removesunlight takes nothing returns nothing
    local timer tm=GetExpiredTimer()
    local integer m=GetHandleId(tm)
    local integer i=LoadInteger(udg_Hash1, m, 3)
    call EnableWeatherEffect( udg_weather[i], false )
    call RemoveWeatherEffect( udg_weather[i] )
    set udg_weather[i]=null
    call FlushChildHashtable( udg_Hash1, m )
    call PauseTimer(tm)
    call DestroyTimer(tm)
set tm=null
endfunction


function GodHandRevive takes unit u returns nothing
local timer tm=LoadTimerHandle(udg_Hash2,GetHandleId(u),20 )
local integer i=GetHandleId(tm)
local integer n=GetRandomInt(1,8)
local player p=GetOwningPlayer(u)

call ReviveHero( u, udg_ReviveX[n], udg_ReviveY[n], true )
call ShowUnit( udg_Bag[GetConvertedPlayerId(GetOwningPlayer(u))], true )
///////////////////////////////////////恢复单位各种BUG状态////////////////////////////////////////////////////////////
if ciwh(u,'I01D')>=1 then
call deadxiangwei(u)
endif
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
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
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


call SetUnitState( u, UNIT_STATE_MANA, GetUnitState(u, UNIT_STATE_MAX_MANA) )
call PanCameraToForPlayer( GetOwningPlayer(u),udg_ReviveX[n], udg_ReviveY[n] )
call DisplayTimedTextToForce( udg_OnlinePlayer, 30, udg_YANSE[GetConvertedPlayerId(GetOwningPlayer(u))]+GetUnitName(u)+"|r复活了！")
call FlushChildHashtable( udg_Hash2, i )
call PauseTimer(tm)
call DestroyTimer(tm)

set p=null
set tm=null
endfunction 


function godhandact takes nothing returns nothing
local unit u=GetEnumUnit()

if IsUnitEnemy(u, GetOwningPlayer(udg_lsu)) == false  then
call SetUnitState( u, UNIT_STATE_LIFE, GetUnitState(u, UNIT_STATE_LIFE)+ 100*(GetUnitAbilityLevel(udg_lsu, 'A06Z')+1) )
call DestroyEffect( AddSpecialEffectTarget("Abilities\\Spells\\Human\\Resurrect\\ResurrectTarget.mdl", u, "origin") )
if TimerGetRemaining(LoadTimerHandle(udg_Hash2,GetHandleId(u),20 ))>0 then
call GodHandRevive(u)
endif
endif

set u=null
endfunction

function Trig_GodHand_Actions takes nothing returns nothing
local timer tm=CreateTimer()
local integer i=GetHandleId(tm)
local integer n=1
local integer g=0
    loop
    exitwhen g==5
    if udg_weather[n]==null then
    set udg_weather[n]=AddWeatherEffect(GetPlayableMapRect(), 'LRaa')
    call EnableWeatherEffect( udg_weather[n], true )
    set g=5
    else
    set n=n+1
    endif
    endloop
    call SaveInteger(udg_Hash1,i,3,n)
    call TimerStart(tm,25,false,function removesunlight)
set udg_lsu=GetTriggerUnit()
call DisableTrigger( gg_trg_BuyToRevive )
call ForGroup(udg_CheckHpGroup,function godhandact)
call EnableTrigger( gg_trg_BuyToRevive )
set tm=null
endfunction

//===========================================================================
function InitTrig_GodHand takes nothing returns nothing
    set gg_trg_GodHand = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_GodHand, Condition( function Trig_GodHand_Conditions ) )
    call TriggerAddAction( gg_trg_GodHand, function Trig_GodHand_Actions )
endfunction
