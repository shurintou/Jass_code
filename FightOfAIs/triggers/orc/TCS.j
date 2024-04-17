
//===========================================================================
// Trigger: TCS
//===========================================================================
function TC1 takes nothing returns boolean
    local unit t=GetFilterUnit()
    local unit m
    local real ds
    local real s
    if IsUnitType(t, UNIT_TYPE_STRUCTURE) == false and IsUnitAlly(t, udg_P) == true and GetUnitAbilityLevel(t, 'Aloc') == 0 and GetUnitState(t, UNIT_STATE_LIFE)>0 and GetUnitAbilityLevel(t, 'Avul') == 0 then
        call UnitDamageTarget( udg_U, t, udg_Re, true, true, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_NORMAL, WEAPON_TYPE_WHOKNOWS )
        if IsUnitType(t, UNIT_TYPE_MECHANICAL) ==false and IsUnitType(t, UNIT_TYPE_MAGIC_IMMUNE)==false then
            set m=CreateUnit(udg_P ,'u000',GetUnitX(t),GetUnitY(t),0)
            call UnitAddAbility(m,'A08U')
            call SetUnitAbilityLevel(m,'A08U',udg_n)
            call UnitApplyTimedLife( m, 'BTLF', 1.00 )
            call IssueTargetOrderById( m, 852227, t)
            set ds=GetUnitDefaultMoveSpeed(t)
            set s=(GetUnitMoveSpeed(t)-ds)/ds
            if s<0 then
                call SetUnitState( udg_U, UNIT_STATE_LIFE,GetUnitState(udg_U, UNIT_STATE_LIFE)-(GetUnitState(t, UNIT_STATE_LIFE)*s))
            endif
        endif
    endif
    set m=null
    set t=null
    return false
endfunction



function TCDA takes nothing returns boolean
    local unit t=GetFilterUnit()
    local real ds
    if IsUnitType(t, UNIT_TYPE_STRUCTURE) == false and IsUnitEnemy(t, udg_P) == true and GetUnitAbilityLevel(t, 'Aloc') == 0 and GetUnitState(t, UNIT_STATE_LIFE)>0 and GetUnitAbilityLevel(t, 'Avul') == 0 then
        set ds=GetUnitDefaultMoveSpeed(t)
        call UnitDamageTarget( udg_U, t, 0.7*udg_Re*GetUnitState(t, UNIT_STATE_MAX_LIFE)*(1-((GetUnitMoveSpeed(t)-ds)/ds)), true, true, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_NORMAL, WEAPON_TYPE_WHOKNOWS )
        call DestroyEffect( AddSpecialEffectTarget("war3mapImported\\TCda.mdx",t, "origin") )
    endif
    set t=null
    return false
endfunction

function Trig_TCS_Conditions takes nothing returns boolean
    local unit u=GetTriggerUnit()
    local integer l=GetSpellAbilityId()
    local boolexpr b
    local integer level
    local real s
    local real ds
    local unit m
    if  l == 'A08T'  then
        set level=GetHeroLevel(u)
        set udg_P=getenemyplayer(u)
        set udg_U=u
        set udg_n=R2I((level-2)/8)
        set ds=GetUnitDefaultMoveSpeed(u)
        set s=(GetUnitMoveSpeed(u)-ds)/ds
        set udg_Re=(15*level)+150
        if s>0 then
            set udg_Re=udg_Re*(1+s)
        endif
        set b=Condition(function  TC1)
        call GroupEnumUnitsInRange(udg_NullGroup,GetUnitX(u),GetUnitY(u),400+(5*level),b)
        call DestroyBoolExpr(b)
    elseif l=='A08S' then
        set udg_P=GetOwningPlayer(u)
        set udg_U=u
        set level=GetUnitAbilityLevel(u,'A08S')
        set ds=GetUnitDefaultMoveSpeed(u)
        set s=(GetUnitMoveSpeed(u)-ds)/ds
        set udg_Re=0.16+(0.07*level)+(0.16*GetUnitAbilityLevel(u,'B01T'))
        if s>0 then
            set udg_Re=udg_Re+s
        else
            call SetUnitState( u, UNIT_STATE_LIFE,GetUnitState(u, UNIT_STATE_LIFE)-(GetUnitState(u, UNIT_STATE_MAX_LIFE)*s))
        endif
        set b=Condition(function  TCDA)
        set s=GetUnitX(u)
        set ds=GetUnitY(u)
        set m=CreateUnit(udg_P ,'u000',s,ds,0)
        call UnitAddAbility(m,'A08X')
        call SetUnitAbilityLevel(m,'A08X',level)
        call UnitApplyTimedLife( m, 'BTLF', 1.50 )
        call IssueImmediateOrderById(m, 852127 )
        call GroupEnumUnitsInRange(udg_NullGroup,s,ds,350+(50*level),b)
        call DestroyBoolExpr(b)
    elseif l=='AIh1' then
        call UnitResetCooldown(u)
    endif
    set u=null
    set b=null
    set m=null
    return false
endfunction



//===========================================================================
function InitTrig_TCS takes nothing returns nothing
    set gg_trg_TCS = CreateTrigger(  )
    call DisableTrigger( gg_trg_TCS )
    call TriggerAddCondition( gg_trg_TCS, Condition( function Trig_TCS_Conditions ) )
endfunction
