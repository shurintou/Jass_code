//*  Triggers
//*
//***************************************************************************

//===========================================================================
// Trigger: Start
//
// Hash1///////英雄原始技能用                         udg_Hash3,357,753  刷新分的Timer   udg_Hash3,358,853  
// Hash2///////系统用                                    udg_Hash1,234,159//HXT    
// Hash3///////公用技能用
// udg_CheckHpGroup/////////鑫头，U鬼，都可以用的所有英雄单位组
//              (0,0,英雄头像)
//     call SMBI(0,1,"|cff1ce6b9玩家|r")
//     call SMBI(0,2,"|c00fffc01金钱|r")
//     call SMBI(0,3,"|cff540081等级|r")
//     call SMBI(0,4,"|cff20c000杀人数|r")
//     call SMBI(0,5,"|cffff0303死亡数|r")
//     call SMBI(0,6,"|cff0042ff得分|r")
//     call SMBI(0,8,"|cffd55bb0复活时间|r")
// call IssueTargetOrderById( gg_unit_nmer_0003, 852566, udg_PlayerLockToHero[i] )
// call IssueTargetOrderById( gg_unit_nmr5_0105, 852566, udg_PlayerLockToHero[i] )
// call IssueTargetOrderById( gg_unit_nmr2_0021, 852566, udg_PlayerLockToHero[i] )
// call IssueTargetOrderById( gg_unit_nmr6_0106, 852566, udg_PlayerLockToHero[i] )
// call IssueTargetOrderById( gg_unit_nmr3_0090, 852566, udg_PlayerLockToHero[i] )
// call IssueTargetOrderById( gg_unit_nmr7_0107, 852566, udg_PlayerLockToHero[i] )
// call IssueTargetOrderById( gg_unit_utom_0132, 852566, udg_PlayerLockToHero[i] )
// call IssueTargetOrderById( gg_unit_ovln_0129, 852566, udg_PlayerLockToHero[i] )
// call IssueTargetOrderById( gg_unit_ngme_0005, 852566, udg_PlayerLockToHero[i] )
// call IssueTargetOrderById( gg_unit_eden_0131, 852566, udg_PlayerLockToHero[i] )
// call IssueTargetOrderById( gg_unit_ngad_0133, 852566, udg_PlayerLockToHero[i] )
// call IssueTargetOrderById( gg_unit_nmrd_0136, 852566, udg_PlayerLockToHero[i] )
// call IssueTargetOrderById( gg_unit_nmr4_0135, 852566, udg_PlayerLockToHero[i] )
// call IssueTargetOrderById( gg_unit_hvlt_0020, 852566, udg_PlayerLockToHero[i] )
// call IssueTargetOrderById( gg_unit_nmr0_0138, 852566, udg_PlayerLockToHero[i] )
// call IssueTargetOrderById( gg_unit_nmrf_0134, 852566, udg_PlayerLockToHero[i] )
//===========================================================================
function AddAbilityBonusAct takes nothing returns nothing
local player p=GetEnumPlayer()
call SetPlayerState( p, PLAYER_STATE_RESOURCE_LUMBER, GetPlayerState(p, PLAYER_STATE_RESOURCE_LUMBER)+1 )
set p=null
endfunction

function addabilitybonus takes nothing returns nothing
local timer tm=GetExpiredTimer()
local integer i=GetHandleId(tm)
local integer n=LoadInteger(udg_Hash3,i,1)



if n!=11 then
call DisplayTimedTextToForce( udg_OnlinePlayer, 60.00, "|cff20c000系统给予了每个英雄一点新技能点，赶快去学习技能吧。|r" )
call ForForce(udg_OnlinePlayer,function AddAbilityBonusAct)
call SaveInteger(udg_Hash3,i,1,n+1)
call PingMinimapEx( -7247, 4880, 10.00, 0, 0, 255, true )
else
call FlushChildHashtable( udg_Hash3, i )
call PauseTimer(tm)
call DestroyTimer(tm)
endif

set tm=null
endfunction

