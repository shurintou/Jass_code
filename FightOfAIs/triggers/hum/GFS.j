
//===========================================================================
// Trigger: GFS
//===========================================================================
function  faliliushishanghai  takes nothing returns boolean
    local unit t=GetFilterUnit()
    if IsUnitType(t, UNIT_TYPE_STRUCTURE) == false and IsUnitEnemy(t, udg_P) == true and GetUnitAbilityLevel(t, 'Aloc') == 0 and GetUnitState(t, UNIT_STATE_LIFE)>0 and IsUnitType(t, UNIT_TYPE_MAGIC_IMMUNE) == false then
        call UnitDamageTarget( udg_U, t, udg_Re, true, false,  ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
        call IssueTargetOrderById( udg_DeathKnight, 852565, t )
        call DestroyEffect( AddSpecialEffectTarget("war3mapImported\\[AKE]war3AKE.com - 0643821885755039660429591.mdx", t, "origin") )
    endif
    set t=null
    return false
endfunction

function faliliushi takes nothing returns nothing
    local timer tm=GetExpiredTimer()
    local integer i=GetHandleId(tm)
    local unit t=LoadUnitHandle(udg_hash,i,2)
    local unit u
    local integer n=LoadInteger(udg_hash,i,3)
    local real r
    local real dr
    local real mr
    local boolexpr b
    if GetUnitState(t, UNIT_STATE_LIFE)>0 and n>0 then
        set u=LoadUnitHandle(udg_hash,i,1)
        set mr=GetUnitState(t, UNIT_STATE_MAX_MANA)
        set r=GetUnitState(t, UNIT_STATE_MANA)
        set dr=LoadReal(udg_hash,i,4)
        set udg_U=u
        set udg_P=GetOwningPlayer(u)
        if r>dr then
            set r=dr-0.05*mr
            call SetUnitState( t, UNIT_STATE_MANA,r)
            set udg_Re=40+((mr-r)/mr)*0.1*LoadReal(udg_hash,i,14)
        else
            call SaveReal(udg_hash,i,4,r)
            set dr=r-0.05*mr
            call SetUnitState( t, UNIT_STATE_MANA,dr)
            set udg_Re=40+((mr-dr)/mr)*0.1*LoadReal(udg_hash,i,14)
        endif
        call SetUnitAbilityLevel(udg_DeathKnight,'ANmr',R2I((GetHeroLevel(u)-6)/4))
        set b=Condition(function  faliliushishanghai)
        call GroupEnumUnitsInRange(udg_NullGroup,GetUnitX(t),GetUnitY(t),300,b)
        call DestroyBoolExpr(b)
        call SaveInteger(udg_hash,i,3,n-1)
    else
        call DestroyEffect(LoadEffectHandle(udg_hash,i,5))
        call FlushChildHashtable( udg_hash,i)
        call DestroyTimer( tm )
    endif
    set b=null
    set tm=null
    set u=null
    set t=null
endfunction

function  guangfadazhao takes nothing returns boolean
    local unit t=GetFilterUnit()
    local real r
    if IsUnitType(t, UNIT_TYPE_STRUCTURE) == false and IsUnitEnemy(t, udg_P) == true and GetUnitAbilityLevel(t, 'Aloc') == 0 and GetUnitState(t, UNIT_STATE_LIFE)>0 and IsUnitType(t, UNIT_TYPE_MAGIC_IMMUNE) == false then
        set r=GetUnitState(t, UNIT_STATE_MANA)
        if r<udg_Re then
            call IssueTargetOrderById( udg_DeathKnight, 852565, t )
            call UnitDamageTarget( udg_U, t, (udg_Re-r)*0.5, true, false,  ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
            call DestroyEffect(AddSpecialEffectTarget("war3mapImported\\FreezingRing.mdx", t, "chest"))
        endif
        call SetUnitState( t, UNIT_STATE_MANA,0.85*r)
    endif
    set t=null
    return false
endfunction

function  guangfazhendedazhao takes nothing returns boolean
    local unit t=GetFilterUnit()
    local real x
    local real y
    local real r
    
    if IsUnitType(t, UNIT_TYPE_STRUCTURE) == false and IsUnitEnemy(t, udg_P) == true and GetUnitAbilityLevel(t, 'Aloc') == 0 and GetUnitState(t, UNIT_STATE_LIFE)>0 and IsUnitType(t, UNIT_TYPE_MAGIC_IMMUNE) == false then
        set x=GetUnitX(t)
        set y=GetUnitY(t)
        set r=udg_Re-(180/3.1415926*Atan2(udg_Y-y,udg_X-x))
        if r<30 and r>-30 then
            call IssueTargetOrderById( udg_DeathKnight, 852565, t )
            call DestroyEffect(AddSpecialEffectTarget("war3mapImported\\[AKE]war3AKE.com - 5162357035146378450978088.mdx", t, "chest"))
            call UnitDamageTarget( udg_U, t, udg_n, true, false,  ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
        endif
    endif
    set t=null
    return false
endfunction

function jieshuzhuanshen takes nothing returns nothing
    local timer tm=GetExpiredTimer()
    local integer i=GetHandleId(tm)
    local unit u=LoadUnitHandle(udg_hash,i,1)
    call SetUnitTurnSpeed( u,  GetUnitDefaultTurnSpeed(u) )
    call FlushChildHashtable( udg_hash,i)
    call DestroyTimer( tm )
    set tm=null
    set u=null
endfunction


function Trig_GFS_Conditions takes nothing returns boolean
    local timer tm
    local integer i
    local unit u=GetTriggerUnit()
    local integer l=GetSpellAbilityId()
    local unit t
    local boolexpr b
    
    if  l == 'A05F'  then
        set t=GetSpellTargetUnit()
        if CheckLinken(t)==true then
            call DestroyEffect( AddSpecialEffectTarget("war3mapImported\\[AKE]war3AKE.com - 9075999708714361091634272.mdx", t, "chest") )
            set tm=CreateTimer()
            set i=GetHandleId(tm)
            call SaveUnitHandle(udg_hash,i,1,u)
            call SaveUnitHandle(udg_hash,i,2,t)
            call SaveInteger(udg_hash,i,3,8)
            call SaveReal(udg_hash,i,4,GetUnitState(t, UNIT_STATE_MANA))
            call SaveReal(udg_hash,i,14,GetUnitState(u, UNIT_STATE_MANA))
            call SaveEffectHandle(udg_hash,i,5,AddSpecialEffectTarget("war3mapImported\\FrozenArmor.MDX", t, "chest"))
            call TimerStart(tm,1,true,function faliliushi)
            call SetUnitState( u, UNIT_STATE_MANA,GetUnitState(u, UNIT_STATE_MANA)*0.85)
        endif
    elseif l=='A05G' then
        set udg_U=u
        set udg_P=GetOwningPlayer(u)
        set udg_Re=GetUnitState(u, UNIT_STATE_MANA)
        set b=Condition(function  guangfadazhao)
        call SetUnitAbilityLevel(udg_DeathKnight,'ANmr',R2I((GetHeroLevel(u)-6)/4))
        call GroupEnumUnitsInRange(udg_NullGroup,GetSpellTargetX(),GetSpellTargetY(),300+50*GetUnitAbilityLevel(u,'A05G'),b)
        call DestroyBoolExpr(b)
        call SetUnitState( u, UNIT_STATE_MANA,udg_Re*0.85)
    elseif l=='A05H' then
        set tm=CreateTimer()
        set udg_U=u
        call SaveUnitHandle(udg_hash,GetHandleId(tm),1,u)
        set udg_P=GetOwningPlayer(u)
        set udg_X=GetUnitX(u)
        set udg_Y=GetUnitY(u)
        call SetUnitTurnSpeed( u, 0.00 )
        call TimerStart(tm,1.2,false,function jieshuzhuanshen)
        if GetUnitAbilityLevel(u,'B01T')>0 then
            set udg_n=R2I(GetUnitState(u, UNIT_STATE_MAX_MANA)*0.75)
        else
            set udg_n=R2I(GetUnitState(u, UNIT_STATE_MAX_MANA)*0.5)
        endif
        set udg_Re=180/3.1415926*Atan2(udg_Y-GetSpellTargetY(),udg_X-GetSpellTargetX())
        set b=Condition(function  guangfazhendedazhao)
        call SetUnitAbilityLevel(udg_DeathKnight,'ANmr',R2I((GetHeroLevel(u)-6)/4))
        call GroupEnumUnitsInRange(udg_NullGroup,udg_X,udg_Y,2000,b)
        call DestroyBoolExpr(b)
        call SetUnitState( u, UNIT_STATE_MANA,GetUnitState(u, UNIT_STATE_MANA)*0.5)
    elseif l=='AIh1' then
        call UnitResetCooldown(u)
    endif
    set b=null
    set tm=null
    set t=null
    set u=null
    return false
endfunction



//===========================================================================
function InitTrig_GFS takes nothing returns nothing
    set gg_trg_GFS = CreateTrigger(  )
    call DisableTrigger( gg_trg_GFS )
    call TriggerAddCondition( gg_trg_GFS, Condition( function Trig_GFS_Conditions ) )
endfunction
