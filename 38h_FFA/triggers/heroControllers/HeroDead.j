
//===========================================================================
// Trigger: HeroDead
//
// (udg_Hash2,GetHandleId(u),10 )   单位连续杀人的计时器
// (udg_Hash2,GetHandleId(u),11 )   连续杀人数
// (udg_Hash2,GetHandleId(u),15 )   um指令的计时器
// (udg_Hash2,GetHandleId(u),20 )   英雄复活的计时器
// (udg_Hash2,GetHandleId(u),25 )   1，2，3：力量，敏捷，智力
// udg_Hash2,194,586,55  First Blood
//===========================================================================

function revivehero takes nothing returns nothing
local timer tm=GetExpiredTimer()
local integer i=GetHandleId(tm)
local unit u=LoadUnitHandle(udg_Hash2,i,1)
local integer n=GetRandomInt(1,8)

call ReviveHero( u, udg_ReviveX[n], udg_ReviveY[n], true )
//call SetUnitState( u, UNIT_STATE_MANA, GetUnitState(u, UNIT_STATE_MAX_MANA) )
//call PanCameraToForPlayer( GetOwningPlayer(u),udg_ReviveX[n], udg_ReviveY[n] )
//call DisplayTimedTextToForce( udg_OnlinePlayer, 30, udg_YANSE[GetConvertedPlayerId(GetOwningPlayer(u))]+GetUnitName(u)+"|r复活了！")
//call FlushChildHashtable( udg_Hash2, i )
//call PauseTimer(tm)
//call DestroyTimer(tm)

set tm=null
set u=null
endfunction


function ContinueKill takes nothing returns nothing
local timer tm=GetExpiredTimer()
local integer i=GetHandleId(tm)
local integer n=LoadInteger(udg_Hash2,i,2)
local unit u=LoadUnitHandle(udg_Hash2,i,1)

if n>0 then
call SaveInteger(udg_Hash2,i,2,n-1)
else
call SaveInteger(udg_Hash2,GetHandleId(u),11,0)
call FlushChildHashtable( udg_Hash2, i )
call PauseTimer(tm)
call DestroyTimer(tm)
endif

set tm=null
set u=null
endfunction



function CheckContinue takes nothing returns nothing
local timer tm=GetExpiredTimer()
local integer i=GetHandleId(tm)
local integer n=LoadInteger(udg_Hash2,i,2)
local unit u=LoadUnitHandle(udg_Hash2,i,1)
local integer m=GetConvertedPlayerId(GetOwningPlayer(u))
   
if n==2 then
call DisplayTimedTextToForce( udg_OnlinePlayer, 30,udg_YANSE[m]+GetUnitName(u)+"|r刚刚完成了一次|cff0042ff双杀！|r")
call PlaySoundBJ( gg_snd_double_kill )
else
if n==3 then
call PlaySoundBJ( gg_snd_triple_kill )
call DisplayTimedTextToForce( udg_OnlinePlayer, 30,udg_YANSE[m]+GetUnitName(u)+"|r刚刚完成了一次|cff1ce6b9三杀！|r")
else
if n==4 then
call PlaySoundBJ( gg_snd_ultrakill )
call DisplayTimedTextToForce( udg_OnlinePlayer, 30,udg_YANSE[m]+GetUnitName(u)+"|r正在|cff106246疯狂杀戮！|r")
else
if n>=5 then
call PlaySoundBJ( gg_snd_rampage )
call DisplayTimedTextToForce( udg_OnlinePlayer, 30,udg_YANSE[m]+GetUnitName(u)+"|r正在|cff20c000暴走！|r")
endif
endif
endif
endif
call FlushChildHashtable( udg_Hash2, i )
call PauseTimer(tm)
call DestroyTimer(tm)


set tm=null
set u=null
endfunction


function UnitIsNotBX takes nothing returns boolean
return IsUnitEnemy(GetFilterUnit(), GetOwningPlayer(udg_lsu)) == true and ciwh(GetFilterUnit(),'ram2')>=1
endfunction

function AddBX takes nothing returns nothing
local unit u=GetEnumUnit()
local item t
local integer i=0

