
//===========================================================================
// Trigger: SPS
//===========================================================================
function SP1 takes nothing returns boolean
    local unit t=GetFilterUnit()
    local unit m
    if IsUnitType(t, UNIT_TYPE_STRUCTURE) == false and IsUnitType(t, UNIT_TYPE_MAGIC_IMMUNE)==false and IsUnitEnemy(t, udg_P) == true and GetUnitAbilityLevel(t, 'Aloc') == 0 and GetUnitState(t, UNIT_STATE_LIFE)>0 and GetUnitAbilityLevel(t, 'Avul') == 0 then
        call UnitDamageTarget( udg_U, t, udg_Re+(0.08*GetUnitState(t, UNIT_STATE_LIFE)) , true, true, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
        set m=CreateUnit(udg_P ,'u000',GetUnitX(t),GetUnitY(t),0)
        call UnitAddAbility(m,'ACwb')
        call SetUnitAbilityLevel(m,'ACwb',udg_n)
        call UnitApplyTimedLife( m, 'BTLF', 1.00 )
        call IssueTargetOrderById( m, 852211, t)
    endif
    set m=null
    set t=null
    return false
endfunction

function SP2 takes nothing returns boolean
    local unit t=GetFilterUnit()
    local unit m
    if IsUnitType(t, UNIT_TYPE_STRUCTURE) == false and IsUnitType(t, UNIT_TYPE_MECHANICAL) == false and IsUnitType(t, UNIT_TYPE_MAGIC_IMMUNE)==false and IsUnitEnemy(t, udg_P) == true and GetUnitAbilityLevel(t, 'Aloc') == 0 and GetUnitState(t, UNIT_STATE_LIFE)>0 and GetUnitAbilityLevel(t, 'Avul') == 0 then
        call UnitDamageTarget( udg_U, t, udg_Re+(0.08*(GetUnitState(t, UNIT_STATE_MAX_LIFE)-GetUnitState(t, UNIT_STATE_LIFE))) , true, true, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
        set m=CreateUnit(udg_P ,'u000',GetUnitX(t),GetUnitY(t),0)
        call UnitAddAbility(m,'ANpa')
        call SetUnitAbilityLevel(m,'ANpa',udg_n)
        call UnitApplyTimedLife( m, 'BTLF', 1.00 )
        call IssueTargetOrderById( m, 852601, t)
    endif
    set m=null
    set t=null
    return false
endfunction

function Trig_SPS_Conditions takes nothing returns boolean
    local unit u=GetTriggerUnit()
    local integer l=GetSpellAbilityId()
    local boolexpr b
    local integer level
    local real r
    local unit t
    local real h
    
    if  l == 'A093'  then
        set level=GetHeroLevel(u)
        set udg_P=getcorrectplayer(u)
        set udg_U=u
        set udg_n=R2I((level-2)/8)
        set udg_Re=(10*level)+150
        set b=Condition(function  SP1)
        call GroupEnumUnitsInRange(udg_NullGroup,GetSpellTargetX(),GetSpellTargetY(),350+(50*udg_n),b)
        call DestroyBoolExpr(b)
    elseif l=='A094' then
        set t=GetSpellTargetUnit()
        if CheckLinken(t)==true then
            set level=GetHeroLevel(u)
            call DestroyEffect( AddSpecialEffectTarget("war3mapImported\\spiderda.mdx", t, "origin") )
            set r=GetUnitState(t, UNIT_STATE_LIFE)
            set h=((0.1*GetUnitState(u, UNIT_STATE_MAX_LIFE))+(15*level)+100)*(1+(0.5*GetUnitAbilityLevel(u,'B01T') ))
            call SetUnitState( u, UNIT_STATE_LIFE,GetUnitState(u, UNIT_STATE_LIFE)+h)
            if r>h then
                call SetUnitState( t, UNIT_STATE_LIFE,r-h)
            else
                call KillUnit(t)
                call AddHeroXP( u, 15*GetUnitLevel(t), true )
                call DestroyEffect( AddSpecialEffectTarget("war3mapImported\\TCattackup.mdx", u, "chest") )
                call UnitAddAbility( u, 'A095' )
                call SetUnitAbilityLevel( u, 'A095', 1+R2I((level-2)/8) )
                call UnitRemoveAbility( u, 'A095' )
            endif
        endif
    elseif l=='A097' then
        set level=GetHeroLevel(u)
        set udg_P=getcorrectplayer(u)
        set udg_U=u
        set udg_n=R2I((level-2)/8)
        set udg_Re=(10*level)+150
        set b=Condition(function  SP2)
        call GroupEnumUnitsInRange(udg_NullGroup,GetSpellTargetX(),GetSpellTargetY(),350+(50*udg_n),b)
        call DestroyBoolExpr(b)
    elseif l=='AIh1' then
        call UnitResetCooldown(u)
    endif
    set b=null
    set u=null
    set t=null
    return false
endfunction



//===========================================================================
function InitTrig_SPS takes nothing returns nothing
    set gg_trg_SPS = CreateTrigger(  )
    call DisableTrigger( gg_trg_SPS )
    call TriggerAddCondition( gg_trg_SPS, Condition( function Trig_SPS_Conditions ) )
endfunction
