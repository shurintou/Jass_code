
//===========================================================================
// Trigger: Buyhero5
//
// call SaveInteger(udg_Hash3,GetHandleId(u),334,'A08L')gg_trg_julihuiwu
//===========================================================================
function Trig_Buyhero5_Actions takes nothing returns nothing
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

if i=='Efur' then//毒舌
call TriggerRegisterUnitEvent( gg_trg_illcloudy, u, EVENT_UNIT_HERO_LEVEL )
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNNetherDragon.blp" )
else
if i=='Hvsh' then//Naga
call TriggerRegisterUnitEvent( gg_trg_Purge, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent( gg_trg_LearnPurge, u, EVENT_UNIT_HERO_SKILL )
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNNagaSeaWitch.blp" )
else
if i=='Umal' then//土豆泥
call TriggerRegisterUnitEvent( gg_trg_JiduKewang, u, EVENT_UNIT_TARGET_IN_RANGE )
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNSludgeCreature.blp" )
else
if i=='Ewrd' then//QY
call TriggerRegisterPlayerUnitEventSimple( gg_trg_Summoned, p, EVENT_PLAYER_UNIT_SUMMON )
call DisableTrigger( gg_trg_Summoned )
call DisableTrigger( gg_trg_MoveTo )
call TriggerRegisterUnitEvent( gg_trg_Dawn, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent( gg_trg_MoveTo, u, EVENT_UNIT_SPELL_EFFECT )
call SetPlayerAbilityAvailable( p, 'A047', false )
call SaveInteger(udg_Hash3,GetHandleId(u),336,'ACad')
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNvengeanceincarnate.blp" )
call TriggerRegisterUnitEvent( gg_trg_learnhuangwu, u, EVENT_UNIT_HERO_SKILL )
call TriggerRegisterUnitEvent( gg_trg_learndawn, u, EVENT_UNIT_HERO_SKILL )
else
if i=='Etyr' then//虎哥
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNHuntress.blp" )
call TriggerRegisterUnitEvent( gg_trg_EatMoon, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent(gg_trg_MAoTouYING, u, EVENT_UNIT_HERO_LEVEL )
call SaveInteger(udg_Hash3,GetHandleId(u),336,'AEst')
else
if i=='Usyl' then//小黑
call TriggerRegisterUnitEvent( gg_trg_LearnAgi, u, EVENT_UNIT_HERO_SKILL )
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNBansheeRanger.blp" )
else
if i=='Hlgr' then//骚爷
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNKnight.blp" )
call TriggerRegisterUnitEvent( gg_trg_SXLX, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent( gg_trg_Tear, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent( gg_trg_CheckHp, u, EVENT_UNIT_HERO_SKILL )
call TriggerRegisterUnitEvent(gg_trg_xuezhikuangbao, u, EVENT_UNIT_HERO_LEVEL )
call SaveInteger(udg_Hash3,GetHandleId(u),336,'A0AU')
else
if i=='Nfir' then//三把火
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNHeroAvatarOfFlame.blp" )
call TriggerRegisterUnitEvent( gg_trg_FireRain, u, EVENT_UNIT_SPELL_EFFECT )
call SaveInteger(udg_Hash3,GetHandleId(u),336,'A08L')
call TriggerRegisterUnitEvent( gg_trg_yanmo, u, EVENT_UNIT_HERO_LEVEL )
call TriggerRegisterUnitEvent( gg_trg_vieee, u, EVENT_UNIT_SPELL_FINISH )
call TriggerRegisterUnitEvent( gg_trg_vbegin, u, EVENT_UNIT_SPELL_EFFECT )
call SaveUnitHandle(udg_Hash1,GetHandleId(gg_trg_vieee),1,u)
else
if i=='Hhkl' then//帅气的V弟  
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNFelGuardBlue.blp" )
call TriggerRegisterUnitEvent( gg_trg_ClapGo, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent( gg_trg_julihuiwu, u, EVENT_UNIT_HERO_LEVEL )
call TriggerRegisterUnitEvent( gg_trg_GodGoDown, u, EVENT_UNIT_SPELL_EFFECT )
else
if i=='Npbm' then//HXT
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
if i=='Utic' then//十
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNGargoyle.blp" )
call SaveInteger(udg_Hash3,GetHandleId(u),336,'Astn')
call TriggerRegisterUnitEvent( gg_trg_attackevil, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent( gg_trg_stunbyshixiang, u, EVENT_UNIT_SPELL_EFFECT )
else
if i=='Hart' then//船长
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
function InitTrig_Buyhero5 takes nothing returns nothing
    set gg_trg_Buyhero5 = CreateTrigger(  )
    call TriggerRegisterUnitEvent( gg_trg_Buyhero5, gg_unit_nmra_0144, EVENT_UNIT_SELL )
    call TriggerAddAction( gg_trg_Buyhero5, function Trig_Buyhero5_Actions )
endfunction