function suregamemode takes nothing returns nothing
if IsTriggerEnabled(gg_trg_SureWinScore) == true then
call DisplayTimedTextToForce( udg_OnlinePlayer, 30.00, "本场比赛获得胜利所需的得分为默认的|cffff0303100|r" )
call DestroyTrigger( gg_trg_SureWinScore )
endif

if IsTriggerEnabled(gg_trg_SureAbilityForbidden) == true then
call DisplayTimedTextToForce( udg_OnlinePlayer, 30.00, "本场比赛技能学习模式为默认的|cff20c000无限制模式|r" )
call DestroyTrigger( gg_trg_SureAbilityForbidden )
endif

call DestroyTimer(GetExpiredTimer())
endfunction

function RefreshPlayerScore takes nothing returns nothing
local player p=GetEnumPlayer()
local integer n=GetConvertedPlayerId(p)
local unit u=udg_PlayerLockToHero[n]
local integer i=GetPlayerState(p, PLAYER_STATE_RESOURCE_FOOD_CAP )


call SetPlayerState( p, PLAYER_STATE_RESOURCE_GOLD, GetPlayerState(p, PLAYER_STATE_RESOURCE_GOLD)+2 )
call SMBI(n,2,I2S(GetPlayerState(p, PLAYER_STATE_RESOURCE_GOLD)))
call SMBI(n,3,I2S(GetHeroLevel(u)))
call SMBI(n,4,I2S(GetPlayerScore(p, PLAYER_SCORE_HEROES_KILLED)))
call SMBI(n,5,I2S(udg_KilledTimes[n]))
call SMBI(n,6,I2S(udg_PlayerScore[n]))
call SMBI(n,8,I2S(R2I(TimerGetRemaining(LoadTimerHandle(udg_Hash2,GetHandleId(u),20)))))
call UnitShareVision( gg_unit_hvlt_0020, p, true )
call UnitShareVision( gg_unit_nmr0_0138, p, true )
call UnitShareVision( gg_unit_eden_0131, p, true )
call UnitShareVision( gg_unit_ovln_0129, p, true )
call UnitShareVision( gg_unit_nmrd_0136, p, true )
call UnitShareVision( gg_unit_utom_0132, p, true )
call UnitShareVision( gg_unit_nmr4_0135, p, true )
call UnitShareVision( gg_unit_ngme_0005, p, true )
call UnitShareVision( gg_unit_harm_0113, p, true )
call UnitShareVision( gg_unit_nmrf_0134, p, true )
call UnitShareVision( gg_unit_ngad_0133, p, true )
call UnitShareVision( gg_unit_ntav_0004, p, true )
call UnitShareVision( gg_unit_nmrk_0102, p, true )
call UnitShareVision( gg_unit_nmrc_0104, p, true )
call UnitShareVision( gg_unit_nmer_0003, p, true )
call UnitShareVision( gg_unit_nmr2_0021, p, true )
call UnitShareVision( gg_unit_nmr3_0090, p, true )
call UnitShareVision( gg_unit_nmr5_0105, p, true )
call UnitShareVision( gg_unit_nmr6_0106, p, true )
call UnitShareVision( gg_unit_nmr7_0107, p, true ) 
call UnitShareVision( gg_unit_hars_0137, p, true )
call UnitShareVision( gg_unit_edob_0140, p, true )
call UnitShareVision( gg_unit_npgr_0141, p, true )
call SetPlayerState( p, PLAYER_STATE_RESOURCE_FOOD_CAP, 1+i )
if 1+i==60 then
call SetPlayerState( p, PLAYER_STATE_RESOURCE_FOOD_CAP, 0 )
call SetPlayerState( p, PLAYER_STATE_RESOURCE_FOOD_USED,GetPlayerState(p,PLAYER_STATE_RESOURCE_FOOD_USED)+1)
endif
if udg_PlayerScore[n]>=udg_WinScore then
call PauseAllUnitsBJ( true )
call SaveInteger(udg_Hash3,358,853,333)
call DisplayTimedTextToForce( udg_OnlinePlayer, 30,udg_YANSE[n]+GetPlayerName(p)+"|r取得了这场三八货大乱斗的胜利!谢谢大家的参与!")
endif
set u=null
set p=null
endfunction
/////////////////////////////////////////////////////
function CheckToLeavePlayer takes nothing returns nothing
local player p=GetEnumPlayer()
local integer n=GetConvertedPlayerId(p)

