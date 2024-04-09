
//===========================================================================
// Trigger: WLS
//===========================================================================
function checkdistancetostun takes nothing returns nothing
    local timer tm=GetExpiredTimer()
    local integer i=GetHandleId(tm)
    local unit t=LoadUnitHandle(udg_hash,i,2)
    local unit u
    local integer n=LoadInteger(udg_hash,i,5)
    local real x
    local real y
    local real dx
    local real dy
    
    call DestroyEffect(AddSpecialEffectTarget("war3mapImported\\wl2.mdx",t, "chest"))
    
    if GetUnitState(t, UNIT_STATE_LIFE)>0 and n>0 then
        set dx=GetUnitX(t)
        set dy=GetUnitY(t)
        set x=dx-LoadReal(udg_hash,i,3)
        set y=dy-LoadReal(udg_hash,i,4)
        set u=LoadUnitHandle(udg_hash,i,1)
        call SaveInteger(udg_hash,i,5,n-1)
        if x*x+y*y<80000 then
            call UnitDamageTarget( u, t, GetHeroLevel(u), true, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
        else
            call SetUnitX(udg_DeathKnight,dx)
            call SetUnitY(udg_DeathKnight,dy)
            call SetUnitAbilityLevel(udg_DeathKnight,'A007',GetUnitAbilityLevel(u,'A06K'))
            call IssueTargetOrderById( udg_DeathKnight, 852095, t)
            call UnitDamageTarget( u, t, GetHeroLevel(u)*35, true, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
            call DestroyEffect(LoadEffectHandle(udg_hash,i,10))
            call FlushChildHashtable( udg_hash,i)
            call DestroyTimer( tm )
        endif
    else
        call DestroyEffect(LoadEffectHandle(udg_hash,i,10))
        call FlushChildHashtable( udg_hash,i)
        call DestroyTimer( tm )
    endif
    set tm=null
    set t=null
    set u=null
endfunction


function taitandazhao takes nothing returns nothing
    local timer tm=GetExpiredTimer()
    local integer i=GetHandleId(tm)
    local unit t=LoadUnitHandle(udg_hash,i,1)
    local unit m=LoadUnitHandle(udg_hash,i,2)
    local integer n=LoadInteger(udg_hash,i,5)
    local real x
    local real y
    
    if n>0 then
        set x=GetUnitX(t)
        set y=GetUnitY(t)
        call SetUnitX(m,x)
        call SetUnitY(m,y)
        call IssueImmediateOrderById(m, 852127 )
        call SaveInteger(udg_hash,i,5,n-1)
        call DestroyEffect(AddSpecialEffect("war3mapImported\\wl1.mdx", x, y))
        call DestroyEffect(AddSpecialEffect("war3mapImported\\wl4.mdx", x, y))
    else
        call RemoveUnit(t)
        call RemoveUnit(m)
        call FlushChildHashtable( udg_hash,i)
        call DestroyTimer( tm )
    endif
    
    set tm=null
    set t=null
    set m=null
endfunction

function Trig_WLS_Conditions takes nothing returns boolean
    local timer tm
    local integer i
    local unit u=GetTriggerUnit()
    local integer l=GetSpellAbilityId()
    local unit t
    local unit m
    local real x
    local real y
    local real f
    local real fa
    local player p
    local integer n=GetConvertedPlayerId(GetTriggerPlayer())
    set udg_Chaoxi[n]=udg_Chaoxi[n]+6*(1+GetUnitAbilityLevel(u,'B01T'))
    if udg_Chaoxi[n]>100 then
        call UnitAddAbility(u,'A06M')
    else
        call UnitRemoveAbility(u,'A06M')
    endif
    
    if l=='A06K' then
        set t=GetSpellTargetUnit()
        if CheckLinken(t)==true then
            set tm=CreateTimer()
            set i=GetHandleId(tm)
            set x=GetUnitX(t)
            set y=GetUnitY(t)
            call SaveInteger(udg_hash,i,5,60)
            call SaveUnitHandle(udg_hash,i,2,t)
            call SaveUnitHandle(udg_hash,i,1,u)
            call SaveReal(udg_hash,i,3,x)
            call SaveReal(udg_hash,i,4,y)
            call SaveEffectHandle(udg_hash,i,10,AddSpecialEffect("war3mapImported\\wl3.mdx", x, y))
            call DestroyEffect(AddSpecialEffectTarget("war3mapImported\\wl2.mdx",t, "chest"))
            call TimerStart(tm,0.1,true,function checkdistancetostun)
            call UnitDamageTarget( u, t, (GetUnitAbilityLevel(u,'A06K')*75)+100, true, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
        endif
    elseif l=='A06L' then
        set  fa=GetUnitFacing(u)
        set  f=Deg2Rad(fa)
        set x=GetUnitX(u)
        set y=GetUnitY(u)
        set p=getcorrectplayer(u)
        set t=CreateUnit(p,'h006',x,y,0)
        set m=CreateUnit(p,'u000',x,y,0)
        call DestroyEffect(AddSpecialEffect("war3mapImported\\wl1.mdx", x, y))
        call DestroyEffect(AddSpecialEffect("war3mapImported\\wl4.mdx", x, y))
        call UnitAddAbility(m,'AOw2')
        call IssuePointOrderById( t, 851986, x+3000*Cos(f), y+3000*Sin(f) )
        call SetUnitAbilityLevel(m,'AOw2',GetUnitAbilityLevel(u,'A06L'))
        call IssueImmediateOrderById(m, 852127 )
        set tm=CreateTimer()
        set i=GetHandleId(tm)
        call SaveUnitHandle(udg_hash,i,1,t)
        call SaveUnitHandle(udg_hash,i,2,m)
        call SaveInteger(udg_hash,i,5,5+R2I(GetHeroLevel(u)/6))
        call TimerStart(tm,0.6,true,function taitandazhao)
    elseif l=='AIh1' then
        call UnitResetCooldown(u)
    endif
    
    set tm=null
    set u=null
    set p=null
    set t=null
    set m=null
    return false
endfunction


//===========================================================================
function InitTrig_WLS takes nothing returns nothing
    set gg_trg_WLS = CreateTrigger(  )
    call DisableTrigger( gg_trg_WLS )
    call TriggerAddCondition( gg_trg_WLS, Condition( function Trig_WLS_Conditions ) )
endfunction
