
//===========================================================================
// Trigger: TTS
//===========================================================================
function  ttda takes nothing returns boolean
    local unit t=GetFilterUnit()
    local real d
    if IsUnitType(t, UNIT_TYPE_STRUCTURE) == false and IsUnitType(t, UNIT_TYPE_MAGIC_IMMUNE) == false and IsUnitEnemy(t, udg_P) == true and GetUnitAbilityLevel(t, 'Aloc') == 0 and GetUnitState(t, UNIT_STATE_LIFE)>0 and GetUnitAbilityLevel(t, 'Avul') == 0 then
        if IsUnitType(t, UNIT_TYPE_HERO) == true then
            set d=udg_Re-GetHeroStr(t,true)
            if d>10 then
                call UnitDamageTarget( udg_U, t, 10*d, true, true, ATTACK_TYPE_HERO, DAMAGE_TYPE_ENHANCED, WEAPON_TYPE_WHOKNOWS )
            elseif d>0 then
                call SetUnitState( t, UNIT_STATE_MANA,GetUnitState(t, UNIT_STATE_MANA)*0.3)
            endif
        else
            call UnitDamageTarget( udg_U, t, 3*udg_Re, true, true, ATTACK_TYPE_HERO, DAMAGE_TYPE_ENHANCED, WEAPON_TYPE_WHOKNOWS )
        endif
        call DestroyEffect( AddSpecialEffectTarget("war3mapImported\\TTeffect.mdx", t, "origin") )
    endif
    set t=null
    return false
endfunction

function tt2 takes nothing returns boolean
    local unit t=GetFilterUnit()
    if IsUnitType(t, UNIT_TYPE_STRUCTURE) == false and IsUnitEnemy(t, udg_P) == true and GetUnitAbilityLevel(t, 'Aloc') == 0 and GetUnitState(t, UNIT_STATE_LIFE)>0 and GetUnitAbilityLevel(t, 'Avul') == 0 then
        //if t==udg_SpellTarget[udg_i] then
        //call UnitDamageTarget( udg_U, t,udg_Re, true, true, ATTACK_TYPE_CHAOS, DAMAGE_TYPE_ENHANCED, WEAPON_TYPE_WHOKNOWS )
        //else
        call UnitDamageTarget( udg_U, t,udg_Re, true, true, ATTACK_TYPE_HERO, DAMAGE_TYPE_ENHANCED, WEAPON_TYPE_WHOKNOWS )
        //endif
    endif
    set t=null
    return false
endfunction

function spintt takes nothing returns nothing
    local timer tm=GetExpiredTimer()
    local integer n=GetHandleId(tm)
    local integer l=LoadInteger(udg_hash, n, 2)
    local unit u=LoadUnitHandle(udg_hash, n, 1)
    local boolexpr b
    local real x
    local real y
    
    if l>0 and GetUnitState(u, UNIT_STATE_LIFE)>0 then
        set udg_U=u
        set x=GetUnitX(u)
        set y=GetUnitY(u)
        set udg_P=GetOwningPlayer(u)
        set udg_i=LoadInteger(udg_hash, n, 3)
        set udg_Re=LoadReal(udg_hash, n, 3)*(1+(R2I(GetRandomReal(0,0.2+GetUnitAbilityLevel(u,'AIcs')))))
        set b=Condition(function tt2)
        call GroupEnumUnitsInRange(udg_NullGroup,x,y,450,b)
        call DestroyEffect( AddSpecialEffect("war3mapImported\\TT2.mdx", x, y) )
        call DestroyBoolExpr(b)
        call SaveInteger( udg_hash, n, 2, l-1 )
    else
        call SetPlayerAbilityAvailable( GetOwningPlayer(u), 'A091', true )
        call SetUnitMoveSpeed(u, GetUnitDefaultMoveSpeed(u) )
        call AddUnitAnimationProperties( u, "attack walk stand spin", false )
        call FlushChildHashtable( udg_hash, n )
        call DestroyTimer(tm)
    endif
    set u=null
    set b=null
    set tm=null
