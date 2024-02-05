
//===========================================================================
// Trigger: AMS
//===========================================================================
function xuemoda takes nothing returns nothing
    local timer tm=GetExpiredTimer()
    local integer i=GetHandleId(tm)
    local unit t=LoadUnitHandle(udg_hash,i,2)
    local unit u=LoadUnitHandle(udg_hash,i,1)
    local real r=GetUnitState(t, UNIT_STATE_LIFE)
    local integer n
    local real x
    local real y
    local real dx
    local real dy
    local real h
    if r>0 then
        set n=LoadInteger(udg_hash,i,5)
        if n>0 then
            set x=GetUnitX(t)
            set y=GetUnitY(t)
            set dx=LoadReal(udg_hash,i,8)-x
            set dy=LoadReal(udg_hash,i,9)-y
            call SaveReal(udg_hash,i,8,x)
            call SaveReal(udg_hash,i,9,y)
            set h=SquareRoot(dx*dx+dy*dy)
            if h>1000 then
                set h=1000
            else
                if h<100 then
                    set h=100
                endif
            endif
            call UnitDamageTarget( u, t, h*LoadReal(udg_hash,i,4), true, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
            call SaveInteger(udg_hash,i,5,n-1)
            if  GetUnitAbilityLevel(t,'B01I')>0 then
            else
                call UnitAddAbility(t,'A049')
                call UnitRemoveAbility(t,'A049')
            endif
        else
            call DestroyEffect(LoadEffectHandle(udg_hash,i,3))
            call FlushChildHashtable( udg_hash,i)
            call DestroyTimer( tm )
        endif
    else
        call DestroyEffect( AddSpecialEffectTarget("Abilities\\Spells\\Human\\Heal\\HealTarget.mdl", u, "chest") )
        call SetUnitState( u, UNIT_STATE_LIFE,GetUnitState(u, UNIT_STATE_LIFE)+GetUnitState(t, UNIT_STATE_MAX_LIFE))
        call DestroyEffect(LoadEffectHandle(udg_hash,i,3))
        call FlushChildHashtable( udg_hash,i)
        call DestroyTimer( tm )
    endif
    set tm=null
    set u=null
    set t=null
endfunction

function zuzhou takes nothing returns nothing
    local timer tm=GetExpiredTimer()
    local integer i=GetHandleId(tm)
    local unit t=LoadUnitHandle(udg_hash,i,2)
    local real r=GetUnitState(t, UNIT_STATE_LIFE)
    local integer n=LoadInteger(udg_hash,i,5)
    local real h
    local texttag a
    local real l
    if r>0 and n>0 then
        set h=LoadReal(udg_hash,i,4)
        if r>h then
            call SetUnitState( t, UNIT_STATE_LIFE,h)
            set l=100*LoadReal(udg_hash,i,6)
            call UnitDamageTarget( LoadUnitHandle(udg_hash,i,1), t, l, true, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
        else
            call SaveReal(udg_hash,i,4,r)
            set l=(h-r)*LoadReal(udg_hash,i,6)
            call UnitDamageTarget( LoadUnitHandle(udg_hash,i,1), t, l, true, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
        endif
        if IsUnitVisible(t, Player(0))==true then
            set a=CreateTextTag()
            call SetTextTagText(a, I2S(R2I(l)), 0.023)
            call SetTextTagPosUnit(a,t,0)
            call SetTextTagColor(a,138,43,226,255)
            call SetTextTagVelocity( a, 0.00, 0.04 )
            call SetTextTagFadepoint( a, 0.50 )
            call SetTextTagLifespan(a, 1 )
            call SetTextTagPermanent( a, false )
        endif
        if  GetUnitAbilityLevel(t,'B01I')>0 then
        else
            call UnitAddAbility(t,'A049')
            call UnitRemoveAbility(t,'A049')
        endif
        call SaveInteger(udg_hash,i,5,n-1)
    else
        call DestroyEffect(LoadEffectHandle(udg_hash,i,3))
        call FlushChildHashtable( udg_hash,i)
        call DestroyTimer( tm )
    endif
    set tm=null
    set t=null
    set a=null
endfunction

function bozang takes nothing returns nothing
    local timer tm=GetExpiredTimer()
    local integer i=GetHandleId(tm)
    local unit t=LoadUnitHandle(udg_hash,i,2)
    local real r=GetUnitState(t, UNIT_STATE_LIFE)
    local integer n=LoadInteger(udg_hash,i,4)
    local real h
    if r>0 and n>0 then
        set h=LoadReal(udg_hash,i,1)
        if r>h then
            call SaveReal(udg_hash,i,1,r)
        else
            call SetUnitState( t, UNIT_STATE_LIFE,h)
        endif
        call SaveInteger(udg_hash,i,4,n-1)
    else
        call DestroyEffect(LoadEffectHandle(udg_hash,i,3))
        call FlushChildHashtable( udg_hash,i)
        call DestroyTimer( tm )
    endif
    set tm=null
    set t=null
endfunction



function bianzhi takes nothing returns nothing
    local timer tm=GetExpiredTimer()
    local integer i=GetHandleId(tm)
    local integer y=LoadInteger(udg_hash,i,4)
    local unit t=LoadUnitHandle(udg_hash,i,2)
    if y>0 then
        call SetUnitAbilityLevel(t,'A038',GetUnitAbilityLevel(t,'A038')+1)
        call SaveInteger(udg_hash,i,4,y-1)
    else
        call SetPlayerAbilityAvailable( LoadPlayerHandle(udg_hash,i,9), 'A04T', true )
        call RemoveUnit(t)
        call FlushChildHashtable( udg_hash,i)
        call DestroyTimer( tm )
    endif
    set t=null
    set tm=null
endfunction

function Trig_AMS_Conditions takes nothing returns boolean
    local timer tm
    local integer i
    local unit u=GetTriggerUnit()
    local integer l=GetSpellAbilityId()
    local unit t
    local player p=GetTriggerPlayer()
    if l=='A039' then
        set t=GetSpellTargetUnit()
        if CheckLinken(t)==true then
            set tm=CreateTimer()
            set i=GetHandleId(tm)
            call UnitAddAbility(t,'A049')
            call UnitRemoveAbility(t,'A049')
            call SaveUnitHandle(udg_hash,i,1,u)
            call SaveUnitHandle(udg_hash,i,2,t)
            call SaveEffectHandle(udg_hash,i,3, AddSpecialEffectTarget("war3mapImported\\Shadow_Strikes_State_Hand.mdx", t, "chest"))
            call SaveReal(udg_hash,i,4,0.4+GetHeroLevel(u)/60)
            call SaveInteger(udg_hash,i,5,20)
            call SaveReal(udg_hash,i,8,GetUnitX(t))
            call SaveReal(udg_hash,i,9,GetUnitY(t))
            call TimerStart(tm,0.5,true,function xuemoda)
        endif
    elseif l=='A04R' then
        set t=GetSpellTargetUnit()
        if CheckLinken(t)==true then
            set l=GetHeroLevel(u)
            set tm=CreateTimer()
            set i=GetHandleId(tm)
            call UnitDamageTarget(u, t,150+(10*l) , true, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
            call UnitAddAbility(t,'A049')
            call UnitRemoveAbility(t,'A049')
            call SaveUnitHandle(udg_hash,i,1,u)
            call SaveUnitHandle(udg_hash,i,2,t)
            call SaveEffectHandle(udg_hash,i,3,AddSpecialEffectTarget("war3mapImported\\SoulShield.MDX", t, "chest"))
            call SaveReal(udg_hash,i,4,GetUnitState(t, UNIT_STATE_LIFE))
            call SaveInteger(udg_hash,i,5,10)
            call SaveReal(udg_hash,i,6,0.2+(l/100))
            call TimerStart(tm,1,true,function zuzhou)
        endif
    elseif l=='A04U' then
        set tm=CreateTimer()
        set i=GetHandleId(tm)
        set t=GetSpellTargetUnit()
        call SaveUnitHandle(udg_hash,i,2,t)
        call SaveEffectHandle(udg_hash,i,3,AddSpecialEffectTarget("war3mapImported\\DarkVoid.mdx", t, "chest"))
        call SaveInteger(udg_hash,i,4,8+R2I(GetHeroLevel(u)/5))
        call SaveReal(udg_hash,i,1,GetUnitState(t, UNIT_STATE_LIFE))
        call TimerStart(tm,0.5,true,function bozang)
    elseif l=='A04T' then
        set tm=CreateTimer()
        set i=GetHandleId(tm)
        call SaveInteger(udg_hash,i,4,1+R2I(GetHeroLevel(u)/10)+(2*GetUnitAbilityLevel(u,'B01T')))
        call SavePlayerHandle(udg_hash,i,9,p)
        call TimerStart(tm,6,true,function bianzhi)
        call SetPlayerAbilityAvailable( p, 'A04T', false )
        set t=CreateUnit(p,'u00C',0,0,0)
        call UnitAddAbility(t,'A038')
        call SaveUnitHandle(udg_hash,i,2,t)
    elseif l=='AIh1' then
        call UnitResetCooldown(u)
    endif
    set p=null
    set tm=null
    set u=null
    set t=null
    return false
endfunction


//===========================================================================
function InitTrig_AMS takes nothing returns nothing
    set gg_trg_AMS = CreateTrigger(  )
    call DisableTrigger( gg_trg_AMS )
    call TriggerAddCondition( gg_trg_AMS, Condition( function Trig_AMS_Conditions ) )
endfunction
