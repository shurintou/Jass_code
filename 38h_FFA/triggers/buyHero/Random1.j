
//===========================================================================
// Trigger: Random1
//
// udg_Hash2,101,1,0    1为选了，0为没有选
// 101---109  分别是9个酒馆，依次类推
// call TriggerRegisterUnitEvent( gg_trg_FulanOn, u, EVENT_UNIT_ISSUED_ORDER )
// call TriggerRegisterUnitEvent( gg_trg_FulanOff, u, EVENT_UNIT_ISSUED_ORDER )
// call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNAbomination.blp" )
// call TriggerRegisterUnitEvent( gg_trg_gouzi, u, EVENT_UNIT_SPELL_EFFECT )
// call TriggerRegisterUnitEvent( gg_trg_FreshMeat, u, EVENT_UNIT_SPELL_EFFECT )
// 风行要不要弄公共触发
//===========================================================================
function random9 takes player p returns integer
local unit u
local integer i=GetRandomInt(1,6)//英雄满了就12
local integer n=1
local integer g=GetConvertedPlayerId(p)
local multiboarditem mbi
local integer t=GetRandomInt(1,8)
set udg_lsmb=MultiboardGetItem(udg_BlackBoard,g,0)
if LoadInteger(udg_Hash2,109,i)==1 then//已被选了的话
set u=null
set mbi=null
return 0
endif

