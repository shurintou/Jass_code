
//===========================================================================
// Trigger: SSS
//===========================================================================
function movesvenharm takes nothing returns boolean
    local unit t=GetFilterUnit()
    if IsUnitEnemy(t, udg_P) == true and GetUnitAbilityLevel(t, 'Aloc') == 0 and GetUnitState(t, UNIT_STATE_LIFE)>0 and GetUnitAbilityLevel(t, 'Avul') == 0 and IsUnitType(t, UNIT_TYPE_STRUCTURE) == false then
        call UnitDamageTarget( udg_U, t, udg_Re, true, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
    endif
    set t=null
    return false
endfunction

function svendazhao_jinzhan takes nothing returns boolean
    local unit t=GetFilterUnit()
    if IsUnitEnemy(t, udg_P) == true and GetUnitAbilityLevel(t, 'Aloc') == 0 and GetUnitState(t, UNIT_STATE_LIFE)>0 and GetUnitAbilityLevel(t, 'Avul') == 0 and IsUnitType(t, UNIT_TYPE_STRUCTURE) == false then
        call UnitDamageTarget( udg_U, t, udg_Re, true, false, ATTACK_TYPE_HERO, DAMAGE_TYPE_ENHANCED, WEAPON_TYPE_WHOKNOWS )
        if IsUnitType(t, UNIT_TYPE_MELEE_ATTACKER) == true then
            call UnitDamageTarget( udg_U, t, GetUnitState(udg_U, UNIT_STATE_MAX_LIFE)*0.06, true, false, ATTACK_TYPE_HERO, DAMAGE_TYPE_ENHANCED, WEAPON_TYPE_WHOKNOWS )
        endif
    endif
    set t=null
    return false
endfunction

function svendazhao_yuancheng takes nothing returns boolean
    local unit t=GetFilterUnit()
    if IsUnitEnemy(t, udg_P) == true and GetUnitAbilityLevel(t, 'Aloc') == 0 and GetUnitState(t, UNIT_STATE_LIFE)>0 and GetUnitAbilityLevel(t, 'Avul') == 0 and IsUnitType(t, UNIT_TYPE_STRUCTURE) == false then
        call UnitDamageTarget( udg_U, t, udg_Re, true, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
        if IsUnitType(t, UNIT_TYPE_RANGED_ATTACKER) == true then
            call UnitDamageTarget( udg_U, t, GetUnitState(t, UNIT_STATE_MAX_LIFE)*0.06, true, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
        endif
    endif
    set t=null
    return false
endfunction

function movesvengogogo takes nothing returns nothing
    local timer tm=GetExpiredTimer()
    local integer i=GetHandleId(tm)
    local unit u=LoadUnitHandle(udg_hash,i,1)
    local unit t=LoadUnitHandle(udg_hash,i,2)
    local real x=GetUnitX(u)
    local real y=GetUnitY(u)
    local real tx=GetUnitX(t)
    local real ty=GetUnitY(t)
    local real dx=tx-x
    local real dy=ty-y
    local real dis=dx*dx + dy*dy
    local real angle=0
    local integer ui=0
    local boolexpr b
    local integer n=0
    
    if dis>8100 and GetUnitState(t, UNIT_STATE_LIFE) >0 then
        set angle=Atan2(dy, dx)
        call SetUnitX(u,GetUnitX(u)+Cos(angle)*90)
        call SetUnitY(u,GetUnitY(u)+Sin(angle)*90)
    else
        set ui=GetUnitTypeId(u)
        call SetUnitX(u,GetUnitX(t))
        call SetUnitY(u,GetUnitY(t))
        set n=GetConvertedPlayerId(GetOwningPlayer(u))
        if ui=='H00D' then
            call UnitDamageTarget( u, t, 75*(((GetHeroLevel(u)-7)/6)+ udg_Chaoxi[n]), true, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
        elseif ui=='H00B' then
            call UnitRemoveAbility(u,'A0A8')
            call UnitDamageTarget( u, t, 0.1+0.01*(((GetHeroLevel(u)-7)/6)+ udg_Chaoxi[n])*GetUnitState(t, UNIT_STATE_MAX_LIFE), true, false, ATTACK_TYPE_HERO, DAMAGE_TYPE_ENHANCED, WEAPON_TYPE_WHOKNOWS )
        else
            set udg_P=GetOwningPlayer(u)
            set udg_U=u
            set udg_Re=0.1+0.01*(((GetHeroLevel(u)-7)/6)+ udg_Chaoxi[n])*GetUnitState(u, UNIT_STATE_MAX_LIFE)
            set b=Condition(function movesvenharm)
            call GroupEnumUnitsInRange(udg_NullGroup,x,y,300,b)
            call DestroyBoolExpr(b)
        endif
        call DestroyEffect(LoadEffectHandle(udg_hash,i,3))
        call PauseUnit( u, false)
        call SetUnitInvulnerable( u,false)
        call IssueTargetOrderById( u,851983, t)
        call IssueImmediateOrderById( u,852127 )
        call FlushChildHashtable( udg_hash, i )
        call PauseTimer(tm)
        call DestroyTimer(tm)
    endif
    
    set t=null
    set b=null
    set u=null
    set tm=null
endfunction

function Trig_SSS_Conditions takes nothing returns boolean
    local unit u=GetTriggerUnit()
    local integer l=GetSpellAbilityId()
    local boolexpr b
    local integer level=R2I((GetHeroLevel(u)-7)/6)
    local unit t
    local timer tm
    local integer i=0
    local real x
    local real y
    local unit m
    local integer ui=GetUnitTypeId(u)
    local integer n=GetConvertedPlayerId(GetTriggerPlayer())
    
    if l == 'A0A6'  then
        set t=GetSpellTargetUnit()
        if CheckLinken(t)==true then
            set tm=CreateTimer()
            set i=GetHandleId(tm)
            call SetUnitAnimation( u,"attack" )
            call PauseUnit( u, true )
            set udg_SpellTimer[GetConvertedPlayerId(GetTriggerPlayer())]=1
            set m=CreateUnit(getcorrectplayer(u),'u000',GetUnitX(u), GetUnitY(u),0)
            call UnitAddAbility(m,'A0A7')
            call SetUnitAbilityLevel(m,'A0A7',level)
            call UnitApplyTimedLife( m, 'BTLF', 1.00 )
            call IssuePointOrderById( m, 852218, GetUnitX(t), GetUnitY(t) )
            call SaveUnitHandle(udg_hash,i,1,u)
            call SaveUnitHandle(udg_hash,i,2,t)
            if ui=='H00D' then
                call SaveEffectHandle(udg_hash,i,3,AddSpecialEffectTarget("war3mapImported\\Valiant Charge Fel.mdx", u, "origin") )
            elseif ui=='H00B' then
                call UnitAddAbility(u,'A0A8')
                call SaveEffectHandle(udg_hash,i,3,AddSpecialEffectTarget("war3mapImported\\Valiant Charge.mdx", u, "chest") )
            else
                call SaveEffectHandle(udg_hash,i,3,AddSpecialEffectTarget("war3mapImported\\Valiant Charge Royal.mdx", u, "chest") )
            endif
            call SetUnitInvulnerable( u,true )
            call TimerStart(tm,0.03,true,function movesvengogogo)
        endif
        
    elseif l== 'A0A1' then
        set x=GetUnitX(u)
        set y=GetUnitY(u)
        set m=CreateUnit(getcorrectplayer(u),'u000',x,y,0)
        set level=level + GetUnitAbilityLevel(u,'B01T')
        call UnitAddAbility(m,'A0A2')
        call DestroyEffect( AddSpecialEffect("war3mapImported\\Kingdom Come_opt.mdx", x,y) )
        set udg_P=GetOwningPlayer(u)
        set udg_U=u
        set udg_Re=(20*(level+udg_Chaoxi[n]))+ 400
        if ui=='H00D' then
            call SetUnitAbilityLevel(m,'A0A2',0+level)
            set b=Condition(function movesvenharm)
            call GroupEnumUnitsInRange(udg_NullGroup,x,y,300+(100*level),b)
        elseif ui=='H00B' then
            call SetUnitAbilityLevel(m,'A0A2',4+level)
            set b=Condition(function svendazhao_jinzhan)
            call GroupEnumUnitsInRange(udg_NullGroup,x,y,400+(100*level),b)
        else
            call SetUnitAbilityLevel(m,'A0A2',8+level)
            set b=Condition(function svendazhao_yuancheng)
            call GroupEnumUnitsInRange(udg_NullGroup,x,y,500+(100*level),b)
        endif
        call DestroyBoolExpr(b)
        call UnitApplyTimedLife( m, 'BTLF', 1.00 )
        call IssuePointOrderById( m, 852592, x,y)
        
    elseif l=='A0A4' then
        set x=GetUnitX(u)
        set y=GetUnitY(u)
        set udg_P=GetOwningPlayer(u)
        set udg_U=u
        set udg_Re= 10*(((GetHeroLevel(u)-7)/6)+udg_Chaoxi[n])+ 200
        if ui=='H00D' then
            call DestroyEffect( AddSpecialEffect("war3mapImported\\Conflagrate Green.mdx", x,y) )
            set b=Condition(function movesvenharm)
            call GroupEnumUnitsInRange(udg_NullGroup,x,y,250+(50*level),b)
        elseif ui=='H00B' then
            call DestroyEffect( AddSpecialEffect("war3mapImported\\Conflagrate.mdx", x,y) )
            set b=Condition(function svendazhao_jinzhan)
            call GroupEnumUnitsInRange(udg_NullGroup,x,y,250+(50*level),b)
        else
            call DestroyEffect( AddSpecialEffect("war3mapImported\\Conflagrate Blue.mdx", x,y) )
            set b=Condition(function svendazhao_yuancheng)
            call GroupEnumUnitsInRange(udg_NullGroup,x,y,250+(50*level),b)
        endif
        call DestroyBoolExpr(b)
        
    elseif l=='AIh1' then
        call UnitResetCooldown(u)
    endif
    
    set m=null
    set u=null
    set b=null
    set tm=null
    set t=null
    return false
endfunction


//===========================================================================
function InitTrig_SSS takes nothing returns nothing
    set gg_trg_SSS = CreateTrigger(  )
    call DisableTrigger( gg_trg_SSS )
    call TriggerAddCondition( gg_trg_SSS, Condition( function Trig_SSS_Conditions ) )
endfunction
