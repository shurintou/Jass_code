
//===========================================================================
// Trigger: HonestChect
//===========================================================================
function Trig_HonestChect_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A054' 
endfunction


function returnHC takes nothing returns nothing
local timer tm=GetExpiredTimer()
local integer i=GetHandleId(tm)
local unit u=LoadUnitHandle(udg_Hash3,i,1)
local unit m=LoadUnitHandle(udg_Hash3,i,5)

call DestroyEffect(LoadEffectHandle(udg_Hash3,i,4))
if GetUnitState(u, UNIT_STATE_LIFE) > 0 then
call SetUnitX(m,GetUnitX(u))
call SetUnitY(m,GetUnitY(u))
endif
call FlushChildHashtable( udg_Hash3, i )
call PauseTimer(tm)
call DestroyTimer(tm)

set tm=null
set u=null
set m=null
endfunction


function enemyHC takes nothing returns nothing
local timer tm=GetExpiredTimer()
local integer i=GetHandleId(tm)
local unit u=LoadUnitHandle(udg_Hash3,i,1)
local unit m=LoadUnitHandle(udg_Hash3,i,2)
local real h=0
local real hmi=0
local real hma=0
local integer level=0

if UnitHasBuffBJ(m,'BUhf') then
set level=GetUnitAbilityLevel(u,'A054')
set hmi=50*level
set hma=100*level
set h=GetRandomReal(hmi,hma)
   if GetUnitAbilityLevel(u,'B03W')>0 then
   set h=hma
   endif
call UnitDamageTarget( CreateUnit(GetOwningPlayer(u),'n00T',0,0,0), m, h, true, false, ATTACK_TYPE_HERO, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
call CreateTextTagUnitBJ(I2S(R2I(h)), m, 0, 13.00, 255, 220, 0, 0 )
call SetTextTagVelocityBJ( GetLastCreatedTextTag(), 64, 90 )
call SetTextTagPermanent( GetLastCreatedTextTag(), false )
call SetTextTagLifespan( GetLastCreatedTextTag(), 2.00 )
call SetTextTagFadepoint( GetLastCreatedTextTag(), 1 )
endif

call UnitRemoveAbility(m,'BUhf')
call FlushChildHashtable( udg_Hash3, i )
call PauseTimer(tm)
call DestroyTimer(tm)


set tm=null
set m=null
set u=null
endfunction


function Trig_HonestChect_Actions takes nothing returns nothing
local timer tm=CreateTimer()
local integer i=GetHandleId(tm)
local unit m
local unit t=GetSpellTargetUnit()
local unit u=GetTriggerUnit()


if IsUnitEnemy(t, GetTriggerPlayer()) == true then
set m=CreateUnit(GetTriggerPlayer(),'n001',0,0,0)
call UnitAddAbility( m, 'Auhf' )
call IssueTargetOrderById( m, 852209, t )
call UnitApplyTimedLife( m, 'BTLF', 5.00 )
call SaveUnitHandle(udg_Hash3,i,2,t)
call SaveUnitHandle(udg_Hash3,i,1,u)
call TimerStart(tm,0.01,false,function enemyHC)
else
call SaveUnitHandle(udg_Hash3,i,5,t)
call SaveUnitHandle(udg_Hash3,i,1,u)
call SaveEffectHandle(udg_Hash3,i,4,AddSpecialEffectTarget("Abilities\\Spells\\Human\\MassTeleport\\MassTeleportTo.mdl", t, "origin"))
call TimerStart(tm,7-GetUnitAbilityLevel(u,'A054'),false,function returnHC)
endif


set tm=null
set m=null
set t=null
set u=null
endfunction

//===========================================================================
function InitTrig_HonestChect takes nothing returns nothing
    set gg_trg_HonestChect = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_HonestChect, Condition( function Trig_HonestChect_Conditions ) )
    call TriggerAddAction( gg_trg_HonestChect, function Trig_HonestChect_Actions )
endfunction
