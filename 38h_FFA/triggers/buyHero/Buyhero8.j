
//===========================================================================
// Trigger: Buyhero8
//===========================================================================
function Trig_Buyhero8_Actions takes nothing returns nothing
local unit u= GetSoldUnit()
local integer i=GetUnitTypeId(u)
local player p=GetOwningPlayer(u)
local integer n=1
local integer g=GetConvertedPlayerId(p)
local multiboarditem mbi
local integer t=GetRandomInt(1,8)

call SetUnitX(u,udg_ReviveX[t])
call SetUnitY(u,udg_ReviveY[t])
call PanCameraToForPlayer( p,udg_ReviveX[t], udg_ReviveY[t] )
call SaveInteger(udg_Hash2,GetHandleId(u),25,1)
//call RemoveUnit( GetBuyingUnit() )
call SetPlayerName( p,  udg_PlayerName[g] +"("+ GetUnitName(u)+")"  )
set mbi=MultiboardGetItem(udg_BlackBoard,g,1)
call MultiboardSetItemValue(mbi,udg_YANSE[g]+GetPlayerName(p)+"|r")
call MultiboardReleaseItem(mbi)
//call SetUnitColor( u, PLAYER_COLOR_BLUE )
if udg_Test==true then
else
call SetPlayerMaxHeroesAllowed(0,p)
endif
set udg_lsmb=MultiboardGetItem(udg_BlackBoard,g,0)
set udg_PlayerLockToHero[GetConvertedPlayerId(p)]=u//将玩家与英雄绑定起来，索引号为1-12