if udg_PlayerScore[n]>=udg_WinScore then
call DisplayTimedTextToForce( udg_OnlinePlayer, 30,udg_YANSE[n]+GetPlayerName(p)+"|r取得了这场三八货大乱斗的胜利!谢谢大家的参与!")
call CustomVictoryBJ( p, true, true )
else
call CustomDefeatBJ( p, "你被三八货打败了!" )
endif

set p=null
endfunction
/////////////////////////////////////////////////////
function SystemTimer takes nothing returns nothing
local integer i=1
loop
exitwhen i>12
call SetUnitX(udg_Bag[i],GetUnitX(udg_PlayerLockToHero[i]))
call SetUnitY(udg_Bag[i],GetUnitY(udg_PlayerLockToHero[i]))
//call IssueNeutralTargetOrderById( Player(PLAYER_NEUTRAL_PASSIVE), gg_unit_nmer_0003, 852566, udg_PlayerLockToHero[i] )
set i=i+1
endloop
if LoadInteger(udg_Hash3,358,853)!=333 then
call ForForce(udg_OnlinePlayer,function RefreshPlayerScore)
else
call DestroyTimer(GetExpiredTimer())
call DestroyTrigger( gg_trg_HeroDead )
call ForForce(udg_OnlinePlayer,function CheckToLeavePlayer)
endif
endfunction


function revivetreeact takes nothing returns nothing
call DestructableRestoreLife( GetEnumDestructable(), 100.00, true )
endfunction

function revivetree takes nothing returns nothing
call EnumDestructablesInRectAll( GetPlayableMapRect(), function revivetreeact )
endfunction


