
//===========================================================================
// Trigger: DZS
//===========================================================================
function  shieldzhadanbaozha takes nothing returns boolean
    local unit t=GetFilterUnit()
    if IsUnitType(t, UNIT_TYPE_STRUCTURE) == false and IsUnitEnemy(t, udg_P) == true and GetUnitAbilityLevel(t, 'Aloc') == 0 and GetUnitState(t, UNIT_STATE_LIFE)>0 and IsUnitType(t, UNIT_TYPE_MAGIC_IMMUNE)==false and GetUnitAbilityLevel(t, 'Avul') == 0 and IsUnitType(t, UNIT_TYPE_MECHANICAL) == false then
        call UnitDamageTarget( udg_U, t, udg_Re, true, false,  ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
        if GetUnitFlyHeight(t) >= 10 then
            call DestroyEffect( AddSpecialEffectTarget("war3mapImported\\Holy Light Void.mdx", t, "chest") )
        else
            call DestroyEffect( AddSpecialEffect("war3mapImported\\Holy Light Void.mdx", GetUnitX(t), GetUnitY(t)) )
        endif
    endif
    set t=null
    return false
endfunction

function shieldbaozha  takes nothing returns nothing
    local timer tm=GetExpiredTimer()
    local integer m=GetHandleId(tm)
    local unit u=LoadUnitHandle(udg_hash, m, 1)
    local real r=LoadReal(udg_hash, m, 2)
    local boolexpr b
    local player p=GetOwningPlayer(u)
    local integer i=GetConvertedPlayerId(p)
    
    if udg_UGharm[i]>0 and GetUnitState(u, UNIT_STATE_LIFE)>0 then
        set udg_P=p
        set udg_U=u
        set udg_Re=150+0.15*GetUnitState(u, UNIT_STATE_MAX_LIFE)+r
        call DestroyEffect( AddSpecialEffectTarget("war3mapImported\\HellFire2.mdx", u, "origin") )
        set b=Condition(function shieldzhadanbaozha)
        call GroupEnumUnitsInRange(udg_NullGroup,GetUnitX(u),GetUnitY(u),600,b)
        call DestroyBoolExpr(b)
    endif
    set udg_UGharm[i]=0
    call UnitRemoveAbility(u,'A065')
    call FlushChildHashtable( udg_hash, m )
    call DestroyTimer(tm)
    set u=null
    set b=null
    set tm=null
    set p=null
endfunction

function taotaizhiren takes nothing returns boolean
    local unit t=GetFilterUnit()
    local real r=GetUnitState(t, UNIT_STATE_LIFE)
    if IsUnitType(t, UNIT_TYPE_STRUCTURE) == false and IsUnitEnemy(t, udg_P) == true and GetUnitAbilityLevel(t, 'Aloc') == 0 and r>0 and GetUnitAbilityLevel(t, 'Avul') == 0 and IsUnitType(t, UNIT_TYPE_MECHANICAL) == false then
        if r< udg_Re then
            call KillUnit(t)
            if  IsUnitType(t, UNIT_TYPE_HERO) == true then
                call AddHeroXP( udg_U, 4*GetHeroLevel(t), true )
                call SetUnitState( udg_U, UNIT_STATE_LIFE,GetUnitState(udg_U, UNIT_STATE_LIFE)+(r))
            else
                call SetUnitState( udg_U, UNIT_STATE_LIFE,GetUnitState(udg_U, UNIT_STATE_LIFE)+(r*0.5))
                call AddHeroXP( udg_U, GetUnitLevel(t), true )
            endif
            call DestroyEffect( AddSpecialEffectTarget("Abilities\\Spells\\Undead\\AnimateDead\\AnimateDeadTarget.mdl", udg_U, "origin") )
        else
            call UnitDamageTarget( udg_U, t, udg_Re, true, false,  ATTACK_TYPE_HERO, DAMAGE_TYPE_UNIVERSAL, WEAPON_TYPE_WHOKNOWS )
        endif
    endif
    set t=null
    return false
endfunction

function deletadzeffect takes nothing returns nothing
    local timer tm=GetExpiredTimer()
    local integer i=GetHandleId(tm)
    local integer n=LoadInteger(udg_hash, i, 0)
    local unit t=LoadUnitHandle(udg_hash, i, 3)
    local unit u=LoadUnitHandle(udg_hash, i, 2)
    local real r=LoadReal(udg_hash, i, 4)
    if n>0 and GetUnitState(t, UNIT_STATE_LIFE)>0  then
        call SaveInteger(udg_hash,i,0,n-1)
        call SetUnitState( u, UNIT_STATE_LIFE,GetUnitState(u, UNIT_STATE_LIFE)+r)
        call UnitDamageTarget( u, t, r, true, false,  ATTACK_TYPE_HERO, DAMAGE_TYPE_UNIVERSAL, WEAPON_TYPE_WHOKNOWS )
    else
        call DestroyEffect(LoadEffectHandle(udg_hash, i, 1))
        call FlushChildHashtable( udg_hash, i )
        call DestroyTimer(tm)
    endif
    set t=null
    set u=null
    set tm=null
endfunction

function Trig_DZS_Conditions takes nothing returns boolean
    local timer tm
    local integer i
    local unit u=GetTriggerUnit()
    local integer l=GetSpellAbilityId()
    local boolexpr b
    local unit t
    local real r
    if l == 'A01N'  then
        set tm=CreateTimer()
        set i=GetHandleId(tm)
        set r=GetUnitState(u, UNIT_STATE_LIFE)
        call UnitAddAbility(u,'A065')
        call SetUnitState( u, UNIT_STATE_LIFE,0.7*r )
        set udg_UGharm[GetConvertedPlayerId(GetTriggerPlayer())]=300+0.2*GetUnitState(u, UNIT_STATE_MAX_LIFE)
        call SaveUnitHandle(udg_hash,i,1,u)
        call SaveReal(udg_hash,i,2,0.05*r)
        call TimerStart(tm,5,false,function shieldbaozha)
    elseif l=='A03G' then
        set t=GetSpellTargetUnit()
        if CheckLinken(t)==true then
            set tm=CreateTimer()
            set udg_P=GetTriggerPlayer()
            set udg_U=u
            set i=GetHandleId(tm)
            set udg_Re=100+((0.05*(3+GetUnitAbilityLevel(u,'B01T')))*GetUnitState(u, UNIT_STATE_MAX_LIFE))
            set b=Condition(function taotaizhiren)
            call GroupEnumUnitsInRange(udg_NullGroup,GetUnitX(t),GetUnitY(t),100+(10*GetHeroLevel(u)),b)
            call DestroyBoolExpr(b)
            call SaveUnitHandle(udg_hash,i,2,u)
            call SaveUnitHandle(udg_hash,i,3,t)
            call SaveReal(udg_hash,i,4,udg_Re/10)
            call SaveInteger(udg_hash,i,0,10)
            call SaveEffectHandle(udg_hash,i,1,AddSpecialEffectTarget("war3mapImported\\HellFire3.mdx", t, "chest") )
            call TimerStart(tm,1,true,function deletadzeffect)
        endif
    endif
    set b=null
    set tm=null
    set u=null
    set t=null
    return false
endfunction



//===========================================================================
function InitTrig_DZS takes nothing returns nothing
    set gg_trg_DZS = CreateTrigger(  )
    call DisableTrigger( gg_trg_DZS )
    call TriggerAddCondition( gg_trg_DZS, Condition( function Trig_DZS_Conditions ) )
endfunction
