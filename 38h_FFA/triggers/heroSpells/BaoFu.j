
//===========================================================================
// Trigger: BaoFu
//
// udg_Hash1,GetHandleId(gg_trg_BaoFu),1//存在触发中  and GetUnitState(t, UNIT_STATE_LIFE)>0//死了也要榨
//===========================================================================
function Trig_BaoFu_Conditions takes nothing returns boolean
local integer i
local integer n
local unit u=GetTriggerUnit()
local integer level=GetUnitAbilityLevel(u,'A0BO')
    if  GetSpellAbilityId() == 'A0BO' then
    set n=GetPlayerState(GetTriggerPlayer(), PLAYER_STATE_RESOURCE_GOLD)
    set i=n-40*level
       if i>0 then
       call SetPlayerState(GetTriggerPlayer(),PLAYER_STATE_RESOURCE_GOLD,i)
       set u=null
       return true
       else 
       call UnitRemoveAbility( u, 'A0BO' )
       call UnitAddAbility( u, 'A0BO' )
       call SetUnitAbilityLevel( u, 'A0BO',level)
       call bugouqianbaocuo(u)
       set u=null
       return false
       endif
    endif
set u=null
return false
endfunction


function baofuact takes nothing returns nothing
local timer tm=GetExpiredTimer()
local integer i=GetHandleId(tm)
local unit t=LoadUnitHandle(udg_Hash1,i,1)
local player p
local player tp
local unit u
local integer n=LoadInteger(udg_Hash1,i,2)
local integer level
local integer ml
local integer pl
local integer dm
local integer hm

if n>0 then
set u=LoadUnitHandle(udg_Hash1,GetHandleId(gg_trg_BaoFu),1)
set level=GetUnitAbilityLevel(u,'A0BO')
set tp=GetOwningPlayer(t)
set p=GetOwningPlayer(u)
set ml=GetPlayerState(tp, PLAYER_STATE_RESOURCE_GOLD)
set pl=GetPlayerState( p, PLAYER_STATE_RESOURCE_GOLD)
set hm=20*level
set dm=ml-hm
call SaveInteger(udg_Hash1,i,2,n-1)
    if dm>0 then
    call SetPlayerState(tp,PLAYER_STATE_RESOURCE_GOLD,dm)
    call SetPlayerState( p,PLAYER_STATE_RESOURCE_GOLD,pl+hm)
    call UnitDamageTarget( u, t, hm, true, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
    call CreateTextTagUnitBJ("-"+I2S(hm), t, 0, 11.00, 255, 220, 0, 0 )
    call SetTextTagVelocityBJ( GetLastCreatedTextTag(), 64, 90 )
    call SetTextTagPermanent( GetLastCreatedTextTag(), false )
    call SetTextTagLifespan( GetLastCreatedTextTag(), 3.00 )
    call SetTextTagFadepoint( GetLastCreatedTextTag(), 2.60 )
    else
    call SetPlayerState( p,PLAYER_STATE_RESOURCE_GOLD,pl+ml)
    call UnitDamageTarget( u, t, hm*1.5, true, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
    call SetPlayerState(tp,PLAYER_STATE_RESOURCE_GOLD,0)
    call CreateTextTagUnitBJ("-"+I2S(ml), t, 0, 11.00, 255, 220, 0, 0 )
    call SetTextTagVelocityBJ( GetLastCreatedTextTag(), 64, 90 )
    call SetTextTagPermanent( GetLastCreatedTextTag(), false )
    call SetTextTagLifespan( GetLastCreatedTextTag(), 3.00 )
    call SetTextTagFadepoint( GetLastCreatedTextTag(), 2.60 )
    endif
call DestroyEffect( AddSpecialEffectTarget("Abilities\\Spells\\Other\\Transmute\\PileofGold.mdl", t, "origin") )
else
call FlushChildHashtable( udg_Hash1, i )
call PauseTimer(tm)
call DestroyTimer(tm)
endif


set tm=null
set u=null
set t=null
set p=null
set tp=null
endfunction



function Trig_BaoFu_Actions takes nothing returns nothing
local timer tm=CreateTimer()
local unit u=GetTriggerUnit()
local unit t=GetSpellTargetUnit()
local integer i=GetHandleId(tm)
local integer n=1
local integer ri
local integer bi=0
call SaveUnitHandle(udg_Hash1,i,1,t)

loop
exitwhen bi==1
set ri=GetRandomInt(1,100)
if ri>40 then
set n=n+1
else
set bi=1
endif
endloop

if n>1 then
call CreateTextTagUnitBJ("X"+I2S(n), u, 0, 22.00, 255, 220, 0, 0 )
call SetTextTagVelocityBJ( GetLastCreatedTextTag(), 64, 90 )
call SetTextTagPermanent( GetLastCreatedTextTag(), false )
call SetTextTagLifespan( GetLastCreatedTextTag(), 3.00 )
call SetTextTagFadepoint( GetLastCreatedTextTag(), 2.60 )
endif

call SaveInteger(udg_Hash1,i,2,n)
call TimerStart(tm,0.4,true,function baofuact)

set tm=null
set u=null
set t=null
endfunction

//===========================================================================
function InitTrig_BaoFu takes nothing returns nothing
    set gg_trg_BaoFu = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_BaoFu, Condition( function Trig_BaoFu_Conditions ) )
    call TriggerAddAction( gg_trg_BaoFu, function Trig_BaoFu_Actions )
endfunction