loop
exitwhen i>5
set t=UnitItemInSlot(u, i)
if GetItemTypeId(t)=='ram2' then
set i=6
endif
set i=i+1
endloop
///if GetItemCharges(t)>=5 then
///call SetItemCharges( t, 5 )
///else
call SetItemCharges( t, GetItemCharges(t)+1 )
///endif
call DestroyEffect( AddSpecialEffectTarget("Abilities\\Spells\\Human\\Resurrect\\ResurrectTarget.mdl", u, "origin") )

set u=null
set t=null
endfunction



function minusplayerscore takes player p,integer n returns nothing//减分
local integer i=0
loop
exitwhen i>11
if IsPlayerEnemy(p, Player(i))==false then
set udg_PlayerScore[i+1]=udg_PlayerScore[i+1]-n 
endif
set i=i+1
endloop
endfunction 

function addplayerscore takes player p,integer n returns nothing//加分
local integer i=0
loop
exitwhen i>11
if IsPlayerEnemy(p, Player(i))==false then
set udg_PlayerScore[i+1]=udg_PlayerScore[i+1]+n
endif
set i=i+1
endloop
endfunction 

function diuqibaoshi takes unit u returns nothing//丢弃宝石
local integer i=0
local item e
loop
exitwhen i>=6 
set e=UnitItemInSlot(u, i)
if GetItemTypeId(e)=='gemt' then
call UnitRemoveItem( u, e )
endif
set i=i+1
endloop
call ShowUnit( u, false )
set e=null
endfunction

function ShuaXinChongNeng takes unit u returns nothing//刷新球充能
local integer i=0
local integer n=0
local item t
loop
exitwhen i>5 or n==1
set t=UnitItemInSlot(u, i)
if GetItemTypeId(t) == 'ram4' then
call SetItemCharges( t, 1 )
set n=1
endif
set i=i+1
endloop

set t=null
endfunction


function ZiYuanChongNeng takes unit u returns nothing//紫怨充能
local integer i=0
local integer n=0
local item t
loop
exitwhen i>5 or n==1
set t=UnitItemInSlot(u, i)
if GetItemTypeId(t) == 'sor9' then
call SetItemCharges( t, GetItemCharges(t)+2 )
set n=1
endif
set i=i+1
endloop

set t=null
endfunction


function ShaRenShuChongNeng takes unit u,unit du returns nothing//杀人书充能
local integer i=0
local integer n=0
local item t
loop
exitwhen i>5 or n==1
set t=UnitItemInSlot(u, i)
if GetItemTypeId(t) == 'dtsb' then
call SetItemCharges( t, GetItemCharges(t)+2 )
call SetUnitState( u, UNIT_STATE_MANA, GetUnitState(u, UNIT_STATE_MANA)+ GetUnitState(du, UNIT_STATE_MANA) )
set n=1
endif
set i=i+1
endloop

set t=null
endfunction

function ShaRenJian takes unit u,unit du returns nothing//杀人剑
local integer i=0
local integer n=0
local item t
loop
exitwhen i>5 or n==1
set t=UnitItemInSlot(u, i)
if GetItemTypeId(t) == 'ssil' then
if GetItemCharges(t)>=20 then
call SetItemCharges( t, 20 )
else
call SetItemCharges( t, GetItemCharges(t)+1 )
endif
call SetUnitAbilityLevel( u, 'A0DJ', GetItemCharges(t)+1 )
call DestroyEffect( AddSpecialEffectTarget("Objects\\Spawnmodels\\Human\\HumanBlood\\HeroBloodElfBlood.mdl", u, "origin") )
call SetUnitState( u, UNIT_STATE_LIFE, GetUnitState(u, UNIT_STATE_LIFE)+ 0.5*GetUnitState(du, UNIT_STATE_MAX_LIFE) )
set n=1
endif
set i=i+1
endloop
set i=0
set n=0
loop
exitwhen i>5 or n==1
set t=UnitItemInSlot(du, i)
if GetItemTypeId(t) == 'ssil' then
  if GetItemCharges(t)<=2 then
  call SetItemCharges( t, 0 )
  else
  call SetItemCharges( t, GetItemCharges(t)-2 )
  endif
call SetUnitAbilityLevel( du, 'A0DJ', GetItemCharges(t)+1 )
set n=1
endif
set i=i+1
endloop
set t=null
endfunction