function Trig_Start_Actions takes nothing returns nothing
    local integer i=0
    local unit m 
    local multiboarditem mbi
    local timer tm=CreateTimer()
    local integer n=-1//用于判定处于最高楼层的玩家，来输入指令
    local player p
    call SetPlayerState(Player(PLAYER_NEUTRAL_AGGRESSIVE),PLAYER_STATE_RESOURCE_GOLD,99999)//中立敌对玩家的钱,方便赏金打钱
    call EnableWeatherEffect( GetLastCreatedWeatherEffect(), false )
    call SetPlayerName( Player(PLAYER_NEUTRAL_PASSIVE), "|c00fffc01中立商店|r" )
    call DisableTrigger( gg_trg_repick )//一开始不能repick，30秒后可以
    //call DisableTrigger( gg_trg_LearnAbility )//一开始不记录技能，60秒后开始记录
    //call InitHashtableBJ(  )
    set udg_Hash1 =InitHashtable(  )
    set udg_Hash2 =InitHashtable(  )
    set udg_Hash3 =InitHashtable(  )
    set udg_Hash4 =InitHashtable(  )//杀人书剑盾即紫怨血精石专用
    set udg_Hash5 =InitHashtable(  )//单位受伤害事件
    set udg_Hash6 =InitHashtable(  )//符文
    call ShowUnit( gg_unit_Hamg_0130, false )
    call ShowUnit( gg_unit_Ewrd_0109, false )
    call SetUnitInvulnerable( gg_unit_Hamg_0130, true )// 一开始先隐藏刘弟
    call SetUnitInvulnerable( gg_unit_Ewrd_0109, true )
    call SetUnitOwner( gg_unit_Hamg_0130, Player(bj_PLAYER_NEUTRAL_VICTIM), false )
    call SetUnitOwner( gg_unit_Ewrd_0109, Player(bj_PLAYER_NEUTRAL_VICTIM), false )
    call AddItemToStock( gg_unit_nmrf_0134,'I03A', 1, 1 )//灵魂宝石和不死之身
    //call AddItemToStock( gg_unit_nmrf_0134,'I01O', 1, 1 )
    set udg_YANSE[1] = "|cffff0303"
    set udg_YANSE[2] = "|cff0042ff"
    set udg_YANSE[3] = "|cff1ce6b9"
    set udg_YANSE[4] = "|cff540081"
    set udg_YANSE[5] = "|c00fffc01"
    set udg_YANSE[6] = "|cfffeba0e"
    set udg_YANSE[7] = "|cff20c000"
    set udg_YANSE[8] = "|cffd55bb0"
    set udg_YANSE[9] = "|cff959697"
    set udg_YANSE[10] = "|cff7ebff1"
    set udg_YANSE[11] = "|cff106246"
    set udg_YANSE[12] = "|cff4c2a04"
    set udg_KillWords[1]="|cff1ce6b9大杀特杀|r"
    set udg_KillWords[2]="|cff540081主宰比赛|r"
    set udg_KillWords[3]="|cffd55bb0杀人如麻|r"
    set udg_KillWords[4]="|cfffeba0e无人可挡|r"
    set udg_KillWords[5]="|c00fffc01变态杀戮|r"
    set udg_KillWords[6]="|cff7ebff1妖怪似的杀戮|r"
    set udg_KillWords[7]="|cffff0303如同神一般|r"
    set udg_KillWords[8]="|cff20c000超越神的杀戮|r"
    set udg_KillSounds[1]=gg_snd_killing_spree
    set udg_KillSounds[2]=gg_snd_dominating 
    set udg_KillSounds[3]=gg_snd_megakill 
    set udg_KillSounds[4]=gg_snd_unstoppable 
    set udg_KillSounds[5]=gg_snd_whickedsick 
    set udg_KillSounds[6]=gg_snd_monsterkill 
    set udg_KillSounds[7]=gg_snd_godlike 
    set udg_KillSounds[8]=gg_snd_holyshit 
    set udg_ReviveX[1]=-3330
    set udg_ReviveY[1]=2083
    set udg_ReviveX[2]=-1631
    set udg_ReviveY[2]=3325
    set udg_ReviveX[3]=1086
    set udg_ReviveY[3]=3547
    set udg_ReviveX[4]=3600
    set udg_ReviveY[4]=1500
    set udg_ReviveX[5]=5150
    set udg_ReviveY[5]=-2400
    set udg_ReviveX[6]=628
    set udg_ReviveY[6]=-4000
    set udg_ReviveX[7]=-2200
    set udg_ReviveY[7]=-3390
    set udg_ReviveX[8]=-5700
    set udg_ReviveY[8]=1655
    set udg_CreepRect[1] = gg_rct______________001
    set udg_CreepRect[2] = gg_rct______________002
    set udg_CreepRect[3] = gg_rct______________003
    set udg_CreepRect[4] = gg_rct______________004
    set udg_CreepRect[5] = gg_rct______________005
    set udg_CreepRect[6] = gg_rct______________006
    set udg_CreepRect[7] = gg_rct______________007
    set udg_CreepRect[8] = gg_rct______________008
    set udg_CreepRect[9] = gg_rct______________009
    set udg_CreepRect[10] = gg_rct______________010
    set udg_CreepRect[11] = gg_rct______________011
    set udg_CreepRect[12] = gg_rct______________012
    set udg_CreepRect[13] = gg_rct______________013
    set udg_CreepRect[14] = gg_rct______________014
    set udg_CreepRect[15] = gg_rct______________015
    set udg_CreepRect[16] = gg_rct______________016
    set udg_CreepRect[17] = gg_rct______________017
    set udg_CreepRect[18] = gg_rct______________018
    set udg_XMAX = GetRectMaxX(GetPlayableMapRect())
    set udg_YMAX = GetRectMaxY(GetPlayableMapRect())
    set udg_XMIN = GetRectMinX(GetPlayableMapRect())
    set udg_YMIN = GetRectMinY(GetPlayableMapRect())
    call CreateMultiboardBJ( 12, 13, "|cff7ebff1三八货大乱斗|r" )
    set udg_BlackBoard = GetLastCreatedMultiboard()
    call MultiboardSetItemsStyle( udg_BlackBoard, true, false )
    
    call SMBI(0,1,"|cff1ce6b9玩家|r")
    call SMBI(0,2,"|c00fffc01金钱|r")
    call SMBI(0,3,"|cff540081等级|r")
    call SMBI(0,4,"|cff20c000杀人数|r")
    call SMBI(0,5,"|cffff0303死亡数|r")
    call SMBI(0,6,"|cff0042ff得分|r")
    call SMBI(0,8,"|cffd55bb0复活|r")
    call SMBI(0,10,"|cfffeba0e技能|r")
     
    set mbi=MultiboardGetItem(udg_BlackBoard,0,1)
    call MultiboardSetItemWidth(mbi,0.10)
    call MultiboardReleaseItem(mbi)
    set mbi=MultiboardGetItem(udg_BlackBoard,0,2)
    call MultiboardSetItemWidth(mbi,0.04)
    call MultiboardReleaseItem(mbi)
    set mbi=MultiboardGetItem(udg_BlackBoard,0,6)
    call MultiboardSetItemWidth(mbi,0.03)
    call MultiboardReleaseItem(mbi)
    set mbi=MultiboardGetItem(udg_BlackBoard,0,7)
    call MultiboardSetItemWidth(mbi,0.01)
    call MultiboardReleaseItem(mbi)
    set mbi=MultiboardGetItem(udg_BlackBoard,0,8)
    call MultiboardSetItemWidth(mbi,0.02)
    call MultiboardReleaseItem(mbi)
    set mbi=MultiboardGetItem(udg_BlackBoard,0,10)
    call MultiboardSetItemWidth(mbi,0.02)
    call MultiboardReleaseItem(mbi)
    set mbi=MultiboardGetItem(udg_BlackBoard,0,9)
    call MultiboardSetItemWidth(mbi,0.01)
    call MultiboardReleaseItem(mbi)
    set mbi=MultiboardGetItem(udg_BlackBoard,0,11)
    call MultiboardSetItemWidth(mbi,0.01)
    call MultiboardReleaseItem(mbi)

