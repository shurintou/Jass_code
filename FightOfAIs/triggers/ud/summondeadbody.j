
//===========================================================================
// Trigger: summondeadbody
//===========================================================================
function xuanshiti takes nothing returns boolean
    local unit t=GetFilterUnit()
    
    if IsUnitType(t, UNIT_TYPE_STRUCTURE) == false and  IsUnitEnemy(t, udg_P) == true and GetUnitAbilityLevel(t, 'Aloc') == 0 and GetUnitState(t, UNIT_STATE_LIFE)>0 then
        call UnitDamageTarget( udg_U, t, udg_Re, true, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
        call DestroyEffect( AddSpecialEffectTarget("Objects\\Spawnmodels\\NightElf\\EntBirthTarget\\EntBirthTarget.mdl", t, "origin") )
        call IssueTargetOrderById( udg_DeathKnight, 852189, t )
    endif
    
    set t=null
    return false
endfunction

function xishoushiti takes nothing returns boolean
    local unit t=GetFilterUnit()
    
    if GetUnitState(t, UNIT_STATE_LIFE)<=0 and GetUnitAbilityLevel(t, 'Aloc') == 0 and IsUnitType(t, UNIT_TYPE_HERO)==false then
        call RemoveUnit(t)
        set udg_n=udg_n+1
        call DestroyEffect( AddSpecialEffect("Abilities\\Spells\\Undead\\AnimateDead\\AnimateDeadTarget.mdl", GetUnitX(t), GetUnitY(t)) )
        set t=null
        return false
    endif
    
    
    set t=null
    return false
endfunction


function shiwangzhouweixixueshaghai takes nothing returns boolean
    local unit t=GetFilterUnit()
    local real r
    
    if IsUnitType(t, UNIT_TYPE_STRUCTURE) == false and IsUnitType(t, UNIT_TYPE_MECHANICAL)==false and  IsUnitEnemy(t, udg_P) == true and GetUnitAbilityLevel(t, 'Aloc') == 0 and GetUnitState(t, UNIT_STATE_LIFE)>0 then
        set r=GetUnitState(t, UNIT_STATE_MAX_LIFE)*udg_Re
        call UnitDamageTarget( udg_U, t, r , true, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
        call SetUnitState( udg_U, UNIT_STATE_LIFE, GetUnitState(udg_U, UNIT_STATE_LIFE)+r*(0.17+udg_Re))
    endif
    
    set t=null
    return false
endfunction

function shiwanghuixue takes nothing returns nothing
    local timer tm=GetExpiredTimer()
    local integer i=GetHandleId(tm)
    local unit u=LoadUnitHandle(udg_hash,i,1)
    local boolexpr b
    local integer n=LoadInteger(udg_hash,i,2)
    if  n>0 and GetUnitState(u, UNIT_STATE_LIFE)>0 and GetUnitAbilityLevel( u, 'A00T')>0 then
        set b=Condition(function shiwangzhouweixixueshaghai)
        set udg_P=GetOwningPlayer(u)
        set udg_U=u
        set udg_Re=0.08+(0.02*GetUnitAbilityLevel(u,'B01T'))
        call GroupEnumUnitsInRange(udg_NullGroup,GetUnitX(u),GetUnitY(u),200+300*GetUnitAbilityLevel( u, 'A02L'),b)
        call DestroyBoolExpr(b)
        call SaveInteger(udg_hash,i,2,n-1)
    else
        call DestroyEffect( LoadEffectHandle(udg_hash,i,3))
        call FlushChildHashtable( udg_hash,i)
        call DestroyTimer( tm )
    endif
    
    set tm=null
    set u=null
    set b=null
endfunction

function Trig_summondeadbody_Conditions takes nothing returns boolean
    local unit u=GetTriggerUnit()
    local boolexpr b
    local integer h
    local integer i
    local timer tm
    local integer l=GetSpellAbilityId()
    local integer g
    
    
    if  l == 'A02Q' then
        set udg_U=u
        set h=GetUnitAbilityLevel( u, 'A02L')
        set b=Condition(function xuanshiti)
        set udg_P=GetOwningPlayer(u)
        set udg_Re=GetHeroStr(u, true)*(1.5+h)
        call GroupEnumUnitsInRange(udg_NullGroup,GetSpellTargetX(),GetSpellTargetY(),200+300*h,b)
        call DestroyBoolExpr(b)
    elseif  l == 'A02S' then
        set b=Condition(function xishoushiti)
        set udg_n=1
        set udg_P=GetOwningPlayer(u)
        call GroupEnumUnitsInRange(udg_NullGroup,GetUnitX(u),GetUnitY(u),200+300*GetUnitAbilityLevel( u, 'A02L'),b)
        call DestroyBoolExpr(b)
        set g=GetConvertedPlayerId(GetTriggerPlayer())
        set udg_Chaoxi[g]=udg_Chaoxi[g]+udg_n
        call SetUnitState( u, UNIT_STATE_LIFE, GetUnitState(u, UNIT_STATE_LIFE)+(GetHeroLevel(u)*udg_n)+(0.15*GetUnitState(u, UNIT_STATE_MAX_LIFE)))
        loop
            exitwhen udg_Chaoxi[g]<20
            set udg_Chaoxi[g]=udg_Chaoxi[g]-20
            call SetHeroStr( u, GetHeroStr(u, false)+1, true )
            call DestroyEffect( AddSpecialEffectTarget("Abilities\\Spells\\Items\\AIsm\\AIsmTarget.mdl", u, "origin") )
        endloop
        if GetHeroStr(u, false)>125 then
            call SetUnitAbilityLevel( u, 'A02L', 2 )
        endif
        
    elseif  l == 'A02L' then
        set tm=CreateTimer()
        set i=GetHandleId(tm)
        set h=GetUnitAbilityLevel( u, 'A02L')
        call SaveUnitHandle(udg_hash,i,1,u)
        call SaveInteger(udg_hash,i,2,25)
        call SaveEffectHandle(udg_hash,i,3,AddSpecialEffectTarget("Abilities\\Spells\\Undead\\PlagueCloud\\PlagueCloudCaster.mdl", u, "origin"))
        call TimerStart(tm,1,true,function shiwanghuixue)
    endif
    
    set tm=null
    set u=null
    set b=null
    return false
endfunction



//===========================================================================
function InitTrig_summondeadbody takes nothing returns nothing
    set gg_trg_summondeadbody = CreateTrigger(  )
    call DisableTrigger( gg_trg_summondeadbody )
    call TriggerAddCondition( gg_trg_summondeadbody, Condition( function Trig_summondeadbody_Conditions ) )
endfunction