if i==1 then//40龙
set u=CreateUnit(p,'Uear',0,0,270)
call SaveUnitHandle(udg_Hash1,GetHandleId(gg_trg_Zhuanyishanghai),1,u)
call SaveGroupHandle(udg_Hash1,GetHandleId(gg_trg_Zhuanyishanghai),4,CreateGroup())
call TriggerRegisterUnitEvent( gg_trg_Zhuanyishanghai, u, EVENT_UNIT_DAMAGED )
call TriggerRegisterPlayerUnitEventSimple( gg_trg_jiagongsiling, p, EVENT_PLAYER_UNIT_SUMMON )
call TriggerRegisterPlayerUnitEventSimple( gg_trg_Deadzhaohuan, p, EVENT_PLAYER_UNIT_DEATH )
call TriggerRegisterUnitEvent( gg_trg_learnsiling, u, EVENT_UNIT_HERO_SKILL )
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNSpiritWyvern.blp" )
else
if i==2 then//风行
set u=CreateUnit(p,'H00A',0,0,270)
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNSylvanusWindrunner.blp" )
call SaveUnitHandle(udg_Hash1,GetHandleId(gg_trg_qianglijianyu),1,u)
call TimerStart(CreateTimer(),1,true,function movefengxing)
call TriggerRegisterUnitEvent( gg_trg_shufuzhijian, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent( gg_trg_zhunbeiqiangli, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent( gg_trg_qianglijianyu, u, EVENT_UNIT_SPELL_FINISH )
else
if i==3 then//虾
set u=CreateUnit(p,'O009',0,0,270)
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNLobstrokkBlue.blp" )
call TriggerRegisterUnitEvent( gg_trg_jueduifangyu, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent( gg_trg_zhunbeihuichun, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent( gg_trg_huichun, u, EVENT_UNIT_SPELL_FINISH )
else
if i==4 then//毁灭者
set u=CreateUnit(p,'U007',0,0,270)
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNDestroyer.blp" )
call TriggerRegisterUnitEvent( gg_trg_chaofuhe, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent( gg_trg_zengjiamofazuidazhi, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent( gg_trg_mieshi, u, EVENT_UNIT_SPELL_EFFECT )
else
if i==5 then//死歌
set u=CreateUnit(p,'H00C',0,0,270)
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNAcolyte.blp" )
call TriggerRegisterUnitEvent( gg_trg_songge, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent( gg_trg_zange, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent( gg_trg_xisheng, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent( gg_trg_sigedead, u, EVENT_UNIT_DEATH )
call TriggerRegisterUnitEvent( gg_trg_shoushanghaijianshao, u, EVENT_UNIT_DAMAGED  )
else
if i==6 then//冰龙
set u=CreateUnit(p,'H00B',0,0,270)
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNFrostWyrm.blp" )
call TriggerRegisterUnitEvent( gg_trg_novawwww, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent( gg_trg_lingdudongjie, u, EVENT_UNIT_SPELL_EFFECT )
call SaveUnitHandle(udg_Hash1,GetHandleId( gg_trg_lingdudongjie),1,u)
else
endif
endif
endif
endif
endif 
endif

call SaveInteger(udg_Hash2,109,i,1)
call SaveInteger(udg_Hash2,GetHandleId(u),8529,3)//1为力量2为敏捷3为智力
set udg_PlayerLockToHero[GetConvertedPlayerId(p)]=u//将玩家与英雄绑定起来，索引号为1-12
call SetUnitX(u,udg_ReviveX[t])
call SetUnitY(u,udg_ReviveY[t])
call PanCameraToForPlayer( p,udg_ReviveX[t], udg_ReviveY[t] )
call SaveInteger(udg_Hash2,GetHandleId(u),25,1)
call SetPlayerName( p,  udg_PlayerName[g] +"("+ GetUnitName(u)+")"  )
set mbi=MultiboardGetItem(udg_BlackBoard,g,1)
call MultiboardSetItemValue(mbi,udg_YANSE[g]+GetPlayerName(p)+"|r")
call MultiboardReleaseItem(mbi)
if udg_Test==true then
else
call SetPlayerMaxHeroesAllowed(0,p)
endif
call SaveInteger(udg_Hash3,GetHandleId(u),332,0)
call SaveInteger(udg_Hash3,GetHandleId(u),333,0)
call TriggerRegisterUnitEvent( gg_trg_BuyToRevive, u, EVENT_UNIT_HERO_REVIVE_FINISH )
call TriggerRegisterUnitEvent( gg_trg_attacked, u, EVENT_UNIT_ATTACKED )
call TriggerRegisterUnitEvent( gg_trg_GetItem, u, EVENT_UNIT_PICKUP_ITEM )
call TriggerRegisterUnitEvent( gg_trg_UseItem, u, EVENT_UNIT_SPELL_EFFECT )
call AddGetHarmTrigger(u)
call TriggerRegisterUnitEvent( gg_trg_chenmoshushi, u, EVENT_UNIT_SPELL_ENDCAST )
call TriggerRegisterUnitEvent( gg_trg_LearnAbility, u, EVENT_UNIT_HERO_SKILL )
call TriggerRegisterUnitEvent( gg_trg_ReduceWave, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent( gg_trg_HeroDead, u, EVENT_UNIT_DEATH )
call GroupAddUnit( udg_CheckHpGroup, u )
call MultiboardReleaseItem(udg_lsmb)
set mbi=null
set n=GetUnitTypeId(u)
set u=null
return n

endfunction

function random8 takes player p returns integer
local unit u
local integer i=GetRandomInt(1,6)//英雄满了就12
local integer n=1
local integer g=GetConvertedPlayerId(p)
local multiboarditem mbi
local integer t=GetRandomInt(1,8)
set udg_lsmb=MultiboardGetItem(udg_BlackBoard,g,0)
if LoadInteger(udg_Hash2,108,i)==1 then//已被选了的话
set u=null
set mbi=null
return 0
endif

if i==1 then//火枪
set u=CreateUnit(p,'Nmag',0,0,270)
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNRifleman.blp" )
call TriggerRegisterUnitEvent( gg_trg_longlonglong, u, EVENT_UNIT_HERO_SKILL )
call TriggerRegisterUnitEvent( gg_trg_AnshaJieShu, u, EVENT_UNIT_SPELL_ENDCAST )
call TriggerRegisterUnitEvent( gg_trg_AnshaJieShu, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent( gg_trg_AnshaZhunbei, u, EVENT_UNIT_SPELL_CHANNEL )
call SaveInteger(udg_Hash3,GetHandleId(u),336,'A0BA')
else
if i==2 then//熊战
set u=CreateUnit(p,'O001',0,0,270)
call SetPlayerAbilityAvailable( p, 'A0BL', false )
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNFurbolgTracker.blp" )
call TriggerRegisterUnitEvent( gg_trg_chaoqiangstrong, u, EVENT_UNIT_TARGET_IN_RANGE )
call TriggerRegisterUnitEvent( gg_trg_panduanchaoqiang, u, EVENT_UNIT_DAMAGED )
call TriggerRegisterUnitEvent( gg_trg_spellchaoqiang, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent( gg_trg_jinu, u, EVENT_UNIT_SPELL_EFFECT )
else
if i==3 then//德鲁伊
set u=CreateUnit(p,'E003',0,0,270)
call TriggerRegisterUnitEvent( gg_trg_learnrrrrrr, u, EVENT_UNIT_HERO_SKILL )
call TriggerRegisterUnitEvent( gg_trg_dazhaokeji, u, EVENT_UNIT_HERO_SKILL )
call TriggerRegisterUnitEvent( gg_trg_zhaohuanxiong, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent( gg_trg_zhandouhoujiao, u, EVENT_UNIT_SPELL_EFFECT )
call SaveUnitHandle(udg_Hash1,GetHandleId(gg_trg_zhaohuanxiong),1,u)
call TriggerRegisterUnitEvent( gg_trg_deadxiong, u, EVENT_UNIT_DEATH )
call SetPlayerAbilityAvailable( p, 'A0BS', false )
call SaveInteger(udg_Hash3,GetHandleId(u),336,'A0BS')
else
if i==4 then//深渊幽灵
set u=CreateUnit(p,'U004',0,0,270)
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNDeepLordRevenant.blp" )
call TriggerRegisterUnitEvent( gg_trg_CCCkaominjie, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent( gg_trg_tongmozhijing, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent( gg_trg_xuetongmo, u, EVENT_UNIT_HERO_SKILL )
call TriggerRegisterUnitEvent( gg_trg_xueCCC, u, EVENT_UNIT_HERO_SKILL )
call SaveUnitHandle(udg_Hash1,GetHandleId(gg_trg_CCCkaominjie),1,u)
call TriggerRegisterUnitEvent( gg_trg_chongneng, u, EVENT_UNIT_DAMAGED )
else
if i==5 then//骷髅射手
set u=CreateUnit(p,'U003',0,0,270)
call TriggerRegisterUnitEvent( gg_trg_lvlupchaodu, u, EVENT_UNIT_HERO_LEVEL )
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNSkeletalOrc.blp" )
call TriggerRegisterUnitEvent( gg_trg_zhushenhuanghun, u, EVENT_UNIT_SPELL_EFFECT )
else
if i==6 then//武器
set u=CreateUnit(p,'O00C',0,0,270)
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

call SaveInteger(udg_Hash2,108,i,1)
call SaveInteger(udg_Hash2,GetHandleId(u),8529,2)//1为力量2为敏捷3为智力
set udg_PlayerLockToHero[GetConvertedPlayerId(p)]=u//将玩家与英雄绑定起来，索引号为1-12
call SetUnitX(u,udg_ReviveX[t])
call SetUnitY(u,udg_ReviveY[t])
call PanCameraToForPlayer( p,udg_ReviveX[t], udg_ReviveY[t] )
call SaveInteger(udg_Hash2,GetHandleId(u),25,1)
call SetPlayerName( p,  udg_PlayerName[g] +"("+ GetUnitName(u)+")"  )
set mbi=MultiboardGetItem(udg_BlackBoard,g,1)
call MultiboardSetItemValue(mbi,udg_YANSE[g]+GetPlayerName(p)+"|r")
call MultiboardReleaseItem(mbi)
if udg_Test==true then
else
call SetPlayerMaxHeroesAllowed(0,p)
endif
call SaveInteger(udg_Hash3,GetHandleId(u),332,0)
call SaveInteger(udg_Hash3,GetHandleId(u),333,0)
call TriggerRegisterUnitEvent( gg_trg_BuyToRevive, u, EVENT_UNIT_HERO_REVIVE_FINISH )
call TriggerRegisterUnitEvent( gg_trg_attacked, u, EVENT_UNIT_ATTACKED )
call TriggerRegisterUnitEvent( gg_trg_GetItem, u, EVENT_UNIT_PICKUP_ITEM )
call TriggerRegisterUnitEvent( gg_trg_UseItem, u, EVENT_UNIT_SPELL_EFFECT )
call AddGetHarmTrigger(u)
call TriggerRegisterUnitEvent( gg_trg_chenmoshushi, u, EVENT_UNIT_SPELL_ENDCAST )
call TriggerRegisterUnitEvent( gg_trg_LearnAbility, u, EVENT_UNIT_HERO_SKILL )
call TriggerRegisterUnitEvent( gg_trg_ReduceWave, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent( gg_trg_HeroDead, u, EVENT_UNIT_DEATH )
call GroupAddUnit( udg_CheckHpGroup, u )
call MultiboardReleaseItem(udg_lsmb)
set mbi=null
set n=GetUnitTypeId(u)
set u=null
return n


endfunction

function random7 takes player p returns integer
local unit u
local integer i=GetRandomInt(1,8)//英雄满了就12
local integer n=1
local integer g=GetConvertedPlayerId(p)
local multiboarditem mbi
local integer t=GetRandomInt(1,8)
set udg_lsmb=MultiboardGetItem(udg_BlackBoard,g,0)
if LoadInteger(udg_Hash2,107,i)==1 then//已被选了的话
set u=null
set mbi=null
return 0
endif

if i==1 then//赏金
set u=CreateUnit(p,'O002',0,0,270)
call TriggerRegisterUnitEvent( gg_trg_Tanlan, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent( gg_trg_BaoFu, u, EVENT_UNIT_SPELL_EFFECT )
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNOgre.blp" )
call SaveUnitHandle(udg_Hash1,GetHandleId(gg_trg_BaoFu),1,u)
else
if i==2 then//猩猩
set u=CreateUnit(p,'E002',0,0,270)
call TriggerRegisterUnitEvent( gg_trg_jump, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent( gg_trg_learnnature, u, EVENT_UNIT_HERO_SKILL )
call TriggerRegisterUnitEvent( gg_trg_learnaddstrong, u, EVENT_UNIT_HERO_SKILL )
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNJungleBeast.blp" )
else
if i==3 then//混沌
set u=CreateUnit(p,'O00A',0,0,270)
call TriggerRegisterUnitEvent( gg_trg_zhimingyijiC, u, EVENT_UNIT_TARGET_IN_RANGE )
call TriggerRegisterUnitEvent( gg_trg_hunluanC, u, EVENT_UNIT_SPELL_EFFECT )
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNChaosWarlord.blp" )
else
if i==4 then//圣骑士
set u=CreateUnit(p,'H009',0,0,270)
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNHeroPaladin.blp" )
call TriggerRegisterUnitLifeEvent( gg_trg_hpdayuhundred, u, GREATER_THAN, 150.00 )
call TriggerRegisterUnitLifeEvent( gg_trg_hpxiaoyuling, u, LESS_THAN, 0.41 )
call TriggerRegisterUnitEvent( gg_trg_lvlupwithability, u, EVENT_UNIT_HERO_LEVEL )
call DisableTrigger( gg_trg_hpdayuhundred )
call SaveInteger(udg_Hash1,GetHandleId(gg_trg_addintel),1,0)
call TriggerRegisterUnitEvent( gg_trg_shengrevive, u, EVENT_UNIT_HERO_REVIVE_FINISH )
call TriggerRegisterUnitEvent( gg_trg_addshuxing, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent( gg_trg_addintel, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent( gg_trg_zhufuzhiliao, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent( gg_trg_shenshengshenpan, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent( gg_trg_shandianshiye, u, EVENT_UNIT_SPELL_EFFECT )
else
if i==5 then//冰原
set u=CreateUnit(p,'U005',0,0,270)
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNMammoth.blp" )
call TriggerRegisterUnitEvent( gg_trg_bingya, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent( gg_trg_arrow, u, EVENT_UNIT_SPELL_EFFECT )
else
if i==6 then//蛮王
set u=CreateUnit(p,'O00B',0,0,270)
call wujindebaojieeee(u)
call DisableTrigger( gg_trg_wujindefennu )
call TriggerRegisterUnitEvent( gg_trg_wujindetili, u, EVENT_UNIT_HERO_SKILL )
call TriggerRegisterUnitEvent(  gg_trg_wujindefennu, u, EVENT_UNIT_DAMAGED )
call TriggerRegisterUnitEvent( gg_trg_shiyongfennu, u, EVENT_UNIT_SPELL_EFFECT )
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNHellScream.blp" )
else
if i==7 then//牛头人酋长
set u=CreateUnit(p,'O00E',0,0,270)
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNHeroTaurenChieftain.blp" )
call TriggerRegisterUnitEvent( gg_trg_shenglinuhou, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent( gg_trg_yemanchongzhuang, u, EVENT_UNIT_SPELL_EFFECT )
else
if i==8 then//海洋之灾
set u=CreateUnit(p,'H00D',0,0,270)
call SaveUnitHandle(udg_Hash1,GetHandleId(gg_trg_sanxiangzhili),1,u)
call TriggerRegisterUnitEvent( gg_trg_shoudaoshanghaisanxiang, u, EVENT_UNIT_DAMAGED )
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNICeTroll.blp" )
call TriggerRegisterUnitEvent( gg_trg_huaixuebingliaofa, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent( gg_trg_sanxiangzhili, u, EVENT_UNIT_SPELL_EFFECT )
else
endif
endif
endif
endif
endif
endif
endif
endif

call SaveInteger(udg_Hash2,107,i,1)
call SaveInteger(udg_Hash2,GetHandleId(u),8529,1)//1为力量2为敏捷3为智力
set udg_PlayerLockToHero[GetConvertedPlayerId(p)]=u//将玩家与英雄绑定起来，索引号为1-12
call SetUnitX(u,udg_ReviveX[t])
call SetUnitY(u,udg_ReviveY[t])
call PanCameraToForPlayer( p,udg_ReviveX[t], udg_ReviveY[t] )
call SaveInteger(udg_Hash2,GetHandleId(u),25,1)
call SetPlayerName( p,  udg_PlayerName[g] +"("+ GetUnitName(u)+")"  )
set mbi=MultiboardGetItem(udg_BlackBoard,g,1)
call MultiboardSetItemValue(mbi,udg_YANSE[g]+GetPlayerName(p)+"|r")
call MultiboardReleaseItem(mbi)
if udg_Test==true then
else
call SetPlayerMaxHeroesAllowed(0,p)
endif
call SaveInteger(udg_Hash3,GetHandleId(u),332,0)
call SaveInteger(udg_Hash3,GetHandleId(u),333,0)
call TriggerRegisterUnitEvent( gg_trg_BuyToRevive, u, EVENT_UNIT_HERO_REVIVE_FINISH )
call TriggerRegisterUnitEvent( gg_trg_attacked, u, EVENT_UNIT_ATTACKED )
call TriggerRegisterUnitEvent( gg_trg_GetItem, u, EVENT_UNIT_PICKUP_ITEM )
call TriggerRegisterUnitEvent( gg_trg_UseItem, u, EVENT_UNIT_SPELL_EFFECT )
call AddGetHarmTrigger(u)
call TriggerRegisterUnitEvent( gg_trg_chenmoshushi, u, EVENT_UNIT_SPELL_ENDCAST )
call TriggerRegisterUnitEvent( gg_trg_LearnAbility, u, EVENT_UNIT_HERO_SKILL )
call TriggerRegisterUnitEvent( gg_trg_ReduceWave, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent( gg_trg_HeroDead, u, EVENT_UNIT_DEATH )
call GroupAddUnit( udg_CheckHpGroup, u )
call MultiboardReleaseItem(udg_lsmb)
set mbi=null
set n=GetUnitTypeId(u)
set u=null
return n

endfunction

function random6 takes player p returns integer
local unit u
local integer i=GetRandomInt(1,12)//英雄满了就12
local integer n=1
local integer g=GetConvertedPlayerId(p)
local multiboarditem mbi
local integer t=GetRandomInt(1,8)
set udg_lsmb=MultiboardGetItem(udg_BlackBoard,g,0)
if LoadInteger(udg_Hash2,106,i)==1 then//已被选了的话
set u=null
set mbi=null
return 0
endif
if i==1 then//ZMT
set u=CreateUnit(p,'Hjai',0,0,270)
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNJaina.blp" )
call TriggerRegisterUnitEvent( gg_trg_CreateWeatherd, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent( gg_trg_stopsnow, u, EVENT_UNIT_SPELL_ENDCAST )
call TriggerRegisterUnitEvent( gg_trg_qixue, u, EVENT_UNIT_SPELL_FINISH )
call SaveInteger(udg_Hash3,GetHandleId(u),336,'A0BT')
else
if i==2 then//phoenix
set u=CreateUnit(p,'Emfr',0,0,270)
call SaveInteger(udg_Hash3,GetHandleId(u),336,'Avng')
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNMarkOfFire.blp" )
call TriggerRegisterUnitEvent( gg_trg_HolyKill, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent( gg_trg_fenghuangniao, u, EVENT_UNIT_HERO_LEVEL )
else
if i==3 then//稀烂的球魁
set u=CreateUnit(p,'Ekgg',0,0,270)
//call SetUnitColor( u, PLAYER_COLOR_YELLOW )
call SaveInteger(udg_Hash3,GetHandleId(u),336,'Arej')
call TriggerRegisterUnitEvent( gg_trg_fanlaohuantong, u, EVENT_UNIT_HERO_LEVEL )
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNWisp.blp" )
else
if i==4 then//大仙
set u=CreateUnit(p,'Hant',0,0,270)
call TriggerRegisterUnitEvent(  gg_trg_ElectricalBomb, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent( gg_trg_quanlingyujimo, u, EVENT_UNIT_SPELL_EFFECT )
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNSpellBreaker.blp" )
call SaveUnitHandle(udg_Hash1,GetHandleId(gg_trg_quanlingyujimo),1,u)
else
if i==5 then//51
set u=CreateUnit(p,'Uwar',0,0,270)
call TriggerRegisterUnitEvent(  gg_trg_wudu, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent( gg_trg_swudu, u, EVENT_UNIT_SPELL_ENDCAST )
call SaveInteger(udg_Hash3,GetHandleId(u),336,'Ahwd')
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNWitchDoctor.blp" )
else
if i==6 then//3Q
set u=CreateUnit(p,'Hmbr',0,0,270)
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNAvatar.blp" )
call SaveInteger(udg_Hash3,GetHandleId(u),336,'A08G')
call TriggerRegisterUnitEvent( gg_trg_shandianlian, u, EVENT_UNIT_HERO_LEVEL )
call TriggerRegisterUnitEvent(  gg_trg_ElectricSquare, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent(  gg_trg_AngryElec, u, EVENT_UNIT_SPELL_EFFECT )
else
if i==7 then//BV
set u=CreateUnit(p,'Hgam',0,0,270)
set udg_lsu=CreateUnit(p,'n001',-270,-620,0)
call UnitAddItemToSlotById( udg_lsu, 'rsps', 0 )
call SaveUnitHandle(udg_Hash2,GetHandleId(u),4620,udg_lsu)
call SaveInteger(udg_Hash3,GetHandleId(u),336,'A09H')
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNPriest.blp" )  
call TriggerRegisterUnitEvent(   gg_trg_GodHand, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent(   gg_trg_LinkenHudun, u, EVENT_UNIT_SPELL_EFFECT )
else
if i==8 then//巫妖
set u=CreateUnit(p,'Uktl',0,0,270)
call SaveInteger(udg_Hash3,GetHandleId(u),336,'A071')
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNLichVersion2.blp" )
call TriggerRegisterUnitEvent(   gg_trg_DarkThrough, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent(   gg_trg_shuangdongliliang, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent(   gg_trg_lianhuanshuangdong, u, EVENT_UNIT_SPELL_EFFECT )
call SaveUnitHandle(udg_Hash1,GetHandleId(gg_trg_lianhuanshuangdong),1,u)
else
if i==9 then//蠢东西
set u=CreateUnit(p,'Ecen',0,0,270)
call TriggerRegisterUnitEvent( gg_trg_jinghua, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent( gg_trg_zhuanyi, u, EVENT_UNIT_SPELL_CHANNEL )
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNSummonWaterElemental.blp" )
else
if i==10 then//皮包骨
set u=CreateUnit(p,'Nman',0,0,270)
call SaveInteger(udg_Hash3,GetHandleId(u),336,'AHbn')
call TriggerRegisterUnitEvent( gg_trg_UpSHUailao, u, EVENT_UNIT_HERO_LEVEL )
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNSkeletonMage.blp" )
else
if i==11 then//海民
set u=CreateUnit(p,'Uvar',0,0,270)
call TriggerRegisterUnitEvent( gg_trg_HuiJi, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent( gg_trg_AttackWithHuiJi, u, EVENT_UNIT_TARGET_IN_RANGE )
call TriggerRegisterUnitEvent( gg_trg_PanDuanHuiJi, u, EVENT_UNIT_DAMAGED )
call DisableTrigger( gg_trg_PanDuanHuiJi )
call DisableTrigger( gg_trg_AttackWithHuiJi )
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNTuskaarGold.blp" )
else
if i==12 then//MAY
set u=CreateUnit(p,'Ogld',0,0,270) 
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNVoidWalker.blp" )
call TriggerRegisterUnitEvent( gg_trg_StopLiaoKao, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent( gg_trg_YuanLiLiaoKao, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent( gg_trg_ChuansongBlink, u, EVENT_UNIT_SPELL_EFFECT )
else
endif
endif
endif
endif
endif             
endif
endif
endif
endif
endif
endif
endif
call SaveInteger(udg_Hash2,106,i,1)
call SaveInteger(udg_Hash2,GetHandleId(u),8529,3)//1为力量2为敏捷3为智力
set udg_PlayerLockToHero[GetConvertedPlayerId(p)]=u//将玩家与英雄绑定起来，索引号为1-12
call SetUnitX(u,udg_ReviveX[t])
call SetUnitY(u,udg_ReviveY[t])
call PanCameraToForPlayer( p,udg_ReviveX[t], udg_ReviveY[t] )
call SaveInteger(udg_Hash2,GetHandleId(u),25,1)
call SetPlayerName( p,  udg_PlayerName[g] +"("+ GetUnitName(u)+")"  )
set mbi=MultiboardGetItem(udg_BlackBoard,g,1)
call MultiboardSetItemValue(mbi,udg_YANSE[g]+GetPlayerName(p)+"|r")
call MultiboardReleaseItem(mbi)
if udg_Test==true then
else
call SetPlayerMaxHeroesAllowed(0,p)
endif
call SaveInteger(udg_Hash3,GetHandleId(u),332,0)
call SaveInteger(udg_Hash3,GetHandleId(u),333,0)
call TriggerRegisterUnitEvent( gg_trg_BuyToRevive, u, EVENT_UNIT_HERO_REVIVE_FINISH )
call TriggerRegisterUnitEvent( gg_trg_attacked, u, EVENT_UNIT_ATTACKED )
call TriggerRegisterUnitEvent( gg_trg_GetItem, u, EVENT_UNIT_PICKUP_ITEM )
call TriggerRegisterUnitEvent( gg_trg_UseItem, u, EVENT_UNIT_SPELL_EFFECT )
call AddGetHarmTrigger(u)
call TriggerRegisterUnitEvent( gg_trg_chenmoshushi, u, EVENT_UNIT_SPELL_ENDCAST )
call TriggerRegisterUnitEvent( gg_trg_LearnAbility, u, EVENT_UNIT_HERO_SKILL )
call TriggerRegisterUnitEvent( gg_trg_ReduceWave, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent( gg_trg_HeroDead, u, EVENT_UNIT_DEATH )
call GroupAddUnit( udg_CheckHpGroup, u )
call MultiboardReleaseItem(udg_lsmb)
set mbi=null
set n=GetUnitTypeId(u)
set u=null
return n
endfunction




function random5 takes player p returns integer
local unit u
local integer i=GetRandomInt(1,12)//英雄满了就12
local integer n=1
local integer g=GetConvertedPlayerId(p)
local multiboarditem mbi
local integer t=GetRandomInt(1,8)
set udg_lsmb=MultiboardGetItem(udg_BlackBoard,g,0)
if LoadInteger(udg_Hash2,105,i)==1 then//已被选了的话
set u=null
set mbi=null
return 0
endif
if i==1 then//毒舌
set u=CreateUnit(p,'Efur',0,0,270)
call TriggerRegisterUnitEvent( gg_trg_illcloudy, u, EVENT_UNIT_HERO_LEVEL )
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNNetherDragon.blp" )
else
if i==2 then//Naga
set u=CreateUnit(p,'Hvsh',0,0,270)
call TriggerRegisterUnitEvent( gg_trg_Purge, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent( gg_trg_LearnPurge, u, EVENT_UNIT_HERO_SKILL )
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNNagaSeaWitch.blp" )
else
if i==3 then//土豆泥
set u=CreateUnit(p,'Umal',0,0,270)
call TriggerRegisterUnitEvent( gg_trg_JiduKewang, u, EVENT_UNIT_TARGET_IN_RANGE )
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNSludgeCreature.blp" )
else
if i==4 then//QY
set u=CreateUnit(p,'Ewrd',0,0,270)
call TriggerRegisterPlayerUnitEventSimple( gg_trg_Summoned, p, EVENT_PLAYER_UNIT_SUMMON )
call DisableTrigger( gg_trg_Summoned )
call DisableTrigger( gg_trg_MoveTo )
call SaveInteger(udg_Hash3,GetHandleId(u),336,'ACad')
call TriggerRegisterUnitEvent( gg_trg_Dawn, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent( gg_trg_MoveTo, u, EVENT_UNIT_SPELL_EFFECT )
call SetPlayerAbilityAvailable( p, 'A047', false )
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNvengeanceincarnate.blp" )
call TriggerRegisterUnitEvent( gg_trg_learnhuangwu, u, EVENT_UNIT_HERO_SKILL )
call TriggerRegisterUnitEvent( gg_trg_learndawn, u, EVENT_UNIT_HERO_SKILL )
else
if i==5 then//虎哥
set u=CreateUnit(p,'Etyr',0,0,270)
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNHuntress.blp" )
call TriggerRegisterUnitEvent( gg_trg_EatMoon, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent(gg_trg_MAoTouYING, u, EVENT_UNIT_HERO_LEVEL )
call SaveInteger(udg_Hash3,GetHandleId(u),336,'AEst')
else
if i==6 then//小黑
set u=CreateUnit(p,'Usyl',0,0,270)
call TriggerRegisterUnitEvent( gg_trg_LearnAgi, u, EVENT_UNIT_HERO_SKILL )
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNBansheeRanger.blp" )
else
if i==7 then//骚爷
set u=CreateUnit(p,'Hlgr',0,0,270)
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNKnight.blp" )
call TriggerRegisterUnitEvent( gg_trg_SXLX, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent( gg_trg_CheckHp, u, EVENT_UNIT_HERO_SKILL )
call TriggerRegisterUnitEvent( gg_trg_Tear, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent(gg_trg_xuezhikuangbao, u, EVENT_UNIT_HERO_LEVEL )
call SaveInteger(udg_Hash3,GetHandleId(u),336,'A0AU')
else
if i==8 then//三把火
set u=CreateUnit(p,'Nfir',0,0,270)
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNHeroAvatarOfFlame.blp" )
call TriggerRegisterUnitEvent( gg_trg_FireRain, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent( gg_trg_vieee, u, EVENT_UNIT_SPELL_FINISH )
call TriggerRegisterUnitEvent( gg_trg_vbegin, u, EVENT_UNIT_SPELL_EFFECT )
call SaveInteger(udg_Hash3,GetHandleId(u),336,'A08L')
call TriggerRegisterUnitEvent( gg_trg_yanmo, u, EVENT_UNIT_HERO_LEVEL )
call SaveUnitHandle(udg_Hash1,GetHandleId(gg_trg_vieee),1,u)
else
if i==9 then//帅气的V弟  
set u=CreateUnit(p,'Hhkl',0,0,270)
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNFelGuardBlue.blp" )
call TriggerRegisterUnitEvent( gg_trg_ClapGo, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent( gg_trg_julihuiwu, u, EVENT_UNIT_HERO_LEVEL )
call TriggerRegisterUnitEvent( gg_trg_GodGoDown, u, EVENT_UNIT_SPELL_EFFECT )
else
if i==10 then//HXT
set u=CreateUnit(p,'Npbm',0,0,270)
call DisplayTextToPlayer( p,0,0,"|cfffeba0eHXT，LW，小强，小胡子等英雄若购买了相位鞋，请不要在相位移动到水中后使用各自的隐身技能，否则会出现在水中无法动弹的情况。|r")
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNFireBrewmaster.blp" )
call SetPlayerAbilityAvailable( p, 'A007', false )
call SetPlayerAbilityAvailable( p, 'A006', false )
call TriggerRegisterUnitEvent( gg_trg_jingxiangbaoji, u, EVENT_UNIT_HERO_SKILL )
call SaveUnitHandle(udg_Hash1,234,159,u)
call SaveInteger(udg_Hash3,GetHandleId(u),336,'A06Q')
call SaveGroupHandle(udg_Hash1,234,160,CreateGroup())
call TriggerRegisterUnitInRangeSimple( gg_trg_cf, 256, u )
call TriggerRegisterUnitEvent( gg_trg_cfon, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent( gg_trg_HuanXiangLa, u, EVENT_UNIT_SPELL_EFFECT )
call CinematicFadeBJ( bj_CINEFADETYPE_FADEOUTIN, 5.00, "ReplaceableTextures\\CameraMasks\\Panda-n-Cub.blp", 100.00, 100.00, 100.00, 0 )
else
if i==11 then//十
set u=CreateUnit(p,'Utic',0,0,270)
call SaveInteger(udg_Hash3,GetHandleId(u),336,'Astn')
call TriggerRegisterUnitEvent( gg_trg_attackevil, u, EVENT_UNIT_SPELL_EFFECT )
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNGargoyle.blp" )
call TriggerRegisterUnitEvent( gg_trg_stunbyshixiang, u, EVENT_UNIT_SPELL_EFFECT )
else
if i==12 then//船长
set u=CreateUnit(p,'Hart',0,0,270)
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNProudMoore.blp" )
call TriggerRegisterUnitEvent( gg_trg_ghostship, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent( gg_trg_PanDuanShuiDao, u, EVENT_UNIT_DAMAGED )
call TriggerRegisterUnitEvent( gg_trg_shuidao, u, EVENT_UNIT_HERO_SKILL )
else
endif
endif
endif
endif
endif
endif
endif
endif
endif
endif
endif
endif
call SaveInteger(udg_Hash2,105,i,1)
call SaveInteger(udg_Hash2,GetHandleId(u),8529,2)//1为力量2为敏捷3为智力
set udg_PlayerLockToHero[GetConvertedPlayerId(p)]=u//将玩家与英雄绑定起来，索引号为1-12
call SetUnitX(u,udg_ReviveX[t])
call SetUnitY(u,udg_ReviveY[t])
call PanCameraToForPlayer( p,udg_ReviveX[t], udg_ReviveY[t] )
call SaveInteger(udg_Hash2,GetHandleId(u),25,1)
call SetPlayerName( p,  udg_PlayerName[g] +"("+ GetUnitName(u)+")"  )
set mbi=MultiboardGetItem(udg_BlackBoard,g,1)
call MultiboardSetItemValue(mbi,udg_YANSE[g]+GetPlayerName(p)+"|r")
call MultiboardReleaseItem(mbi)
if udg_Test==true then
else
call SetPlayerMaxHeroesAllowed(0,p)
endif
call SaveInteger(udg_Hash3,GetHandleId(u),332,0)
call SaveInteger(udg_Hash3,GetHandleId(u),333,0)
call TriggerRegisterUnitEvent( gg_trg_BuyToRevive, u, EVENT_UNIT_HERO_REVIVE_FINISH )
call TriggerRegisterUnitEvent( gg_trg_attacked, u, EVENT_UNIT_ATTACKED )
call TriggerRegisterUnitEvent( gg_trg_GetItem, u, EVENT_UNIT_PICKUP_ITEM )
call TriggerRegisterUnitEvent( gg_trg_UseItem, u, EVENT_UNIT_SPELL_EFFECT )
call AddGetHarmTrigger(u)
call TriggerRegisterUnitEvent( gg_trg_chenmoshushi, u, EVENT_UNIT_SPELL_ENDCAST )
call TriggerRegisterUnitEvent( gg_trg_LearnAbility, u, EVENT_UNIT_HERO_SKILL )
call TriggerRegisterUnitEvent( gg_trg_ReduceWave, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent( gg_trg_HeroDead, u, EVENT_UNIT_DEATH )
call GroupAddUnit( udg_CheckHpGroup, u )
call MultiboardReleaseItem(udg_lsmb)
set mbi=null
set n=GetUnitTypeId(u)
set u=null
return n
endfunction




function random4 takes player p returns integer
local unit u
local integer i=GetRandomInt(1,12)//英雄满了就12
local integer n=1
local integer g=GetConvertedPlayerId(p)
local multiboarditem mbi
local integer t=GetRandomInt(1,8)
set udg_lsmb=MultiboardGetItem(udg_BlackBoard,g,0)
if LoadInteger(udg_Hash2,104,i)==1 then//已被选了的话
set u=null
set mbi=null
return 0
endif
if i==1 then//V弟
set u=CreateUnit(p,'Eill',0,0,270)
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNGuldanSkull.blp" )
call TriggerRegisterUnitEvent( gg_trg_Stone, u, EVENT_UNIT_SPELL_EFFECT )
call SaveInteger(udg_Hash3,GetHandleId(u),336,'A08K')
else
if i==2 then//QY
set u=CreateUnit(p,'Nalc',0,0,270)
call TriggerRegisterUnitEvent( gg_trg_AddMoney, u, EVENT_UNIT_HERO_SKILL )
call SaveInteger(udg_Hash3,GetHandleId(u),336,'A08I')
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNHeroAlchemist.blp" )
else
if i==3 then//龙哥
set u=CreateUnit(p,'Hmgd',0,0,270)
call SetPlayerTechResearchedSwap( 'Rhar', 1, p )
call tiaozhengz(u)
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNTheCaptain.blp" )
call TriggerRegisterUnitEvent( gg_trg_TrueDragon, u, EVENT_UNIT_HERO_SKILL )
else
if i==4 then//豹爷
set u=CreateUnit(p,'Hpb2',0,0,270)
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNDoomGuard.blp" )
call SetPlayerAbilityAvailable( p, 'A046', false )
call UnitRemoveAbility( u, 'B01B' )
call SaveInteger(udg_Hash3,GetHandleId(u),336,'Adev')
call TriggerRegisterUnitEvent( gg_trg_tunshishengji, u, EVENT_UNIT_HERO_LEVEL )
call TriggerRegisterUnitEvent( gg_trg_BrunGround, u, EVENT_UNIT_SPELL_EFFECT )
else
if i==5 then//夜使老
set u=CreateUnit(p,'Ubal',0,0,270)
call UnitAddAbility( u, 'A05I' )
call SetPlayerAbilityAvailable( p, 'A05I', false )
call UnitRemoveAbility(u,'B01R')
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNTichondrius.blp" )
call TriggerRegisterUnitEvent( gg_trg_LearnNight, u, EVENT_UNIT_HERO_SKILL )
call TriggerRegisterUnitEvent( gg_trg_DarkTime, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent( gg_trg_shangcankongju, u, EVENT_UNIT_HERO_LEVEL )
call SaveInteger(udg_Hash3,GetHandleId(u),336,'A0AT')
else
if i==6 then//小柳续
set u=CreateUnit(p,'Uvng',0,0,270)
call TriggerRegisterUnitEvent( gg_trg_attacktree, u, EVENT_UNIT_TARGET_IN_RANGE )
call SaveInteger(udg_Hash3,GetHandleId(u),336,'Aesr')
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNAncientOfTheMoon.blp" )
else
if i==7 then//发条
set u=CreateUnit(p,'Hapm',0,0,270)
call TriggerRegisterUnitEvent( gg_trg_AttackWithFire, u, EVENT_UNIT_TARGET_IN_RANGE )
call SaveInteger(udg_Hash3,GetHandleId(u),336,'ANsy')
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNClockWerkGoblin.blp" )
call TriggerRegisterUnitEvent( gg_trg_HighFire, u, EVENT_UNIT_SPELL_EFFECT )
call SaveInteger(udg_Hash3,GetHandleId(u),336,'Afla')
call TriggerRegisterUnitEvent( gg_trg_GOGOGO, u, EVENT_UNIT_SPELL_EFFECT )
else
if i==8 then//帅猫
set u=CreateUnit(p,'Harf',0,0,270)
call TriggerRegisterUnitEvent( gg_trg_huoyanzhiren, u, EVENT_UNIT_HERO_LEVEL )
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNArthas.blp" )
call TriggerRegisterUnitEvent( gg_trg_HolyAttack, u, EVENT_UNIT_SPELL_EFFECT )
else
if i==9 then//兽步
set u=CreateUnit(p,'Ocbh',0,0,270)
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNGrunt.blp" )
call TriggerRegisterUnitEvent( gg_trg_LearnLH, u, EVENT_UNIT_HERO_SKILL )
call TriggerRegisterUnitEvent( gg_trg_Fshouxingpifu, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent( gg_trg_Kungbaoliliang, u, EVENT_UNIT_SPELL_EFFECT )
else
if i==10 then//牛头
set u=CreateUnit(p,'Ocb2',0,0,270)
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNTauren.blp" )
call TriggerRegisterUnitEvent( gg_trg_clap, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent( gg_trg_wavechong, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent( gg_trg_fensui, u, EVENT_UNIT_HERO_LEVEL )
else
if i==11 then//神灵
set u=CreateUnit(p,'Odrt',0,0,270)
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNHeadhunter.blp" )
call DisableTrigger( gg_trg_AttackPoison )
call TriggerRegisterUnitEvent( gg_trg_SpellPoison, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent( gg_trg_AttackPoison, u, EVENT_UNIT_TARGET_IN_RANGE )
call TriggerRegisterUnitEvent( gg_trg_OrderPoison, u, EVENT_UNIT_ISSUED_ORDER )
call SetPlayerAbilityAvailable( p, 'AIat', false )
call SaveInteger(udg_Hash3,GetHandleId(u),336,'A094')
call SetPlayerAbilityAvailable( p, 'AIsx', false )
call TriggerRegisterUnitEvent( gg_trg_XISHENG, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent( gg_trg_learnaddas, u, EVENT_UNIT_HERO_SKILL )
else
if i==12 then//昕胖
set u=CreateUnit(p,'Nsjs',0,0,270)
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNChaosKotoBeast.blp" )
call TriggerRegisterUnitEvent( gg_trg_UploadedC, u, EVENT_UNIT_HERO_SKILL )
call TriggerRegisterUnitEvent( gg_trg_nianyou, u, EVENT_UNIT_SPELL_EFFECT )
set udg_lsu=CreateUnit(p,'n001',-270,-620,0)
call UnitAddAbility(udg_lsu,'A09M')
call SaveUnitHandle(udg_Hash1,GetHandleId(u),8502,udg_lsu)
call TriggerRegisterUnitEvent( gg_trg_dddd, u, EVENT_UNIT_HERO_LEVEL )
else
endif
endif
endif
endif
endif
endif
endif
endif
endif
endif
endif
endif
call SaveInteger(udg_Hash2,104,i,1)
call SaveInteger(udg_Hash2,GetHandleId(u),8529,1)//1为力量2为敏捷3为智力
set udg_PlayerLockToHero[GetConvertedPlayerId(p)]=u//将玩家与英雄绑定起来，索引号为1-12
call SetUnitX(u,udg_ReviveX[t])
call SetUnitY(u,udg_ReviveY[t])
call PanCameraToForPlayer( p,udg_ReviveX[t], udg_ReviveY[t] )
call SaveInteger(udg_Hash2,GetHandleId(u),25,1)
call SetPlayerName( p,  udg_PlayerName[g] +"("+ GetUnitName(u)+")"  )
set mbi=MultiboardGetItem(udg_BlackBoard,g,1)
call MultiboardSetItemValue(mbi,udg_YANSE[g]+GetPlayerName(p)+"|r")
call MultiboardReleaseItem(mbi)
if udg_Test==true then
else
call SetPlayerMaxHeroesAllowed(0,p)
endif
call SaveInteger(udg_Hash3,GetHandleId(u),332,0)
call SaveInteger(udg_Hash3,GetHandleId(u),333,0)
call TriggerRegisterUnitEvent( gg_trg_BuyToRevive, u, EVENT_UNIT_HERO_REVIVE_FINISH )
call TriggerRegisterUnitEvent( gg_trg_attacked, u, EVENT_UNIT_ATTACKED )
call TriggerRegisterUnitEvent( gg_trg_GetItem, u, EVENT_UNIT_PICKUP_ITEM )
call TriggerRegisterUnitEvent( gg_trg_UseItem, u, EVENT_UNIT_SPELL_EFFECT )
call AddGetHarmTrigger(u)
call TriggerRegisterUnitEvent( gg_trg_chenmoshushi, u, EVENT_UNIT_SPELL_ENDCAST )
call TriggerRegisterUnitEvent( gg_trg_LearnAbility, u, EVENT_UNIT_HERO_SKILL )
call TriggerRegisterUnitEvent( gg_trg_ReduceWave, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent( gg_trg_HeroDead, u, EVENT_UNIT_DEATH )
call GroupAddUnit( udg_CheckHpGroup, u )
call MultiboardReleaseItem(udg_lsmb)
set mbi=null
set n=GetUnitTypeId(u)
set u=null
return n
endfunction



function random3 takes player p returns integer
local unit u
local integer i=GetRandomInt(1,12)//英雄满了就12
local integer n=1
local integer g=GetConvertedPlayerId(p)
local multiboarditem mbi
local integer t=GetRandomInt(1,8)
set udg_lsmb=MultiboardGetItem(udg_BlackBoard,g,0)
if LoadInteger(udg_Hash2,103,i)==1 then//已被选了的话
set u=null
set mbi=null
return 0
endif
if i==1 then//马蹄糕
set u=CreateUnit(p,'Hvwd',0,0,270)
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNHarpyQueen.blp" )
call TriggerRegisterUnitEvent( gg_trg_phonix, u, EVENT_UNIT_HERO_SKILL )
call TriggerRegisterUnitEvent( gg_trg_UseBurnOil, u, EVENT_UNIT_SPELL_EFFECT )
else
if i==2 then//CJX
set u=CreateUnit(p,'Nrob',0,0,270)
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNROBOGOBLIN.blp" )
call TriggerRegisterUnitEvent( gg_trg_refreshtank, u, EVENT_UNIT_SPELL_FINISH )
call SaveInteger(udg_Hash3,GetHandleId(u),336,'ANsy')
else
if i==3 then//WWZ
set u=CreateUnit(p,'Ntin',0,0,270)
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNDwarfCar.blp" )
call TriggerRegisterUnitEvent( gg_trg_waterhole, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent( gg_trg_rushwater, u, EVENT_UNIT_SPELL_EFFECT )
else
if i==4 then//MYD
set u=CreateUnit(p,'Hblm',0,0,270)
call TriggerRegisterUnitEvent( gg_trg_blink, u, EVENT_UNIT_HERO_LEVEL )
call SaveInteger(udg_Hash3,GetHandleId(u),336,'A08H')
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNBlueDemoness.blp" )
else
if i==5 then//Lion
set u=CreateUnit(p,'Ulic',0,0,270)
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNChaosWarlockGreen.blp" )
call TriggerRegisterUnitEvent( gg_trg_DeathFinger, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent( gg_trg_Yaoshu, u, EVENT_UNIT_SPELL_EFFECT )
call SaveInteger(udg_Hash3,GetHandleId(u),336,'AChw')
else
if i==6 then//土豆
set u=CreateUnit(p,'Ofar',0,0,270)
call TriggerRegisterUnitEvent( gg_trg_LearnTudou, u, EVENT_UNIT_HERO_SKILL )
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNInfernal.blp" )
else
if i==7 then//小Y
set u=CreateUnit(p,'Orkn',0,0,270)
call SaveInteger(udg_Hash3,GetHandleId(u),336,'AOhx')
call TriggerRegisterUnitEvent(gg_trg_yaoshuup, u, EVENT_UNIT_HERO_LEVEL )
call TriggerRegisterUnitEvent( gg_trg_magicleash, u, EVENT_UNIT_SPELL_EFFECT )
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNShadowHunter.blp" )
else
if i==8 then//蝙蝠
set u=CreateUnit(p,'Othr',0,0,270)
call TriggerRegisterUnitEvent( gg_trg_LearnLiquidBurn, u, EVENT_UNIT_HERO_SKILL )
call TriggerRegisterUnitEvent( gg_trg_LiquidBurn, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent( gg_trg_LieYanFengBao, u, EVENT_UNIT_SPELL_EFFECT )
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNTrollBatRider.blp" )
else
if i==9 then//刘弟
set u=CreateUnit(p,'Hamg',0,0,270)
call SaveInteger(udg_Hash3,GetHandleId(u),336,'AOfs')
call TriggerRegisterUnitEvent(gg_trg_ZhouYu, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent(gg_trg_zengwu, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent( gg_trg_jieshuzhouyu, u, EVENT_UNIT_SPELL_ENDCAST )
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNOrcWarlockRed.blp" )
else
if i==10 then//球魁
set u=CreateUnit(p,'Hmkg',0,0,270)
call TriggerRegisterUnitEvent( gg_trg_leitingyiji, u, EVENT_UNIT_SPELL_EFFECT )
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNEarthBrewmaster.blp" )
else
if i==11 then//kimi
set u=CreateUnit(p,'Hkal',0,0,270)
call TriggerRegisterUnitEvent( gg_trg_XURUO, u, EVENT_UNIT_HERO_LEVEL )
call SaveInteger(udg_Hash3,GetHandleId(u),336,'A098')
call TriggerRegisterUnitEvent( gg_trg_stopwerqew, u, EVENT_UNIT_SPELL_ENDCAST )
call TriggerRegisterUnitEvent( gg_trg_asdqweqwe, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent( gg_trg_EatBrain, u, EVENT_UNIT_SPELL_EFFECT )
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNHeroBloodElfPrince.blp" )
else
if i==12 then//V姐
set u=CreateUnit(p,'Emns',0,0,270)
call TriggerRegisterUnitEvent( gg_trg_V, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent( gg_trg_EarthBomb, u, EVENT_UNIT_SPELL_EFFECT )
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNRockGolem.blp" )
else
endif
endif
endif
endif
endif
endif
endif
endif
endif
endif
endif
endif
call SaveInteger(udg_Hash2,103,i,1)
call SaveInteger(udg_Hash2,GetHandleId(u),8529,3)//1为力量2为敏捷3为智力
set udg_PlayerLockToHero[GetConvertedPlayerId(p)]=u//将玩家与英雄绑定起来，索引号为1-12
call SetUnitX(u,udg_ReviveX[t])
call SetUnitY(u,udg_ReviveY[t])
call PanCameraToForPlayer( p,udg_ReviveX[t], udg_ReviveY[t] )
call SaveInteger(udg_Hash2,GetHandleId(u),25,1)
call SetPlayerName( p,  udg_PlayerName[g] +"("+ GetUnitName(u)+")"  )
set mbi=MultiboardGetItem(udg_BlackBoard,g,1)
call MultiboardSetItemValue(mbi,udg_YANSE[g]+GetPlayerName(p)+"|r")
call MultiboardReleaseItem(mbi)
if udg_Test==true then
else
call SetPlayerMaxHeroesAllowed(0,p)
endif
call SaveInteger(udg_Hash3,GetHandleId(u),332,0)
call SaveInteger(udg_Hash3,GetHandleId(u),333,0)
call TriggerRegisterUnitEvent( gg_trg_BuyToRevive, u, EVENT_UNIT_HERO_REVIVE_FINISH )
call TriggerRegisterUnitEvent( gg_trg_attacked, u, EVENT_UNIT_ATTACKED )
call TriggerRegisterUnitEvent( gg_trg_GetItem, u, EVENT_UNIT_PICKUP_ITEM )
call TriggerRegisterUnitEvent( gg_trg_UseItem, u, EVENT_UNIT_SPELL_EFFECT )
call AddGetHarmTrigger(u)
call TriggerRegisterUnitEvent( gg_trg_chenmoshushi, u, EVENT_UNIT_SPELL_ENDCAST )
call TriggerRegisterUnitEvent( gg_trg_LearnAbility, u, EVENT_UNIT_HERO_SKILL )
call TriggerRegisterUnitEvent( gg_trg_ReduceWave, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent( gg_trg_HeroDead, u, EVENT_UNIT_DEATH )
call GroupAddUnit( udg_CheckHpGroup, u )
call MultiboardReleaseItem(udg_lsmb)
set mbi=null
set n=GetUnitTypeId(u)
set u=null
return n
endfunction




function random2 takes player p returns integer
local unit u
local integer i=GetRandomInt(1,12)//英雄满了就12
local integer n=1
local integer g=GetConvertedPlayerId(p)
local multiboarditem mbi
local integer t=GetRandomInt(1,8)
set udg_lsmb=MultiboardGetItem(udg_BlackBoard,g,0)

if LoadInteger(udg_Hash2,102,i)==1 then//已被选了的话
set u=null
set mbi=null
return 0
endif


if i==1 then//lino
set u=CreateUnit(p,'Edem',0,0,270)
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNHeroDemonHunter.blp" )
call TriggerRegisterUnitEvent( gg_trg_AddAttack, u, EVENT_UNIT_HERO_SKILL )
call TriggerRegisterUnitEvent( gg_trg_falikuikong, u, EVENT_UNIT_SPELL_EFFECT )
else
if i==2 then//骚爷
set u=CreateUnit(p,'Eevi',0,0,270)
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNEvilIllidan.blp" )
call TriggerRegisterUnitEvent( gg_trg_changelife, u, EVENT_UNIT_SPELL_EFFECT )
else
if i==3 then//兽兽
set u=CreateUnit(p,'Obla',0,0,270)
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNMurgulShadowCaster.blp" )
call TriggerRegisterUnitEvent( gg_trg_StealNew, u, EVENT_UNIT_TARGET_IN_RANGE )
call TriggerRegisterUnitEvent( gg_trg_GetInvisible, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent( gg_trg_Shiye, u, EVENT_UNIT_HERO_SKILL )
set udg_shouwan = GetPlayersEnemies(GetOwningPlayer(u))
else
if i==4 then//MR
set u=CreateUnit(p,'Osam',0,0,270)
call TriggerRegisterUnitEvent( gg_trg_RushA, u, EVENT_UNIT_HERO_SKILL )
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNUnbroken.blp" )
call TriggerRegisterUnitEvent( gg_trg_Invulnerable_Cut, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent( gg_trg_UseRush, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent( gg_trg_huidaoguoqu, u, EVENT_UNIT_DAMAGED )
else
if i==5 then//LW
set u=CreateUnit(p,'Naka',0,0,270)
call DisplayTextToPlayer( p,0,0,"|cfffeba0eHXT，LW，小强，小胡子等英雄若购买了相位鞋，请不要在相位移动到水中后使用各自的隐身技能，否则会出现在水中无法动弹的情况。|r")
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNDranaiAkama.blp" )
call TriggerRegisterUnitEvent( gg_trg_poyinyiji, u, EVENT_UNIT_TARGET_IN_RANGE )
call TriggerRegisterUnitEvent( gg_trg_renshu, u, EVENT_UNIT_TARGET_IN_RANGE )
call TriggerRegisterUnitEvent( gg_trg_renshuup, u, EVENT_UNIT_SPELL_EFFECT )
else
if i==6 then//虎猫
set u=CreateUnit(p,'Emoo',0,0,270)
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNPriestessOfTheMoon.blp" )
call TriggerRegisterUnitEvent( gg_trg_NewArrow, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent( gg_trg_Clap, u, EVENT_UNIT_SPELL_EFFECT )
call SaveInteger(udg_Hash3,GetHandleId(u),336,'ACds')
call TriggerRegisterUnitEvent( gg_trg_yuezhiyanmian, u, EVENT_UNIT_SPELL_EFFECT )
else
if i==7 then//ljz
set u=CreateUnit(p,'Ewar',0,0,270)
call TriggerRegisterUnitEvent( gg_trg_LearnInvisable, u, EVENT_UNIT_HERO_SKILL )
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNSatyrTrickster.blp" )
call TriggerRegisterUnitEvent( gg_trg_yanmu, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent( gg_trg_BlinkBack, u, EVENT_UNIT_SPELL_EFFECT )
else
if i==8 then//搞死棍
set u=CreateUnit(p,'Ekee',0,0,270)
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNRevenant.blp" )
call TriggerRegisterUnitEvent( gg_trg_LearnTS, u, EVENT_UNIT_HERO_SKILL )
call TriggerRegisterUnitEvent( gg_trg_ThunderStorm, u, EVENT_UNIT_SPELL_EFFECT )
else
if i==9 then//XF
set u=CreateUnit(p,'Hpb1',0,0,270)
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNFrostBear.blp" )
call TriggerRegisterUnitEvent( gg_trg_LearnAddAttackSpeed, u, EVENT_UNIT_HERO_SKILL )
call SaveInteger(udg_Hash3,GetHandleId(u),336,'A0BF')
call TriggerRegisterUnitEvent( gg_trg_xionglevel, u, EVENT_UNIT_HERO_LEVEL )
else
if i==10 then//大哥
set u=CreateUnit(p,'Nbbc',0,0,270)
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNChaosBlademaster.blp" )
else
if i==11 then//小强
set u=CreateUnit(p,'Ucrl',0,0,270)
call DisplayTextToPlayer( p,0,0,"|cfffeba0eHXT，LW，小强，小胡子等英雄若购买了相位鞋，请不要在相位移动到水中后使用各自的隐身技能，否则会出现在水中无法动弹的情况。|r")
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNHeroCryptLord.blp" )
call SaveInteger(udg_Hash3,GetHandleId(u),336,'AUcb')
call TriggerRegisterUnitEvent( gg_trg_ManaBurn, u, EVENT_UNIT_SPELL_EFFECT )
else
if i==12 then//小胡子
set u=CreateUnit(p,'Nbrn',0,0,270)
call DisplayTextToPlayer( p,0,0,"|cfffeba0eHXT，LW，小强，小胡子等英雄若购买了相位鞋，请不要在相位移动到水中后使用各自的隐身技能，否则会出现在水中无法动弹的情况。|r")
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNArcher.blp" )
call TriggerRegisterUnitEvent( gg_trg_zhuorezhijian, u, EVENT_UNIT_HERO_LEVEL )
call TriggerRegisterUnitEvent( gg_trg_LearnFireOn, u, EVENT_UNIT_HERO_SKILL )
call TriggerRegisterUnitEvent( gg_trg_FireOnUnit, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent( gg_trg_FireOnCheck, u, EVENT_UNIT_TARGET_IN_RANGE )
else
endif
endif
endif
endif
endif
endif
endif
endif
endif
endif
endif
endif
call SaveInteger(udg_Hash2,102,i,1)
call SaveInteger(udg_Hash2,GetHandleId(u),8529,2)//1为力量2为敏捷3为智力
set udg_PlayerLockToHero[GetConvertedPlayerId(p)]=u//将玩家与英雄绑定起来，索引号为1-12
call SetUnitX(u,udg_ReviveX[t])
call SetUnitY(u,udg_ReviveY[t])
call PanCameraToForPlayer( p,udg_ReviveX[t], udg_ReviveY[t] )
call SaveInteger(udg_Hash2,GetHandleId(u),25,1)
call SetPlayerName( p,  udg_PlayerName[g] +"("+ GetUnitName(u)+")"  )
set mbi=MultiboardGetItem(udg_BlackBoard,g,1)
call MultiboardSetItemValue(mbi,udg_YANSE[g]+GetPlayerName(p)+"|r")
call MultiboardReleaseItem(mbi)
if udg_Test==true then
else
call SetPlayerMaxHeroesAllowed(0,p)
endif
call SaveInteger(udg_Hash3,GetHandleId(u),332,0)
call SaveInteger(udg_Hash3,GetHandleId(u),333,0)
call TriggerRegisterUnitEvent( gg_trg_BuyToRevive, u, EVENT_UNIT_HERO_REVIVE_FINISH )
call TriggerRegisterUnitEvent( gg_trg_attacked, u, EVENT_UNIT_ATTACKED )
call TriggerRegisterUnitEvent( gg_trg_GetItem, u, EVENT_UNIT_PICKUP_ITEM )
call TriggerRegisterUnitEvent( gg_trg_UseItem, u, EVENT_UNIT_SPELL_EFFECT )
call AddGetHarmTrigger(u)
call TriggerRegisterUnitEvent( gg_trg_chenmoshushi, u, EVENT_UNIT_SPELL_ENDCAST )
call TriggerRegisterUnitEvent( gg_trg_LearnAbility, u, EVENT_UNIT_HERO_SKILL )
call TriggerRegisterUnitEvent( gg_trg_ReduceWave, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent( gg_trg_HeroDead, u, EVENT_UNIT_DEATH )
call GroupAddUnit( udg_CheckHpGroup, u )
call MultiboardReleaseItem(udg_lsmb)
set mbi=null
set n=GetUnitTypeId(u)
set u=null
return n
endfunction









function random1 takes player p returns integer
local unit u
local integer i=GetRandomInt(1,12)//英雄满了就12
local integer n=1
local integer g=GetConvertedPlayerId(p)
local multiboarditem mbi
local integer t=GetRandomInt(1,8)
set udg_lsmb=MultiboardGetItem(udg_BlackBoard,g,0)

if LoadInteger(udg_Hash2,101,i)==1 then//已被选了的话
set u=null
set mbi=null
return 0
endif



if i==1 then//半边天
set u=CreateUnit(p,'Udth',0,0,270)
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNSeaGiantGreen.blp" )
call TriggerRegisterUnitEvent( gg_trg_maoji, u, EVENT_UNIT_HERO_LEVEL )
call TriggerRegisterUnitEvent( gg_trg_AroundChuanCiT, u, EVENT_UNIT_SPELL_EFFECT )
else
if i==2 then//38h
set u=CreateUnit(p,'Nplh',0,0,270) 
call TriggerRegisterUnitEvent( gg_trg_divewater, u, EVENT_UNIT_SPELL_CHANNEL )
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNNagaMyrmidon.blp" )
//call TriggerRegisterUnitEvent( gg_trg_ghostship, u, EVENT_UNIT_SPELL_EFFECT )
else
if i==3 then//马脸
set u=CreateUnit(p,'Otch',0,0,270)
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNcentaur.blp" )
call TriggerRegisterUnitEvent( gg_trg_jiefangqiao, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent( gg_trg_HorseSong, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent( gg_trg_Kuaimajiabian, u, EVENT_UNIT_SPELL_EFFECT )
else
if i==4 then//这老头
set u=CreateUnit(p,'Hpal',0,0,270)
call TriggerRegisterUnitEvent( gg_trg_angleup, u, EVENT_UNIT_HERO_LEVEL )
call TriggerRegisterUnitEvent( gg_trg_SpeddAddAttack, u, EVENT_UNIT_TARGET_IN_RANGE )
call SaveInteger(udg_Hash3,GetHandleId(u),336,'ANsw')
call tiaozhengz(u)
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNMedivh.blp" )
call SetPlayerAbilityAvailable( p, 'A00C', false )
else
if i==5 then//kimi
set u=CreateUnit(p,'Udre',0,0,270)
call TriggerRegisterUnitEvent( gg_trg_xixueguanghuan, u, EVENT_UNIT_HERO_LEVEL )
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNSkeletonArcher.blp" )
else
if i==6 then//猛犸
set u=CreateUnit(p,'Npld',0,0,270)
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNBlueMagnataur.blp" )
call TriggerRegisterUnitEvent( gg_trg_liangjifanzhuan, u, EVENT_UNIT_SPELL_EFFECT )
call SaveInteger(udg_Hash3,GetHandleId(u),336,'A09D')
call TriggerRegisterUnitEvent( gg_trg_shouyuliliang, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent( gg_trg_tigaoshouyuliliang, u, EVENT_UNIT_HERO_LEVEL )
else
if i==7 then//猪哥
set u=CreateUnit(p,'Oshd',0,0,270)
call TriggerRegisterUnitEvent( gg_trg_HAOZHU, u, EVENT_UNIT_HERO_LEVEL )
call SaveInteger(udg_Hash3,GetHandleId(u),336,'Arsq')
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNRazorback.blp" )
call TriggerRegisterUnitEvent( gg_trg_piggrass, u, EVENT_UNIT_SPELL_EFFECT )
else
if i==8 then//曾善祥
set u=CreateUnit(p,'Opgh',0,0,270)
call DisableTrigger( gg_trg_fanji )
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNChaosGrom.blp" )
call TriggerRegisterUnitEvent( gg_trg_Taunt, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent( gg_trg_Taotai, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent( gg_trg_fanji, u, EVENT_UNIT_ATTACKED )
call TriggerRegisterUnitEvent( gg_trg_Learnfanji, u, EVENT_UNIT_HERO_SKILL )
call SaveInteger(udg_Hash3,GetHandleId(u),336,'A0AL')
else
if i==9 then//SK
set u=CreateUnit(p,'Uanb',0,0,270)
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNArachnathidGreen.blp" )
call TriggerRegisterUnitEvent( gg_trg_ImpleCast, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent( gg_trg_EarthQuake, u, EVENT_UNIT_SPELL_FINISH )
else
if i==10 then//狗叼
set u=CreateUnit(p,'Orex',0,0,270)
call TriggerRegisterUnitEvent( gg_trg_wolfup, u, EVENT_UNIT_HERO_LEVEL )
call TriggerRegisterUnitEvent( gg_trg_AllT, u, EVENT_UNIT_SPELL_EFFECT )
call SaveInteger(udg_Hash3,GetHandleId(u),336,'ACs7')
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNWolf.blp" )
else
if i==11 then//MYD
set u=CreateUnit(p,'Udea',0,0,270)
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNHeroDeathKnight.blp" )
call TriggerRegisterUnitEvent( gg_trg_qiyue, u, EVENT_UNIT_SPELL_EFFECT )
call SaveInteger(udg_Hash3,GetHandleId(u),336,'A08J')
else
if i==12 then//鑫头
set u=CreateUnit(p,'Ogrh',0,0,270)
//set udg_lsu=CreateUnit(p,'n001',0,0,0)
//call UnitAddItemToSlotById( udg_lsu, 'wshs', 0 )
//call SaveUnitHandle(udg_Hash2,GetHandleId(u),362,udg_lsu)
//call TriggerRegisterUnitEvent( gg_trg_illcloudy, u, EVENT_UNIT_HERO_LEVEL )
call TriggerRegisterUnitEvent( gg_trg_fulandengji, u, EVENT_UNIT_HERO_LEVEL )
call TriggerRegisterUnitEvent( gg_trg_FulanOn, u, EVENT_UNIT_ISSUED_ORDER )
call TriggerRegisterUnitEvent( gg_trg_FulanOff, u, EVENT_UNIT_ISSUED_ORDER )
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNAbomination.blp" )
//call TriggerRegisterUnitEvent( gg_trg_CheckHp, u, EVENT_UNIT_HERO_SKILL )
call TriggerRegisterUnitEvent( gg_trg_gouzi, u, EVENT_UNIT_SPELL_EFFECT )

call TriggerRegisterUnitEvent( gg_trg_FreshMeat, u, EVENT_UNIT_SPELL_EFFECT )

else
endif
endif
endif
endif
endif
endif
endif
endif
endif
endif
endif
endif

call SaveInteger(udg_Hash2,101,i,1) //即第一个酒馆随到的第i个英雄已经被选择
call SaveInteger(udg_Hash2,GetHandleId(u),8529,1)//1为力量2为敏捷3为智力
set udg_PlayerLockToHero[GetConvertedPlayerId(p)]=u//将玩家与英雄绑定起来，索引号为1-12
call SetUnitX(u,udg_ReviveX[t])
call SetUnitY(u,udg_ReviveY[t])
call PanCameraToForPlayer( p,udg_ReviveX[t], udg_ReviveY[t] )
call SaveInteger(udg_Hash2,GetHandleId(u),25,1)
call SetPlayerName( p,  udg_PlayerName[g] +"("+ GetUnitName(u)+")"  )
set mbi=MultiboardGetItem(udg_BlackBoard,g,1)
call MultiboardSetItemValue(mbi,udg_YANSE[g]+GetPlayerName(p)+"|r")
call MultiboardReleaseItem(mbi)
if udg_Test==true then
else
call SetPlayerMaxHeroesAllowed(0,p)
endif
call SaveInteger(udg_Hash3,GetHandleId(u),332,0)
call SaveInteger(udg_Hash3,GetHandleId(u),333,0)
call TriggerRegisterUnitEvent( gg_trg_BuyToRevive, u, EVENT_UNIT_HERO_REVIVE_FINISH )
call TriggerRegisterUnitEvent( gg_trg_attacked, u, EVENT_UNIT_ATTACKED )
call TriggerRegisterUnitEvent( gg_trg_GetItem, u, EVENT_UNIT_PICKUP_ITEM )
call TriggerRegisterUnitEvent( gg_trg_UseItem, u, EVENT_UNIT_SPELL_EFFECT )
call AddGetHarmTrigger(u)
call TriggerRegisterUnitEvent( gg_trg_chenmoshushi, u, EVENT_UNIT_SPELL_ENDCAST )
call TriggerRegisterUnitEvent( gg_trg_LearnAbility, u, EVENT_UNIT_HERO_SKILL )
call TriggerRegisterUnitEvent( gg_trg_ReduceWave, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent( gg_trg_HeroDead, u, EVENT_UNIT_DEATH )
call GroupAddUnit( udg_CheckHpGroup, u )
call MultiboardReleaseItem(udg_lsmb)
set mbi=null
set n=GetUnitTypeId(u)
set u=null
return n
endfunction



function Trig_Random1_Actions takes nothing returns nothing
local player p=GetTriggerPlayer()
local integer t//目前是9个酒馆所以1-9
local integer n=0
if udg_PlayerLockToHero[GetConvertedPlayerId(p)] != null then
call DisplayTextToPlayer( p, 0, 0, "|cfffeba0e你已选取了英雄|r ")
set p=null
return
endif

loop
exitwhen n!=0
set t=GetRandomInt(101,109)
if t==101 then
set n=random1(p)
else
if t==102 then
set n=random2(p)
else
if t==103 then
set n=random3(p)
else
if t==104 then
set n=random4(p)
else
if t==105 then
set n=random5(p)
else
if t==106 then
set n=random6(p)
else
if t==107 then
set n=random7(p)
else
if t==108 then
set n=random8(p)
else
if t==109 then
set n=random9(p)
else
endif
endif
endif
endif
endif
endif
endif
endif
endif
endloop

call unaviliable( n )
set p=null
endfunction
//===========================================================================
function InitTrig_Random1 takes nothing returns nothing
    set gg_trg_Random1 = CreateTrigger(  )
    call TriggerAddAction( gg_trg_Random1, function Trig_Random1_Actions )
endfunction