loop
exitwhen i>11

set p=Player(i)
if GetPlayerController(p) == MAP_CONTROL_USER and GetPlayerSlotState(p) == PLAYER_SLOT_STATE_PLAYING and IsPlayerObserver(p)==false then
set mbi=MultiboardGetItem(udg_BlackBoard,i+1,1)
call MultiboardSetItemValue(mbi,udg_YANSE[i+1]+GetPlayerName(p)+"|r")
call MultiboardSetItemWidth(mbi,0.10)
call MultiboardReleaseItem(mbi)
set mbi=MultiboardGetItem(udg_BlackBoard,i+1,2)
call MultiboardSetItemValue(mbi,I2S(GetPlayerState(p, PLAYER_STATE_RESOURCE_GOLD)))
call MultiboardSetItemWidth(mbi,0.04)
call MultiboardReleaseItem(mbi)
set mbi=MultiboardGetItem(udg_BlackBoard,i+1,6)
call MultiboardSetItemValue(mbi,"0")
call MultiboardSetItemWidth(mbi,0.03)
call MultiboardReleaseItem(mbi)
set mbi=MultiboardGetItem(udg_BlackBoard,i+1,7)
call MultiboardSetItemWidth(mbi,0.01)
call MultiboardReleaseItem(mbi)
set mbi=MultiboardGetItem(udg_BlackBoard,i+1,0)
call MultiboardSetItemStyle( mbi, false, true )
call MultiboardReleaseItem(mbi)
set mbi=MultiboardGetItem(udg_BlackBoard,i+1,8)
call MultiboardSetItemWidth(mbi,0.02)
call MultiboardReleaseItem(mbi)
/////技能/////
set mbi=MultiboardGetItem(udg_BlackBoard,i+1,10)
call MultiboardSetItemWidth(mbi,0.01)
call MultiboardReleaseItem(mbi)
set mbi=MultiboardGetItem(udg_BlackBoard,i+1,9)
call MultiboardSetItemWidth(mbi,0.01)
call MultiboardReleaseItem(mbi)
set mbi=MultiboardGetItem(udg_BlackBoard,i+1,11)
call MultiboardSetItemWidth(mbi,0.01)
call MultiboardReleaseItem(mbi)
///////
//call SetPlayerState( p, PLAYER_STATE_RESOURCE_LUMBER, 1 )//等1分钟后repick系统关闭了再给木头学技能
///set m=CreateUnit(p,'efdr',-384,4988,0)判定魔棒，暂时不用了
///call IssueImmediateOrderById(m,852512 )
call SetPlayerState( p, PLAYER_STATE_RESOURCE_GOLD, 1000 )
call SetPlayerAbilityAvailable( p, 'A0E5', false )
call TriggerRegisterPlayerChatEvent( gg_trg_TypeOrder, p, "-", false )
call TriggerRegisterPlayerChatEvent( gg_trg_Random1, p, "-random", true )
call TriggerRegisterPlayerSelectionEventBJ( gg_trg_QuxiaoYang, p, true )
call TriggerRegisterPlayerChatEvent( gg_trg_repick, p, "-repick", true )
call TriggerRegisterPlayerEventLeave( gg_trg_LeaveGame, p )
call SetPlayerAlliance( Player(PLAYER_NEUTRAL_PASSIVE), p, ALLIANCE_SHARED_CONTROL, true )
call SetPlayerAlliance( Player(PLAYER_NEUTRAL_PASSIVE), p, ALLIANCE_SHARED_ADVANCED_CONTROL, true )
call DisplayTextToPlayer( p, 0, 0, "游戏前30秒，玩家可输入|cff1ce6b9-random|r随机选取英雄。" )
call ForceAddPlayer( udg_OnlinePlayer,p)
set udg_PlayerName[i+1]=GetPlayerName(p)
if n==-1 then
set n=i
endif
else
call SetPlayerMaxHeroesAllowed( 0, p )
endif
call SetPlayerState( p, PLAYER_STATE_GIVES_BOUNTY, 1 )//杀死得钱
set i=i+1
endloop




