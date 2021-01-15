
//===========================================================================
// Trigger: EveryUnitDead
//===========================================================================
function addbossmoney takes nothing returns nothing
local player p=LoadPlayerHandle(udg_Hash1,GetHandleId(gg_trg_EveryUnitDead),10)
local player f=GetEnumPlayer()
if IsPlayerAlly(f, p) == true then
call SetPlayerState( f, PLAYER_STATE_RESOURCE_GOLD, GetPlayerState(f, PLAYER_STATE_RESOURCE_GOLD)+500 )
endif
set p=null
set f=null
endfunction

function reviveboss takes nothing returns nothing
call SetUnitPathing( CreateUnit( Player(PLAYER_NEUTRAL_AGGRESSIVE), 'n00R', 6720, 4660, 270), false )
call DestroyTimer(GetExpiredTimer())
endfunction

function killboss takes unit boss,unit u returns nothing
local player p=GetOwningPlayer(u)//凶手玩家
local integer m=GetConvertedPlayerId(p)
if udg_Test==true then
call TimerStart(CreateTimer(),30,false,function reviveboss)
else
call TimerStart(CreateTimer(),300,false,function reviveboss)
endif
call DisplayTimedTextToForce( udg_OnlinePlayer, 30,udg_YANSE[m]+GetUnitName(u)+"|r刚刚杀死了团灭大魔王，他的团队将获得奖励。")
call SavePlayerHandle(udg_Hash1,GetHandleId(gg_trg_EveryUnitDead),10,p)
call ForForce( udg_OnlinePlayer,function addbossmoney)
set p=null
endfunction



function Trig_EveryUnitDead_Actions takes nothing returns nothing
local unit u=GetTriggerUnit()
local player p=GetOwningPlayer(GetKillingUnit())
local unit m=udg_PlayerLockToHero[GetConvertedPlayerId(p)]
local integer level=GetUnitAbilityLevel(m, 'A041' )
local integer i=GetUnitAbilityLevel(m, 'A076' )
local integer n=GetUnitAbilityLevel(m, 'A077' )
local integer g=GetUnitTypeId(u)
local integer w=GetUnitTypeId(m)


if  g== 'n00D' or g=='owyv' then
call RemoveUnit(u)
set u=null
return
endif

if  GetUnitAbilityLevel(u, 'Aloc' )==0 then

  if IsUnitType(u, UNIT_TYPE_HERO)==false then//不是英雄
  call FlushChildHashtable( udg_Hash1, GetHandleId(u) )
     if g=='osw1' or g=='osw2' or g=='osw3' then//死灵书单位
     call DestroyEffect( AddSpecialEffect("war3mapImported\\A-Bomb.mdx", GetUnitX(u), GetUnitY(u)) )
     call HarmGroup(u,300,200*GetUnitAbilityLevel(u,'Afbk'))
     endif
  else//是英雄
     if w=='Ogrh' then//屠夫加力量
     call SetHeroStr( m, GetHeroStr(m, false)+2, true )
     else
     if w=='Hant' then//沉默加智力
     call SetHeroInt( m, GetHeroInt(m, false)+2, true )
     else
     if w=='Nbbc' then//大哥加敏捷
     call SetHeroAgi( m, GetHeroAgi(m, false)+2, true )
     else
     if GetUnitAbilityLevel(m, 'A0D5' )>0 then
     call UnitRemoveAbility( m, 'A0D5' )
     call UnitAddAbility( m, 'A0D5' )
     else
     endif
     endif
     endif
     endif
  endif
  
  if IsUnitHidden(u) and GetUnitTypeId(m)=='Hpb2' then
     call SetPlayerState( p, PLAYER_STATE_RESOURCE_GOLD, GetPlayerState(p,PLAYER_STATE_RESOURCE_GOLD)+10*GetUnitAbilityLevel(m,'Adev') )
     call CreateTextTagUnitBJ("+"+I2S(10*GetUnitAbilityLevel(m,'Adev')), m, 0, 11.00, 255, 220, 0, 0 )
     call SetTextTagVelocityBJ( GetLastCreatedTextTag(), 64, 90 )
     call SetTextTagPermanent( GetLastCreatedTextTag(), false )
     call SetTextTagLifespan( GetLastCreatedTextTag(), 2.00 )
     call SetTextTagFadepoint( GetLastCreatedTextTag(), 1 )
     endif

  if level>0 then//是不是英雄都可以加钱
  call SetPlayerState(p,PLAYER_STATE_RESOURCE_GOLD, GetPlayerState(p, PLAYER_STATE_RESOURCE_GOLD)+2*level)
  call DestroyEffect( AddSpecialEffectTarget("UI\\Feedback\\GoldCredit\\GoldCredit.mdl", m, "overhead") )
  endif

  if i>0 then//屠戮
     if IsUnitType(u, UNIT_TYPE_HERO) == true then
     call SetUnitState( m, UNIT_STATE_LIFE, GetUnitState(m, UNIT_STATE_LIFE)+(i*0.1*GetUnitState(u, UNIT_STATE_MAX_LIFE) ))
     else
     call SetUnitState( m, UNIT_STATE_LIFE, GetUnitState(m, UNIT_STATE_LIFE)+(i*0.05*GetUnitState(u, UNIT_STATE_MAX_LIFE) ))
     endif
  call DestroyEffect( AddSpecialEffectTarget("Objects\\Spawnmodels\\Human\\HumanBlood\\HumanBloodPeasant.mdl", m, "chest") )
  endif

  if n>0 then//施虐之心
  call SetUnitState( m, UNIT_STATE_MANA, GetUnitState(m, UNIT_STATE_MANA)+(15*n) )
  call DestroyEffect( AddSpecialEffectTarget("Abilities\\Spells\\Items\\AIma\\AImaTarget.mdl", m, "chest") )
  endif

  

  if IsUnitHidden(u) and GetUnitTypeId(m)=='Nsjs'  then
  call SetUnitAnimation( m, "puke" )
  call QueueUnitAnimation( m, "stand" )
  endif


endif

if g=='n00R' then
call killboss(u,m)
call SetPlayerTechResearchedSwap( 'Rucr',1+GetPlayerTechCountSimple('Rucr', Player(PLAYER_NEUTRAL_AGGRESSIVE)), Player(PLAYER_NEUTRAL_AGGRESSIVE) )
call CreateItem('ankh',GetUnitX(u),GetUnitY(u))
endif



set u=null
set m=null
set p=null
endfunction

//===========================================================================
function InitTrig_EveryUnitDead takes nothing returns nothing
    set gg_trg_EveryUnitDead = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_EveryUnitDead, EVENT_PLAYER_UNIT_DEATH )
    call TriggerAddAction( gg_trg_EveryUnitDead, function Trig_EveryUnitDead_Actions )
endfunction
