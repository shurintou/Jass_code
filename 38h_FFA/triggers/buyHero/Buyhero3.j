
//===========================================================================
// Trigger: Buyhero3
//
// 
// call SaveInteger(udg_Hash3,GetHandleId(u),334,'AOfs')
//===========================================================================
function Trig_Buyhero3_Actions takes nothing returns nothing
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
call SaveInteger(udg_Hash2,GetHandleId(u),25,3)
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
if i=='Hvwd' then//马蹄糕
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNHarpyQueen.blp" )
call TriggerRegisterUnitEvent( gg_trg_phonix, u, EVENT_UNIT_HERO_SKILL )
call TriggerRegisterUnitEvent( gg_trg_UseBurnOil, u, EVENT_UNIT_SPELL_EFFECT )
else
if i=='Nrob' then//CJX
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNROBOGOBLIN.blp" )
call TriggerRegisterUnitEvent( gg_trg_refreshtank, u, EVENT_UNIT_SPELL_FINISH )
call SaveInteger(udg_Hash3,GetHandleId(u),336,'ANsy')
else
if i=='Ntin' then//WWZ
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNDwarfCar.blp" )
call TriggerRegisterUnitEvent( gg_trg_waterhole, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent( gg_trg_rushwater, u, EVENT_UNIT_SPELL_EFFECT )
else
if i=='Hblm' then//MYD
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNBlueDemoness.blp" )
call TriggerRegisterUnitEvent( gg_trg_blink, u, EVENT_UNIT_HERO_LEVEL )
call SaveInteger(udg_Hash3,GetHandleId(u),336,'A08H')
else
if i=='Ulic' then//Lion
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNChaosWarlockGreen.blp" )
call TriggerRegisterUnitEvent( gg_trg_DeathFinger, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent( gg_trg_Yaoshu, u, EVENT_UNIT_SPELL_EFFECT )
call SaveInteger(udg_Hash3,GetHandleId(u),336,'AChw')
else
if i=='Ofar' then//土豆
call TriggerRegisterUnitEvent( gg_trg_LearnTudou, u, EVENT_UNIT_HERO_SKILL )
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNInfernal.blp" )
else
if i=='Orkn' then//小Y
call TriggerRegisterUnitEvent( gg_trg_magicleash, u, EVENT_UNIT_SPELL_EFFECT )
call SaveInteger(udg_Hash3,GetHandleId(u),336,'AOhx')
call TriggerRegisterUnitEvent(gg_trg_yaoshuup, u, EVENT_UNIT_HERO_LEVEL )
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNShadowHunter.blp" )
else
if i=='Othr' then//蝙蝠
call TriggerRegisterUnitEvent( gg_trg_LearnLiquidBurn, u, EVENT_UNIT_HERO_SKILL )
call TriggerRegisterUnitEvent( gg_trg_LiquidBurn, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent( gg_trg_LieYanFengBao, u, EVENT_UNIT_SPELL_EFFECT )
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNTrollBatRider.blp" )
else
if i=='Hamg' then//刘弟
call SaveInteger(udg_Hash3,GetHandleId(u),336,'AOfs')
call TriggerRegisterUnitEvent(gg_trg_ZhouYu, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent(gg_trg_zengwu, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent( gg_trg_jieshuzhouyu, u, EVENT_UNIT_SPELL_ENDCAST )
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNOrcWarlockRed.blp" )
else
if i=='Hmkg' then//球魁
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNEarthBrewmaster.blp" )
call TriggerRegisterUnitEvent( gg_trg_leitingyiji, u, EVENT_UNIT_SPELL_EFFECT )
else
if i=='Hkal' then//kimi
call SaveInteger(udg_Hash3,GetHandleId(u),336,'A098')
call TriggerRegisterUnitEvent( gg_trg_XURUO, u, EVENT_UNIT_HERO_LEVEL )
call TriggerRegisterUnitEvent( gg_trg_EatBrain, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent( gg_trg_stopwerqew, u, EVENT_UNIT_SPELL_ENDCAST )
call TriggerRegisterUnitEvent( gg_trg_asdqweqwe, u, EVENT_UNIT_SPELL_EFFECT )
call MultiboardSetItemIcon( udg_lsmb, "ReplaceableTextures\\CommandButtons\\BTNHeroBloodElfPrince.blp" )
else
if i=='Emns' then//V姐
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
function InitTrig_Buyhero3 takes nothing returns nothing
    set gg_trg_Buyhero3 = CreateTrigger(  )
    call TriggerRegisterUnitEvent( gg_trg_Buyhero3, gg_unit_nmrc_0104, EVENT_UNIT_SELL )
    call TriggerAddAction( gg_trg_Buyhero3, function Trig_Buyhero3_Actions )
endfunction