call TimerStart(tm,1,true,function SystemTimer)
call SaveTimerHandle(udg_Hash3,357,753,tm)
call TimerStart(CreateTimer(),30,false,function suregamemode)
call TimerStart(CreateTimer(),180,true,function addabilitybonus)
call MultiboardDisplay( bj_lastCreatedMultiboard, true )
call MultiboardMinimize( udg_BlackBoard, false )
call TimerStart(CreateTimer(),300,true,function revivetree)
call DisplayTimedTextToForce( udg_OnlinePlayer, 30.00, "|cff7ebff1欢迎来到三八货的世界，在这里，谁的得分优先达到所规定的分数，谁就是最三八的三八货，因此，大家一起为三八货中的霸主这一称号而奋斗吧！|r" )
call DisplayTimedTextToPlayer( Player(n), 0, 0, 30, "输入|cff20c000-df XX|r以确定获胜玩家所需的得分数" )
call DisplayTimedTextToPlayer( Player(n), 0, 0, 30, "输入|cfffeba0e-af|r以确定公共技能的学习模式，在此模式下|cffff0303每种技能每个阵营只能学习一次,同时会禁掉一些物品|r" )
call TriggerRegisterPlayerChatEvent( gg_trg_SureWinScore, Player(n), "-df", false )
call TriggerRegisterPlayerChatEvent( gg_trg_SureAbilityForbidden, Player(n), "-af", true )
set udg_WinScore=100
call DisplayTimedTextToForce( udg_OnlinePlayer, 60.00, "在小地图的|cff0042ff蓝色信号|r处，可以学习技能，每个英雄每类技能只能学一种；在小地图的|cff20c000绿色信号|r处，可以购买进阶装备，且英雄在任意位置皆可购买")
call PingMinimapEx( -7247, 4880, 60.00, 0, 0, 255, true )
call PingMinimapEx( 7247, -5447, 60.00, 0, 255, 0, true )
call CreateQuestBJ( bj_QUESTTYPE_REQ_DISCOVERED, "|cff7ebff1欢迎来到三八货大乱斗|r", "欢迎来到三八货大乱斗的世界。在这里，你将享受到颠覆传统DOTA却又和DOTA战斗场面神似的游戏场景，你将体会到耀眼技能和豪华装备所带来的超神快感，你将领略到不一样的RPG游戏感受。你还在等什么？赶紧开始你的三八货大乱斗之旅吧！", "ReplaceableTextures\\CommandButtons\\BTNSorceressMaster.blp" )
call CreateQuestBJ( bj_QUESTTYPE_REQ_DISCOVERED, "|cff20c000关于游戏|r", "游戏可以进行多人大混战或者组队分阵营对抗，一切都由玩家自己支配。在游戏中玩家可输入-af,-df XX等指令来确定游戏的模式，还可输入-ms,-roll,-um(英雄出现不正常状态)等指令来完善自己的游戏进程。", "ReplaceableTextures\\CommandButtons\\BTNNecromancerAdept.blp" )
call CreateQuestBJ( bj_QUESTTYPE_REQ_DISCOVERED, "|c00fffc01关于物品|r", "游戏中英雄可以在任意位置购买物品，不须移动到商店附近。本游戏没有自动合成功能，所有合成物品均需要先购买配方，最后购买卷轴以进行合成。地图的右下角有高级物品装备出售。", "ReplaceableTextures\\CommandButtons\\BTNMGExchange.blp" )
call CreateQuestBJ( bj_QUESTTYPE_REQ_DISCOVERED, "|cff0042ff关于技能|r", "游戏中每个英雄除自身的两个技能之外，还可以在地图的左上角商店处学习三个公共技能：分别是主技能，副技能和被动技能。每隔3分钟，系统便会发给每个英雄一个技能点以学习技能，公共技能最高可以升到4级。", "ReplaceableTextures\\CommandButtons\\BTNSkillz.blp" )
call CreateQuestBJ( bj_QUESTTYPE_OPT_DISCOVERED, "|cffff0303关于作者|r", "本图作者：嘿咻猫，人称猫子，马脸。如有发现该地图的BUG请及时联系他，QQ199923312，邮箱leback@163.com。", "ReplaceableTextures\\CommandButtons\\BTNcentaur.blp" )
call CreateQuestBJ( bj_QUESTTYPE_OPT_DISCOVERED, "|cff540081关于拯救世界|r", "DOTA拯救世界群是本图作者创立的一个DOTA路人群，里面卧虎藏龙，人才济济，在VS各房间内创造了无数次神话和传说，已成为人气颇高的DOTA群之一。群号码：25414800，二群号码：53410786。", "ReplaceableTextures\\CommandButtons\\BTNOrcMeleeUpThree.blp" )
call CreateQuestBJ( bj_QUESTTYPE_OPT_DISCOVERED, "|cfffeba0e关于三八货|r", "三八货，对一般人而言可能是贬义词，但在拯救世界群里，三八货却是名符其实的褒义词。虽然很难具体定义三八货的概念，但是请相信，三八货绝对不是你想象的那样的，真的，你们懂的。", "ReplaceableTextures\\CommandButtons\\BTNNagaMyrmidon.blp" )
call CreateQuestBJ( bj_QUESTTYPE_REQ_DISCOVERED, "|cff959697关于符文|r", "符文可以在地图左下角的符文商店里购买，是除了装备之外加强英雄能力的另一途径，选择适合英雄的符文是很重要的，但不推荐一开始就购买符文，正确的方法是先出装备，再买符文。", "ReplaceableTextures\\CommandButtons\\BTNDeathPact.blp" )
   ////////////游戏参数部分////////////
    call SetMapFlag(MAP_LOCK_SPEED, true)
    call SetMapFlag( MAP_LOCK_RESOURCE_TRADING, true )
    call SetMapFlag( MAP_OBSERVERS_ON_DEATH, true )
    call SetMapFlag( MAP_RESOURCE_TRADING_ALLIES_ONLY, true )
    call SetTimeOfDay( 6 )

set p=null
set m=null
set mbi=null
set tm=null
endfunction

//===========================================================================
function InitTrig_Start takes nothing returns nothing
    set gg_trg_Start = CreateTrigger(  )
    call TriggerRegisterTimerEventSingle( gg_trg_Start, 0.00 )
    call TriggerAddAction( gg_trg_Start, function Trig_Start_Actions )
endfunction
