
//===========================================================================
// Trigger: MengmaS
//===========================================================================
function nuoshouq takes nothing returns boolean
    local unit t=GetFilterUnit()
    if IsUnitType(t, UNIT_TYPE_STRUCTURE) == false and IsUnitType(t, UNIT_TYPE_MAGIC_IMMUNE) == false and IsUnitEnemy(t, udg_P) == true and GetUnitAbilityLevel(t, 'Aloc') == 0 and GetUnitState(t, UNIT_STATE_LIFE)>0 then
        if  IsUnitType(t, UNIT_TYPE_HERO) == true  then
            set udg_i=udg_i+50
        else
            set udg_i=udg_i+1
        endif
        call UnitDamageTarget( udg_U, t, 100+udg_n, true, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
        call DestroyEffect( AddSpecialEffectTarget("Objects\\Spawnmodels\\Human\\HumanBlood\\BloodElfSpellThiefBlood.mdl", t, "chest") )
    endif
    set t=null
    return false
endfunction

function liangjifanzhuan takes nothing returns boolean
    local unit t=GetFilterUnit()
    if IsUnitType(t, UNIT_TYPE_STRUCTURE) == false and IsUnitEnemy(t, udg_P) == true and GetUnitAbilityLevel(t, 'Aloc') == 0 and GetUnitState(t, UNIT_STATE_LIFE)>0 then
        call UnitDamageTarget( udg_U, t, udg_Re, true, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
        call SetUnitX(t,udg_X+GetRandomReal(-50,50))
        call SetUnitY(t,udg_Y+GetRandomReal(-50,50))
    endif
    set t=null
    return false
endfunction

function  deletefenliea takes nothing returns nothing
    local timer tm=GetExpiredTimer()
    local integer i=GetHandleId(tm)
    call UnitRemoveAbility(LoadUnitHandle(udg_hash,i,1),'A07V')
    call FlushChildHashtable( udg_hash, i )
    call DestroyTimer(tm)
    set tm=null
endfunction

function shuanrenjian takes nothing returns boolean
    local unit t=GetFilterUnit()
    if IsUnitType(t, UNIT_TYPE_STRUCTURE) == false and IsUnitEnemy(t, udg_P) == true and GetUnitAbilityLevel(t, 'Aloc') == 0 and GetUnitState(t, UNIT_STATE_LIFE)>0 then
        call UnitDamageTarget( udg_U, t, udg_Re, true, false, ATTACK_TYPE_CHAOS, DAMAGE_TYPE_UNIVERSAL, WEAPON_TYPE_WHOKNOWS )
        call DestroyEffect( AddSpecialEffectTarget("Objects\\Spawnmodels\\Human\\HumanBlood\\HumanBloodKnight.mdl", t, "chest") )
    endif
    set t=null
    return false
endfunction

function Trig_MengmaS_Conditions takes nothing returns boolean
    local unit u=GetTriggerUnit()
    local boolexpr b
    local integer i=GetSpellAbilityId()
    local real r
    local unit m
    local timer tm
    
    if i=='A02R' then
        call SetUnitAnimationByIndex( u, 13 )
        set udg_U=u
        set b=Condition(function nuoshouq)
        set udg_P=GetTriggerPlayer()
        set udg_i=0
        set udg_n=GetHeroStr(u, true)*2
        call GroupEnumUnitsInRange(udg_NullGroup,GetUnitX(u),GetUnitY(u),600,b)
        set r=GetUnitState(u, UNIT_STATE_LIFE)
        call SetUnitState( u, UNIT_STATE_LIFE,r+(0.002+GetHeroLevel(u)/10000)*udg_i*(GetUnitState(u, UNIT_STATE_MAX_LIFE)-r) )
        call DestroyBoolExpr(b)
    elseif i=='A045' then
        set m=GetSpellTargetUnit()
        if CheckLinken(m)==true then
            call SetUnitAnimationByIndex( u, 6 )
            set udg_U=u
            set b=Condition(function shuanrenjian)
            set udg_P=GetTriggerPlayer()
            set udg_Re=(0.07+GetHeroLevel(u)/1000)*GetUnitState(u, UNIT_STATE_LIFE)
            call DestroyEffect( AddSpecialEffect("Abilities\\Spells\\Orc\\WarStomp\\WarStompCaster.mdl", GetUnitX(u),GetUnitY(u)))
            call DestroyEffect( AddSpecialEffect("Abilities\\Spells\\Orc\\WarStomp\\WarStompCaster.mdl", GetUnitX(m),GetUnitY(m)))
            call UnitDamageTarget( u, u, udg_Re, true, false, ATTACK_TYPE_CHAOS, DAMAGE_TYPE_UNIVERSAL, WEAPON_TYPE_WHOKNOWS )
            call UnitDamageTarget( u, m, udg_Re, true, false, ATTACK_TYPE_CHAOS, DAMAGE_TYPE_UNIVERSAL, WEAPON_TYPE_WHOKNOWS )
            call GroupEnumUnitsInRange(udg_NullGroup,GetUnitX(m),GetUnitY(m),225,b)
            call DestroyBoolExpr(b)
        endif
    elseif i=='A04I' then
        call SetUnitAnimationByIndex( u, 6 )
        set i=GetHeroLevel(u)
        set b=Condition(function liangjifanzhuan)
        set udg_U=u
        set udg_P=GetTriggerPlayer()
        set udg_X=GetUnitX(u)
        set udg_Y=GetUnitY(u)
        if GetUnitAbilityLevel(u,'B01T')>0 then
            set udg_Re=600+(25*i)
        else
            set udg_Re=400+(15*i)
        endif
        set m=CreateUnit(getcorrectplayer(u),'u000',udg_X,udg_Y,0)
        call UnitAddAbility(m,'A04K')
        call UnitApplyTimedLife( m, 'BTLF', 1.00 )
        call IssueImmediateOrderById( m, 852127 )
        call GroupEnumUnitsInRange(udg_NullGroup,udg_X,udg_Y,600,b)
        call DestroyBoolExpr(b)
        set tm=CreateTimer()
        call UnitAddAbility(u,'A07V')
        call SetUnitAbilityLevel(u,'A04L',i/10)
        call SaveUnitHandle(udg_hash,GetHandleId(tm),1,u)
        call TimerStart(tm,5,false,function  deletefenliea)
    elseif i=='AIh1' then
        call UnitResetCooldown(u)
    endif
    
    set u=null
    set b=null
    set tm=null
    set m=null
    return false
endfunction


//===========================================================================
function InitTrig_MengmaS takes nothing returns nothing
    set gg_trg_MengmaS = CreateTrigger(  )
    call DisableTrigger( gg_trg_MengmaS )
    call TriggerAddCondition( gg_trg_MengmaS, Condition( function Trig_MengmaS_Conditions ) )
endfunction