endfunction

function Trig_TTS_Conditions takes nothing returns boolean
    local timer tm
    local integer i
    local unit u=GetTriggerUnit()
    local integer l=GetSpellAbilityId()
    local unit t
    local integer ev=GetHeroLevel(u)
    local boolexpr b
    local integer n
    local player p
    local texttag a
    local real r
    if l=='A08Z' then
        set t=GetSpellTargetUnit()
        if CheckLinken(t)==true then
            call DestroyEffect( AddSpecialEffectTarget("war3mapImported\\TT1.mdx", t, "chest") )
            set n=GetConvertedPlayerId(GetTriggerPlayer())
            if IsUnitType(t, UNIT_TYPE_HERO) == true then
                set udg_Chaoxi[n]=udg_Chaoxi[n]+15
            else
                set udg_Chaoxi[n]=udg_Chaoxi[n]+5
            endif
            //set udg_Chaoxi[1]=udg_Chaoxi[n]
            set r=100+(5*ev)+udg_Chaoxi[n]
            if udg_SpellTarget[n]==t then
                call UnitDamageTarget( u, t, r, true, true, ATTACK_TYPE_CHAOS, DAMAGE_TYPE_ENHANCED, WEAPON_TYPE_WHOKNOWS )
            else
                call UnitDamageTarget( u, t, r, true, true, ATTACK_TYPE_HERO, DAMAGE_TYPE_ENHANCED, WEAPON_TYPE_WHOKNOWS )
            endif
            set udg_SpellTarget[n]=t
            set a=CreateTextTag()
            call SetTextTagText(a, I2S(R2I(r)), 0.023)
            call SetTextTagPosUnit(a,t,0)
            call SetTextTagColor(a,255,182,193,255)
            call SetTextTagVelocity( a, 0.00, 0.04 )
            call SetTextTagFadepoint( a, 0.50 )
            call SetTextTagLifespan(a, 1 )
            call SetTextTagPermanent( a, false )
        endif
    elseif l=='A090' then
        set udg_U=u
        set udg_P=GetOwningPlayer(u)
        set udg_Re=(ev+GetHeroStr(u,true))*(1+(0.6*GetUnitAbilityLevel(u,'B01T') ))
        set b=Condition(function  ttda)
        call GroupEnumUnitsInRange(udg_NullGroup,GetUnitX(u),GetUnitY(u),400+50*GetUnitAbilityLevel(u,'A090'),b)
        call DestroyBoolExpr(b)
    elseif l=='A091' then
        set tm=CreateTimer()
        set i=GetHandleId(tm)
        set p=GetTriggerPlayer()
        call SaveReal( udg_hash, i, 3, 105+GetHeroStr(u,true) )
        call SaveInteger( udg_hash, i, 3, GetConvertedPlayerId(p) )
        call SaveInteger( udg_hash, i, 2, 8 )
        call SaveUnitHandle(udg_hash,i,1,u)
        call SetPlayerAbilityAvailable( p, 'A091', false )
        call DestroyEffect( AddSpecialEffect("war3mapImported\\TT2.mdx", GetUnitX(u),GetUnitY(u)) )
        call AddUnitAnimationProperties( u, "attack walk stand spin", true )
        call SetUnitMoveSpeed(u, GetUnitDefaultMoveSpeed(u)+(ev*3) )
        call TimerStart(tm,0.7,true,function spintt)
    elseif l=='AIh1' then
        call UnitResetCooldown(u)
    endif
    set t=null
    set p=null
    set u=null
    set b=null
    set a= null
    set tm=null
    return false
endfunction



//===========================================================================
function InitTrig_TTS takes nothing returns nothing
    set gg_trg_TTS = CreateTrigger(  )
    call DisableTrigger( gg_trg_TTS )
    call TriggerAddCondition( gg_trg_TTS, Condition( function Trig_TTS_Conditions ) )
endfunction
