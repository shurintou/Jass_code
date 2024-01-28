
//===========================================================================
// Trigger: SQS
//===========================================================================
function shanchuwudi takes nothing returns nothing
    local timer tm=GetExpiredTimer()
    local integer i=GetHandleId(tm)
    local unit t=LoadUnitHandle(udg_hash,i,3)
    local unit u=LoadUnitHandle(udg_hash,i,1)
    
    if t!=null then
        call SetUnitInvulnerable( t, false)
        call DestroyEffect(LoadEffectHandle(udg_hash,i,4))
    endif
    call SetUnitInvulnerable( u, false)
    call DestroyEffect(LoadEffectHandle(udg_hash,i,2))
    call FlushChildHashtable( udg_hash,i)
    call DestroyTimer( tm )
    
    set tm=null
    set u=null
    set t=null
endfunction

function  shengqishanghai takes nothing returns boolean
    local unit t=GetFilterUnit()
    
    if IsUnitType(t, UNIT_TYPE_STRUCTURE) == false and IsUnitEnemy(t, udg_P) == true and GetUnitAbilityLevel(t, 'Aloc') == 0 and GetUnitState(t, UNIT_STATE_LIFE)>0 then
        call UnitDamageTarget( udg_U, t, udg_Re, true, false,  ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
        call DestroyEffect( AddSpecialEffectTarget("war3mapImported\\HolyNova.mdx", t, "origin") )
    endif
    set t=null
    
    return false
endfunction

function shengqida takes nothing returns nothing
    local unit t=GetEnumUnit()
    call UnitDamageTarget( udg_U, t, udg_n+udg_Re*GetUnitState(t, UNIT_STATE_MAX_LIFE), true, false,  ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
    call PlaySoundBJ( gg_snd_PandarenUltimate )
    set t=null
endfunction

function shengqidajieshu takes nothing returns nothing
    local timer tm=GetExpiredTimer()
    local integer i=GetHandleId(tm)
    set udg_U=LoadUnitHandle(udg_hash,i,0)
    if GetUnitAbilityLevel(udg_U,'B01T')>0 then
        set udg_n=GetHeroLevel(udg_U)*20
        set udg_Re=0.3
    else
        set udg_n=GetHeroLevel(udg_U)*15
        set udg_Re=0.2
    endif
    if LoadInteger(udg_hash,i,1)==0 then
        call ForGroup(udg_RedTeamHero,function shengqida)
    else
        call ForGroup(udg_BlueTeamHero,function shengqida)
    endif
    call FlushChildHashtable( udg_hash,i)
    call DestroyTimer( tm )
    set tm=null
endfunction

function shengqidabegin takes nothing returns nothing
    call UnitAddAbility(GetEnumUnit(),'A033')
endfunction

function shanchubufffqhenqwe takes nothing returns nothing
    call UnitRemoveAbility(GetEnumUnit(),'A033')
endfunction

function shanchushengqibuff takes nothing returns nothing
    local timer tm=GetExpiredTimer()
    local integer i=GetHandleId(tm)
    call SetPlayerAbilityAvailable( LoadPlayerHandle(udg_hash,i,0), 'A00V', true )
    if LoadInteger(udg_hash,i,1)==0 then
        call ForGroup(udg_RedTeamHero,function shanchubufffqhenqwe)
    else
        call ForGroup(udg_BlueTeamHero,function shanchubufffqhenqwe)
    endif
    call FlushChildHashtable( udg_hash,i)
    call DestroyTimer( tm )
    set tm=null
endfunction

function Trig_SQS_Conditions takes nothing returns boolean
    local timer tm
    local integer i
    local unit u=GetTriggerUnit()
    local player p=GetTriggerPlayer()
    local integer n=GetConvertedPlayerId(p)
    local integer l=GetSpellAbilityId()
    local unit t
    local boolexpr b
    local timer tt
    
    if  l == 'A011'  then
        set t=GetSpellTargetUnit()
        if t!=u then
            call UnitRemoveAbility(udg_SpellTarget[n],'A02Y')
            call UnitRemoveAbility(udg_SpellTarget[n],'B01E')
            set udg_SpellTarget[n]=t
            call UnitAddAbility(t,'A02Y')
        endif
        call SetUnitState( t, UNIT_STATE_LIFE,GetUnitState(t, UNIT_STATE_LIFE)+0.35*GetUnitState(u, UNIT_STATE_MAX_LIFE) )
    elseif  l=='A01G' then
        set tm=CreateTimer()
        set i=GetHandleId(tm)
        call SaveUnitHandle(udg_hash,i,1,u)
        call SetUnitInvulnerable( u, true )
        call SaveEffectHandle(udg_hash,i,2,AddSpecialEffectTarget("war3mapImported\\RuneAura.mdx", u, "origin"))
        if udg_SpellTarget[n]!=null then
            call SaveUnitHandle(udg_hash,i,3,udg_SpellTarget[n])
            call SetUnitInvulnerable( udg_SpellTarget[n], true )
            call SaveEffectHandle(udg_hash,i,4,AddSpecialEffectTarget("war3mapImported\\RuneAura.mdx", udg_SpellTarget[n], "origin"))
        endif
        call TimerStart(tm,3+GetHeroLevel(u)/10,false,function shanchuwudi)
    elseif  l=='A01E' then
        set udg_P=p
        set udg_U=u
        set udg_Re=50+5*GetHeroLevel(u)+(0.15*GetUnitState(u, UNIT_STATE_MAX_LIFE))
        set b=Condition(function  shengqishanghai)
        call GroupEnumUnitsInRange(udg_NullGroup,GetUnitX(u),GetUnitY(u),500,b)
        if udg_SpellTarget[n]!=null then
            call GroupEnumUnitsInRange(udg_NullGroup,GetUnitX(udg_SpellTarget[n]),GetUnitY(udg_SpellTarget[n]),500,b)
        endif
        call DestroyBoolExpr(b)
    elseif  l=='A00V' then
        set tm=CreateTimer()
        set tt=CreateTimer()
        set i=GetHandleId(tm)
        set l=GetHandleId(tt)
        call SetPlayerAbilityAvailable( p, 'A00V', false )
        if IsUnitAlly(u,Player(5))==true then
            call ForGroup(udg_RedTeamHero,function shengqidabegin)
            call SaveInteger(udg_hash,i,1,0)
            call SaveInteger(udg_hash,l,1,0)
        else
            call ForGroup(udg_BlueTeamHero,function shengqidabegin)
            call SaveInteger(udg_hash,i,1,1)
            call SaveInteger(udg_hash,l,1,1)
        endif
        call SaveUnitHandle(udg_hash,i,0,u)
        call SavePlayerHandle(udg_hash,l,0,p)
        call TimerStart(tm,6.5,false,function shengqidajieshu)
        call TimerStart(tt,12,false,function shanchushengqibuff)
    elseif l=='AIh1' then
        call UnitResetCooldown(u)
    endif
    
    set tt=null
    set u=null
    set t=null
    set b=null
    set tm=null
    set p=null
    return false
endfunction



//===========================================================================
function InitTrig_SQS takes nothing returns nothing
    set gg_trg_SQS = CreateTrigger(  )
    call DisableTrigger( gg_trg_SQS )
    call TriggerAddCondition( gg_trg_SQS, Condition( function Trig_SQS_Conditions ) )
endfunction
