
//===========================================================================
// Trigger: Buyhero9
//===========================================================================
function movefengxing takes nothing returns nothing
local unit u=LoadUnitHandle(udg_Hash1,GetHandleId(gg_trg_qianglijianyu),1)
if udg_WeatherN==3 then
call UnitAddAbility(u,'A0C3')
else
call UnitRemoveAbility(u,'A0C3')
call UnitRemoveAbility(u,'B03Y')
endif
set u=null
endfunction


function Trig_Buyhero9_Actions takes nothing returns nothing
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

if i=='Uear' then//40龙
call SaveUnitHandle(udg_Hash1,GetHandleId(gg_trg_Zhuanyishanghai),1,u)
call SaveGroupHandle(udg_Hash1,GetHandleId(gg_trg_Zhuanyishanghai),4,CreateGroup())
call TriggerRegisterUnitEvent( gg_trg_Zhuanyishanghai, u, EVENT_UNIT_DAMAGED )
call TriggerRegisterPlayerUnitEventSimple( gg_trg_jiagongsiling, p, EVENT_PLAYER_UNIT_SUMMON )
call TriggerRegisterPlayerUnitEventSimple( gg_trg_Deadzhaohuan, p, EVENT_PLAYER_UNIT_DEATH )
call TriggerRegisterUnitEvent( gg_trg_learnsiling, u, EVENT_UNIT_HERO_SKILL )
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNSpiritWyvern.blp" )
else
if i=='H00A' then//风行
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNSylvanusWindrunner.blp" )
call SaveUnitHandle(udg_Hash1,GetHandleId(gg_trg_qianglijianyu),1,u)
call TimerStart(CreateTimer(),1,true,function movefengxing)
call TriggerRegisterUnitEvent( gg_trg_shufuzhijian, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent( gg_trg_zhunbeiqiangli, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent( gg_trg_qianglijianyu, u, EVENT_UNIT_SPELL_FINISH )
else
if i=='O009' then//虾
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNLobstrokkBlue.blp" )
call TriggerRegisterUnitEvent( gg_trg_jueduifangyu, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent( gg_trg_zhunbeihuichun, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent( gg_trg_huichun, u, EVENT_UNIT_SPELL_FINISH )
else
if i=='U007' then//毁灭者
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNDestroyer.blp" )
call TriggerRegisterUnitEvent( gg_trg_chaofuhe, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent( gg_trg_zengjiamofazuidazhi, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent( gg_trg_mieshi, u, EVENT_UNIT_SPELL_EFFECT )
else
if i=='H00C' then//死歌
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNAcolyte.blp" )
call TriggerRegisterUnitEvent( gg_trg_songge, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent( gg_trg_zange, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent( gg_trg_xisheng, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent( gg_trg_sigedead, u, EVENT_UNIT_DEATH )
call TriggerRegisterUnitEvent( gg_trg_shoushanghaijianshao, u, EVENT_UNIT_DAMAGED  )
else
if i=='H00B' then//冰龙
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

call unaviliable(i)
call SaveInteger(udg_Hash2,GetHandleId(u),8529,3)//1为力量2为敏捷3为智力
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
function InitTrig_Buyhero9 takes nothing returns nothing
    set gg_trg_Buyhero9 = CreateTrigger(  )
    call TriggerRegisterUnitEvent( gg_trg_Buyhero9, gg_unit_nshp_0112, EVENT_UNIT_SELL )
    call TriggerAddAction( gg_trg_Buyhero9, function Trig_Buyhero9_Actions )
endfunction
