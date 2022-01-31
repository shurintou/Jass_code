
//===========================================================================
// Trigger: Buyhero2
//
// 
// call SaveInteger(udg_Hash3,GetHandleId(u),334,'AOfs')
//===========================================================================
function Trig_Buyhero2_Actions takes nothing returns nothing
local unit u= GetSoldUnit()
local integer i=GetUnitTypeId(u)
local player p=GetOwningPlayer(u)
local integer n=1
local multiboarditem mbi
local integer g=GetConvertedPlayerId(p)
local integer t=GetRandomInt(1,8)

call SetUnitX(u,udg_ReviveX[t])
call SetUnitY(u,udg_ReviveY[t])
call PanCameraToForPlayer( p,udg_ReviveX[t], udg_ReviveY[t] )
call SaveInteger(udg_Hash2,GetHandleId(u),25,2)
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
set udg_PlayerLockToHero[GetConvertedPlayerId(p)]=u
if i=='Edem' then//lino
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNHeroDemonHunter.blp" )
call TriggerRegisterUnitEvent( gg_trg_AddAttack, u, EVENT_UNIT_HERO_SKILL )
call TriggerRegisterUnitEvent( gg_trg_falikuikong, u, EVENT_UNIT_SPELL_EFFECT )
else
if i=='Eevi' then//骚爷
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNEvilIllidan.blp" )
call TriggerRegisterUnitEvent( gg_trg_changelife, u, EVENT_UNIT_SPELL_EFFECT )
else
if i=='Obla' then//兽兽
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNMurgulShadowCaster.blp" )
call TriggerRegisterUnitEvent( gg_trg_StealNew, u, EVENT_UNIT_TARGET_IN_RANGE )
call TriggerRegisterUnitEvent( gg_trg_GetInvisible, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent( gg_trg_Shiye, u, EVENT_UNIT_HERO_SKILL )
set udg_shouwan = GetPlayersEnemies(GetOwningPlayer(u))
else
if i=='Osam' then//MR
call TriggerRegisterUnitEvent( gg_trg_RushA, u, EVENT_UNIT_HERO_SKILL )
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNUnbroken.blp" )
call TriggerRegisterUnitEvent( gg_trg_Invulnerable_Cut, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent( gg_trg_UseRush, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent( gg_trg_huidaoguoqu, u, EVENT_UNIT_DAMAGED )
else
if i=='Naka' then//LW
call DisplayTextToPlayer( p,0,0,"|cfffeba0eHXT，LW，小强，小胡子等英雄若购买了相位鞋，请不要在相位移动到水中后使用各自的隐身技能，否则会出现在水中无法动弹的情况。|r")
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNDranaiAkama.blp" )
call TriggerRegisterUnitEvent( gg_trg_poyinyiji, u, EVENT_UNIT_TARGET_IN_RANGE )
call TriggerRegisterUnitEvent( gg_trg_renshu, u, EVENT_UNIT_TARGET_IN_RANGE )
call TriggerRegisterUnitEvent( gg_trg_renshuup, u, EVENT_UNIT_SPELL_EFFECT )
else
if i=='Emoo' then//虎猫
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNPriestessOfTheMoon.blp" )
call TriggerRegisterUnitEvent( gg_trg_NewArrow, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent( gg_trg_Clap, u, EVENT_UNIT_SPELL_EFFECT )
call SaveInteger(udg_Hash3,GetHandleId(u),336,'ACds')
call TriggerRegisterUnitEvent( gg_trg_yuezhiyanmian, u, EVENT_UNIT_SPELL_EFFECT )
else
if i=='Ewar' then//ljz
call TriggerRegisterUnitEvent( gg_trg_LearnInvisable, u, EVENT_UNIT_HERO_SKILL )
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNSatyrTrickster.blp" )
call TriggerRegisterUnitEvent( gg_trg_yanmu, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent( gg_trg_BlinkBack, u, EVENT_UNIT_SPELL_EFFECT )
else
if i=='Ekee' then//搞死棍
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNRevenant.blp" )
call TriggerRegisterUnitEvent( gg_trg_LearnTS, u, EVENT_UNIT_HERO_SKILL )
call TriggerRegisterUnitEvent( gg_trg_ThunderStorm, u, EVENT_UNIT_SPELL_EFFECT )
else
if i=='Hpb1' then//XF
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNFrostBear.blp" )
call TriggerRegisterUnitEvent( gg_trg_LearnAddAttackSpeed, u, EVENT_UNIT_HERO_SKILL )
call SaveInteger(udg_Hash3,GetHandleId(u),336,'A0BF')
call TriggerRegisterUnitEvent( gg_trg_xionglevel, u, EVENT_UNIT_HERO_LEVEL )
else
if i=='Nbbc' then//大哥
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNChaosBlademaster.blp" )
else
if i=='Ucrl' then//小强
call DisplayTextToPlayer( p,0,0,"|cfffeba0eHXT，LW，小强，小胡子等英雄若购买了相位鞋，请不要在相位移动到水中后使用各自的隐身技能，否则会出现在水中无法动弹的情况。|r")
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNHeroCryptLord.blp" )
call SaveInteger(udg_Hash3,GetHandleId(u),336,'AUcb')
call TriggerRegisterUnitEvent( gg_trg_ManaBurn, u, EVENT_UNIT_SPELL_EFFECT )
else
if i=='Nbrn' then//小胡子
call DisplayTextToPlayer( p,0,0,"|cfffeba0eHXT，LW，小强，小胡子等英雄若购买了相位鞋，请不要在相位移动到水中后使用各自的隐身技能，否则会出现在水中无法动弹的情况。|r")
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNArcher.blp" )
call TriggerRegisterUnitEvent( gg_trg_LearnFireOn, u, EVENT_UNIT_HERO_SKILL )
call TriggerRegisterUnitEvent( gg_trg_zhuorezhijian, u, EVENT_UNIT_HERO_LEVEL )
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
function InitTrig_Buyhero2 takes nothing returns nothing
    set gg_trg_Buyhero2 = CreateTrigger(  )
    call TriggerRegisterUnitEvent( gg_trg_Buyhero2, gg_unit_nmrk_0102, EVENT_UNIT_SELL )
    call TriggerAddAction( gg_trg_Buyhero2, function Trig_Buyhero2_Actions )
endfunction