if i=='Nmag' then//火枪
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNRifleman.blp" )
call TriggerRegisterUnitEvent( gg_trg_longlonglong, u, EVENT_UNIT_HERO_SKILL )
call TriggerRegisterUnitEvent( gg_trg_AnshaJieShu, u, EVENT_UNIT_SPELL_ENDCAST )
call TriggerRegisterUnitEvent( gg_trg_AnshaJieShu, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent( gg_trg_AnshaZhunbei, u, EVENT_UNIT_SPELL_CHANNEL )
call SaveInteger(udg_Hash3,GetHandleId(u),336,'A0BA')
else
if i=='O001' then//熊战
call SetPlayerAbilityAvailable( p, 'A0BL', false )
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNFurbolgTracker.blp" )
call TriggerRegisterUnitEvent( gg_trg_chaoqiangstrong, u, EVENT_UNIT_TARGET_IN_RANGE )
call TriggerRegisterUnitEvent( gg_trg_panduanchaoqiang, u, EVENT_UNIT_DAMAGED )
call TriggerRegisterUnitEvent( gg_trg_spellchaoqiang, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent( gg_trg_jinu, u, EVENT_UNIT_SPELL_EFFECT )
else
if i=='E003' then//德鲁伊
call TriggerRegisterUnitEvent( gg_trg_learnrrrrrr, u, EVENT_UNIT_HERO_SKILL )
call TriggerRegisterUnitEvent( gg_trg_dazhaokeji, u, EVENT_UNIT_HERO_SKILL )
call TriggerRegisterUnitEvent( gg_trg_zhaohuanxiong, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent( gg_trg_zhandouhoujiao, u, EVENT_UNIT_SPELL_EFFECT )
call SaveUnitHandle(udg_Hash1,GetHandleId(gg_trg_zhaohuanxiong),1,u)
call TriggerRegisterUnitEvent( gg_trg_deadxiong, u, EVENT_UNIT_DEATH )
call SetPlayerAbilityAvailable( p, 'A0BS', false )
call SaveInteger(udg_Hash3,GetHandleId(u),336,'A0BS')
else
if i=='U004' then//深渊幽灵
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNDeepLordRevenant.blp" )
call TriggerRegisterUnitEvent( gg_trg_CCCkaominjie, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent( gg_trg_tongmozhijing, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent( gg_trg_xuetongmo, u, EVENT_UNIT_HERO_SKILL )
call TriggerRegisterUnitEvent( gg_trg_xueCCC, u, EVENT_UNIT_HERO_SKILL )
call SaveUnitHandle(udg_Hash1,GetHandleId(gg_trg_CCCkaominjie),1,u)
call TriggerRegisterUnitEvent( gg_trg_chongneng, u, EVENT_UNIT_DAMAGED )
else
if i=='U003' then//骷髅射手
call TriggerRegisterUnitEvent( gg_trg_lvlupchaodu, u, EVENT_UNIT_HERO_LEVEL )
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNSkeletalOrc.blp" )
call TriggerRegisterUnitEvent( gg_trg_zhushenhuanghun, u, EVENT_UNIT_SPELL_EFFECT )
else
if i=='O00C' then//武器
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNHeroBlademaster.blp" )
call TriggerRegisterUnitEvent( gg_trg_wuqiluanwu, u, EVENT_UNIT_SPELL_EFFECT )
call DisableTrigger( gg_trg_buzhuowuqi )
call DisableTrigger( gg_trg_buzhuomubiaodanwei )
call SetPlayerAbilityAvailable( p, 'A0D0', false )
call TriggerRegisterUnitEvent( gg_trg_learnluanwu, u, EVENT_UNIT_HERO_SKILL )
call TriggerRegisterUnitEvent( gg_trg_buzhuowuqi, u, EVENT_UNIT_DAMAGED )
call TriggerRegisterUnitEvent( gg_trg_buzhuomubiaodanwei, u, EVENT_UNIT_TARGET_IN_RANGE )
call TriggerRegisterUnitEvent( gg_trg_dedaoshengjian, u, EVENT_UNIT_PICKUP_ITEM )
call TriggerRegisterPlayerUnitEventSimple( gg_trg_fengkuangshalu, p, EVENT_PLAYER_UNIT_ISSUED_ORDER )
call TriggerRegisterPlayerUnitEventSimple( gg_trg_yichudanweizu, p, EVENT_PLAYER_UNIT_ISSUED_TARGET_ORDER )
call TriggerRegisterPlayerUnitEventSimple( gg_trg_siwangsiwang, p, EVENT_PLAYER_UNIT_DEATH )
call TriggerRegisterUnitEvent( gg_trg_attackwithfengkuang, u, EVENT_UNIT_TARGET_IN_RANGE )
call TriggerRegisterUnitEvent( gg_trg_walkaournd, u, EVENT_UNIT_ISSUED_POINT_ORDER )
call SaveGroupHandle(udg_Hash1,GetHandleId(gg_trg_fengkuangshalu),2,CreateGroup())
call SaveUnitHandle(udg_Hash1,GetHandleId(gg_trg_fengkuangshalu),1,u)
else
endif
endif
endif
endif
endif
endif
call unaviliable(i)
call SaveInteger(udg_Hash2,GetHandleId(u),8529,2)//1为力量2为敏捷3为智力
call SaveInteger(udg_Hash3,GetHandleId(u),332,0)
call SaveInteger(udg_Hash3,GetHandleId(u),333,0)
call TriggerRegisterUnitEvent( gg_trg_ReduceWave, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent( gg_trg_BuyToRevive, u, EVENT_UNIT_HERO_REVIVE_FINISH )
call TriggerRegisterUnitEvent( gg_trg_attacked, u, EVENT_UNIT_ATTACKED )
call TriggerRegisterUnitEvent( gg_trg_GetItem, u, EVENT_UNIT_PICKUP_ITEM )
call TriggerRegisterUnitEvent( gg_trg_UseItem, u, EVENT_UNIT_SPELL_EFFECT )
call AddGetHarmTrigger(u)
call TriggerRegisterUnitEvent( gg_trg_chenmoshushi, u, EVENT_UNIT_SPELL_ENDCAST )
call TriggerRegisterUnitEvent( gg_trg_LearnAbility, u, EVENT_UNIT_HERO_SKILL )
call TriggerRegisterUnitEvent( gg_trg_HeroDead, u, EVENT_UNIT_DEATH )
call GroupAddUnit( udg_CheckHpGroup, u )
call MultiboardReleaseItem(udg_lsmb)
set mbi=null
set u=null
set p=null
endfunction

//===========================================================================
function InitTrig_Buyhero8 takes nothing returns nothing
    set gg_trg_Buyhero8 = CreateTrigger(  )
    call TriggerRegisterUnitEvent( gg_trg_Buyhero8, gg_unit_nmre_0111, EVENT_UNIT_SELL )
    call TriggerAddAction( gg_trg_Buyhero8, function Trig_Buyhero8_Actions )
endfunction