function Trig_HeroDead_Actions takes nothing returns nothing
    local unit um=GetKillingUnit()//凶手单位
    local unit du=GetDyingUnit()
    local timer tm=CreateTimer()
    local integer i=0
    local integer level=GetUnitLevel(du)
    local integer n=1
    local player p=GetOwningPlayer(um)//凶手玩家
    local unit u=udg_PlayerLockToHero[GetConvertedPlayerId(p)]//将玩家绑定到单位
    local player dp=GetOwningPlayer(du)//被杀玩家
    local integer m=0//凶手玩家索引
    local integer g=GetConvertedPlayerId(dp)//被杀玩家索引
    local integer mo=0
    local timer tt
    local integer ui=0
    local integer ci=0
    local timer tg
    local group gr=CreateGroup()
    local boolexpr br=Condition(function UnitIsNotBX)
    
    
    
    if IsUnitAlly(um, dp) == true and p!= dp then
    call DisplayTimedTextToForce( udg_OnlinePlayer, 30,udg_YANSE[g]+GetUnitName(du)+"|r被队友杀死了!")
    call minusplayerscore(dp,1)
    else
    if p==dp then
    call DisplayTimedTextToForce( udg_OnlinePlayer, 30,udg_YANSE[g]+GetUnitName(du)+"|r刚刚自杀了!")
    call minusplayerscore(dp,1)
    endif
    endif
    if p == Player(PLAYER_NEUTRAL_AGGRESSIVE) then
    call minusplayerscore(dp,2)
    call DisplayTimedTextToForce( udg_OnlinePlayer, 30,"|cff959697"+GetUnitName(du)+"被中立单位杀死了，难道他想不开吗？|r")
    /////////////////以上为中立凶手部分///////////////
    endif
    if IsUnitEnemy(um, dp) == true and p != Player(PLAYER_NEUTRAL_AGGRESSIVE) then
    set m=GetConvertedPlayerId(p)
    call addplayerscore(p,5)
    call minusplayerscore(dp,3)
    set udg_LianXuKill[m]=udg_LianXuKill[m]+1
    set mo=udg_LianXuKill[g]*50
    call ShuaXinChongNeng(u)//刷新
    call ZiYuanChongNeng(u)//紫怨
    call ShaRenShuChongNeng(u,du)//杀人书
    call ShaRenJian(u,du)//杀人剑
    if LoadInteger(udg_Hash2,194,586)!=55 then//一血
    call addplayerscore(p,2)
    call DisplayTimedTextToForce( udg_OnlinePlayer, 30, udg_YANSE[m]+GetPlayerName(p)+"|r刚刚拿下了|cffff0303第一滴血|r")
    call SetPlayerState( p, PLAYER_STATE_RESOURCE_GOLD, ( GetPlayerState(p, PLAYER_STATE_RESOURCE_GOLD) + 200 ) )
    call PlaySoundBJ( gg_snd_firstblood )
    call SaveInteger(udg_Hash2,194,586,55)
    endif
    call DisplayTimedTextToForce( udg_OnlinePlayer, 30,udg_YANSE[m]+GetUnitName(u)+"|r刚刚杀死了"+udg_YANSE[g]+GetUnitName(du)+"|r，获得了|c00fffc01"+I2S(250+mo)+"|r点金钱。")
    if udg_LianXuKill[m]>10 then
    call PlaySoundBJ( udg_KillSounds[8] )
    call addplayerscore(p,2)
    call DisplayTimedTextToForce( udg_OnlinePlayer, 30, udg_YANSE[m]+GetPlayerName(p)+"|r已经"+udg_KillWords[8] )
    else
    loop 
    exitwhen n>8
    if udg_LianXuKill[m]==n+2 then
    call DisplayTimedTextToForce( udg_OnlinePlayer, 30, udg_YANSE[m]+GetPlayerName(p)+"|r已经"+udg_KillWords[n] )
    call PlaySoundBJ( udg_KillSounds[n] )
    set n=10
    else
    set n=n+1
    endif
    endloop
    endif
    call SetPlayerState( p, PLAYER_STATE_RESOURCE_GOLD, ( GetPlayerState(p, PLAYER_STATE_RESOURCE_GOLD) + mo ) )
    /////////////////以上为玩家凶手部分/////////////////
    set n=1
    if udg_LianXuKill[g]>10 then
    call minusplayerscore(dp,2)
    call addplayerscore(p,2)
    call DisplayTimedTextToForce( udg_OnlinePlayer, 30, udg_YANSE[g]+GetPlayerName(dp)+"|r的"+udg_KillWords[8]+"被终结了" )
    else 
    loop
    exitwhen n>8
    if udg_LianXuKill[g]==n+2 then
    call DisplayTimedTextToForce( udg_OnlinePlayer, 30, udg_YANSE[g]+GetPlayerName(dp)+"|r的"+udg_KillWords[n]+"被终结了" )
    set n=10
    else
    set n=n+1 
    endif  
    endloop
    endif
    set udg_LianXuKill[g]=0
    call SetPlayerState( dp, PLAYER_STATE_RESOURCE_GOLD, ( GetPlayerState(dp, PLAYER_STATE_RESOURCE_GOLD) - mo  ) )
    
    
    
    //////////////以上为死亡玩家部分，下面为短时间杀多人音效/////////////////
    set ui=GetHandleId(u)
    set tt=LoadTimerHandle(udg_Hash2,ui,10)
    if tt !=null then
    else 
    set tt=CreateTimer()
    call SaveTimerHandle(udg_Hash2,ui,10,tt)
    call TimerStart(tt,1,true,function ContinueKill)
    endif
    call SaveInteger(udg_Hash2,GetHandleId(tt),2,10)
    call SaveUnitHandle(udg_Hash2,GetHandleId(tt),1,u) 
    set ci=LoadInteger(udg_Hash2,ui,11)+1 
    call SaveInteger(udg_Hash2,ui,11,ci)
    if ci>1 then
    set tg=CreateTimer()
    call SaveInteger(udg_Hash2,GetHandleId(tg),2,ci)
    call SaveUnitHandle(udg_Hash2,GetHandleId(tg),1,u)
    call TimerStart(tg,1.1,false,function CheckContinue)
    endif
    endif
    ////////////////////以下为死亡玩家部分///////////////////////////////
    
    call SetPlayerState( dp, PLAYER_STATE_RESOURCE_GOLD, ( GetPlayerState(dp, PLAYER_STATE_RESOURCE_GOLD) - 200  ) )
    call DisplayTextToPlayer( dp, 0, 0,"你的英雄将在|cffff0303"+I2S(level*3)+"|r秒之后复活。")
    call SaveUnitHandle(udg_Hash2,GetHandleId(tm),1,du)
    call SaveTimerHandle(udg_Hash2,GetHandleId(du),20,tm)
    set udg_KilledTimes[g]=udg_KilledTimes[g]+1
    if ciwh(du,'I01D') >=1 then  
    //call SaveInteger(udg_Hash2,GetHandleId(tm),5,1)
    call PauseTimer(LoadTimerHandle(udg_Hash3,GetHandleId(du),6))
    endif
    if udg_Test==true then
    call TimerStart(tm,1,false,function revivehero)
    else
    call TimerStart(tm,level*3,false,function revivehero)
    endif
    call diuqibaoshi(udg_Bag[g])//死亡英雄从背包丢弃宝石
    ///////////////以上为死亡玩家部分///////////////////
    set udg_lsu=du
    call GroupEnumUnitsInRange(gr,GetUnitX(du),GetUnitY(du),1000,br)
    call ForGroup(gr,function AddBX)
    call GroupClear(gr)
    call DestroyGroup(gr)
    call DestroyBoolExpr(br)
    set ui=GetHandleId(du)
    call SaveInteger(udg_Hash4,ui,333,0)
    call SaveInteger(udg_Hash4,ui,444,0)
   
    set gr=null
    set br=null
    set um=null
    set tg=null
    set tt=null
    set tm=null
    set u=null
    set du=null
    set p=null
    set dp=null
endfunction

//===========================================================================
function InitTrig_HeroDead takes nothing returns nothing
    set gg_trg_HeroDead = CreateTrigger(  )
    call TriggerAddAction( gg_trg_HeroDead, function Trig_HeroDead_Actions )
endfunction
