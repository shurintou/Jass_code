
//===========================================================================
// Trigger: TimeS
//===========================================================================
function judgetodie takes nothing returns nothing
    local timer tm=GetExpiredTimer()
    local integer i=GetHandleId(tm)
    local integer n=LoadInteger(udg_hash,i,2)
    local unit u=LoadUnitHandle(udg_hash,i,1)
    local unit t=LoadUnitHandle(udg_hash,i,3)
    local real r=GetUnitState(t, UNIT_STATE_LIFE)/GetUnitState(t, UNIT_STATE_MAX_LIFE)
    
    if r>0 and n>0 then
        if r>0.50 then
            call UnitDamageTarget( u, t, 100, true, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
        elseif r>0.15 then
            call UnitDamageTarget( u, t, 300, true, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
        else
            call UnitDamageTarget( u, t, 1000, true, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
        endif
        
        call SaveInteger(udg_hash,i,2,n-1)
    else
        call DestroyEffect(LoadEffectHandle(udg_hash,i,5))
        call FlushChildHashtable( udg_hash, i )
        call DestroyTimer(tm)
    endif
    set tm=null
    set u=null
    set t=null
endfunction

function refumetime takes nothing returns nothing
    local unit t=GetEnumUnit()
    call PauseUnit( t, false )
    call UnitRemoveAbility(t,'A00P')
    call SetUnitTimeScale( t, 1.00 )
    set t=null
endfunction


function  refumeunit takes nothing returns nothing
    local timer tm=GetExpiredTimer()
    local integer i=GetHandleId(tm)
    local group g=LoadGroupHandle(udg_hash,i,2)
    call DestroyEffect(LoadEffectHandle(udg_hash,i,4))
    call ForGroup(g,function refumetime)
    call GroupClear(g)
    call DestroyGroup(g)
    call FlushChildHashtable( udg_hash, i )
    call DestroyTimer(tm)
    set tm=null
    set g=null
endfunction


function zhantingdanwei takes nothing returns boolean
    local unit t=GetFilterUnit()
    if IsUnitEnemy(t, udg_P) == true and IsUnitType(t, UNIT_TYPE_MAGIC_IMMUNE)==false and GetUnitAbilityLevel(t, 'Aloc') == 0 and GetUnitState(t, UNIT_STATE_LIFE)>0 and IsUnitPaused(t)==false and GetUnitAbilityLevel(t, 'Avul') == 0 then
        call PauseUnit( t, true )
        call UnitAddAbility(t,'A00P')
        call SetUnitTimeScale( t, 0.00 )
        call UnitDamageTarget( udg_U, t, 300+3*GetHeroInt(udg_U,true), true, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
        call DestroyEffect( AddSpecialEffectTarget("Abilities\\Spells\\Undead\\ReplenishMana\\ReplenishManaCasterOverhead.mdl", t, "chest") )
        set t=null
        return true
    endif
    set t=null
    return false
endfunction


function  timetodeleteunit takes nothing returns boolean
    local unit t=GetFilterUnit()
    if IsUnitType(t, UNIT_TYPE_STRUCTURE) == false and IsUnitType(t, UNIT_TYPE_MAGIC_IMMUNE)==false  and IsUnitEnemy(t, udg_P) == true and GetUnitAbilityLevel(t, 'Aloc') == 0 and GetUnitState(t, UNIT_STATE_LIFE)>0 then
        call UnitDamageTarget( udg_U, t, 300+10*GetHeroLevel(udg_U), true, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
        call DestroyEffect( AddSpecialEffect("war3mapImported\\TheHolyBomb.mdx", GetUnitX(t), GetUnitY(t)) )
        if  IsUnitType(t, UNIT_TYPE_HERO) == false and GetOwningPlayer(t) != Player(PLAYER_NEUTRAL_AGGRESSIVE)  then
            if GetUnitTypeId(t)!='nwwd' then
                call SetUnitExploded( t, true )
                call AddHeroXP( udg_U, GetUnitLevel(t), true )
                call UnitApplyTimedLife( t, 'BTLF', udg_Re )
            endif
        endif
        set t=null
        return true
    endif
    set t=null
    return false
endfunction


function Trig_TimeS_Conditions takes nothing returns boolean
    local timer tm
    local integer i
    local unit u=GetTriggerUnit()
    local group g
    local boolexpr b
    local integer l=GetSpellAbilityId()
    local unit t
    local real x
    local real y
    if  l == 'A04C'  then
        set tm=CreateTimer()
        set i=GetHandleId(tm)
        set g=CreateGroup()
        set udg_P=GetOwningPlayer(u)
        set udg_U=u
        set b=Condition(function  zhantingdanwei)
        set x=GetSpellTargetX()
        set y=GetSpellTargetY()
        call GroupEnumUnitsInRange(g,x,y,500,b)
        call DestroyBoolExpr(b)
        call SaveEffectHandle(udg_hash,i,4,AddSpecialEffect("war3mapImported\\TimeAura.mdx", x, y))
        call SaveGroupHandle(udg_hash,i,2,g)
        call TimerStart(tm,4,false,function refumeunit)
    elseif  l == 'A04F'  then
        set udg_P=GetOwningPlayer(u)
        set udg_U=u
        set udg_Re=4-0.1*GetHeroLevel(u)
        set b=Condition(function  timetodeleteunit)
        call GroupEnumUnitsInRange(udg_NullGroup,GetSpellTargetX(),GetSpellTargetY(),500,b)
        call DestroyBoolExpr(b)
    elseif  l == 'A04B'  then
        set t=GetSpellTargetUnit()
        if CheckLinken(t)==true then
            set tm=CreateTimer()
            set i=GetHandleId(tm)
            call SaveUnitHandle(udg_hash,i,1,u)
            call SaveUnitHandle(udg_hash,i,3,t)
            call SaveInteger(udg_hash,i,2,6)
            call SaveEffectHandle(udg_hash,i,5,AddSpecialEffectTarget("war3mapImported\\NewSoulArmor.mdx", t, "chest"))
            call TimerStart(tm,1,true,function judgetodie)
        endif
    endif
    
    set g=null
    set b=null
    set u=null
    set t=null
    set tm=null
    return false
endfunction



//===========================================================================
function InitTrig_TimeS takes nothing returns nothing
    set gg_trg_TimeS = CreateTrigger(  )
    call DisableTrigger( gg_trg_TimeS )
    call TriggerAddCondition( gg_trg_TimeS, Condition( function Trig_TimeS_Conditions ) )
endfunction
