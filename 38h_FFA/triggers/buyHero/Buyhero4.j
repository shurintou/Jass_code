
//===========================================================================
// Trigger: Buyhero4
//
// call SaveInteger(udg_Hash3,GetHandleId(u),334,'Aesr')tiaozhengz
// //call TriggerRegisterUnitInRangeSimple( gg_trg_GetCloseToGOGO, 300.00, u )
// //call SaveUnitHandle(udg_Hash1,GetHandleId(gg_trg_GetCloseToGOGO),1,u)
// //call DisableTrigger( gg_trg_GetCloseToGOGO )
//===========================================================================
function Trig_Buyhero4_Actions takes nothing returns nothing
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

if i=='Eill' then//V弟
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNGuldanSkull.blp" )
call TriggerRegisterUnitEvent( gg_trg_Stone, u, EVENT_UNIT_SPELL_EFFECT )
call SaveInteger(udg_Hash3,GetHandleId(u),336,'A08K')
else
if i=='Nalc' then//QY
call TriggerRegisterUnitEvent( gg_trg_AddMoney, u, EVENT_UNIT_HERO_SKILL )
call SaveInteger(udg_Hash3,GetHandleId(u),336,'A08I')
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNHeroAlchemist.blp" )
else
if i=='Hmgd' then//龙哥
call SetPlayerTechResearchedSwap( 'Rhar', 1, p )
call tiaozhengz(u)
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNTheCaptain.blp" )
call TriggerRegisterUnitEvent( gg_trg_TrueDragon, u, EVENT_UNIT_HERO_SKILL )
else
if i=='Hpb2' then//豹爷
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNDoomGuard.blp" )
call SetPlayerAbilityAvailable( p, 'A046', false )
call UnitRemoveAbility( u, 'B01B' )
call SaveInteger(udg_Hash3,GetHandleId(u),336,'Adev')
call TriggerRegisterUnitEvent( gg_trg_tunshishengji, u, EVENT_UNIT_HERO_LEVEL )
call TriggerRegisterUnitEvent( gg_trg_BrunGround, u, EVENT_UNIT_SPELL_EFFECT )
else
if i=='Ubal' then//夜使老
call UnitAddAbility( u, 'A05I' )
call SetPlayerAbilityAvailable( p, 'A05I', false )
call UnitRemoveAbility(u,'B01R')
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNTichondrius.blp" )
call TriggerRegisterUnitEvent( gg_trg_LearnNight, u, EVENT_UNIT_HERO_SKILL )
call TriggerRegisterUnitEvent( gg_trg_DarkTime, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent( gg_trg_shangcankongju, u, EVENT_UNIT_HERO_LEVEL )
call SaveInteger(udg_Hash3,GetHandleId(u),336,'A0AT')
else
if i=='Uvng' then//小柳续
call TriggerRegisterUnitEvent( gg_trg_attacktree, u, EVENT_UNIT_TARGET_IN_RANGE )
call SaveInteger(udg_Hash3,GetHandleId(u),336,'Aesr')
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNAncientOfTheMoon.blp" )
else
if i=='Hapm' then//发条
call TriggerRegisterUnitEvent( gg_trg_AttackWithFire, u, EVENT_UNIT_TARGET_IN_RANGE )
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNClockWerkGoblin.blp" )
call TriggerRegisterUnitEvent( gg_trg_HighFire, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent( gg_trg_GOGOGO, u, EVENT_UNIT_SPELL_EFFECT )
call SaveInteger(udg_Hash3,GetHandleId(u),336,'Afla')
else
if i=='Harf' then//帅猫
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNArthas.blp" )
call TriggerRegisterUnitEvent( gg_trg_HolyAttack, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent( gg_trg_huoyanzhiren, u, EVENT_UNIT_HERO_LEVEL )
else
if i=='Ocbh' then//兽步
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNGrunt.blp" )
call TriggerRegisterUnitEvent( gg_trg_LearnLH, u, EVENT_UNIT_HERO_SKILL )
call TriggerRegisterUnitEvent( gg_trg_Kungbaoliliang, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent( gg_trg_Fshouxingpifu, u, EVENT_UNIT_SPELL_EFFECT )
else
if i=='Ocb2' then//牛头
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNTauren.blp" )
call TriggerRegisterUnitEvent( gg_trg_clap, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent( gg_trg_wavechong, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent( gg_trg_fensui, u, EVENT_UNIT_HERO_LEVEL )
else
if i=='Odrt' then//神经病
call SaveInteger(udg_Hash3,GetHandleId(u),336,'A094')
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNHeadhunter.blp" )
call DisableTrigger( gg_trg_AttackPoison )
call TriggerRegisterUnitEvent( gg_trg_SpellPoison, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent( gg_trg_XISHENG, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent( gg_trg_AttackPoison, u, EVENT_UNIT_TARGET_IN_RANGE )
call TriggerRegisterUnitEvent( gg_trg_OrderPoison, u, EVENT_UNIT_ISSUED_ORDER )
call SetPlayerAbilityAvailable( p, 'AIat', false )
call SetPlayerAbilityAvailable( p, 'AIsx', false )
call TriggerRegisterUnitEvent( gg_trg_learnaddas, u, EVENT_UNIT_HERO_SKILL )
else
if i=='Nsjs' then//昕胖
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

call unaviliable(i)
call SaveInteger(udg_Hash2,GetHandleId(u),8529,1)//1为力量2为敏捷3为智力
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
function InitTrig_Buyhero4 takes nothing returns nothing
    set gg_trg_Buyhero4 = CreateTrigger(  )
    call TriggerRegisterUnitEvent( gg_trg_Buyhero4, gg_unit_nmr9_0139, EVENT_UNIT_SELL )
    call TriggerAddAction( gg_trg_Buyhero4, function Trig_Buyhero4_Actions )
endfunction
