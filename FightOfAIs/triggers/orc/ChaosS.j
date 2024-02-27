
//===========================================================================
// Trigger: ChaosS
//===========================================================================
function newxuanquchaos takes nothing returns boolean
    local unit t=GetFilterUnit()
    if IsUnitType(t, UNIT_TYPE_STRUCTURE) == false and IsUnitEnemy(t, udg_P) == true and GetUnitAbilityLevel(t, 'Aloc') == 0 and GetUnitState(t, UNIT_STATE_LIFE)>0 then
        call UnitDamageTarget( udg_U, t, 100+udg_Re*GetUnitState(t, UNIT_STATE_MAX_LIFE), true, true, ATTACK_TYPE_CHAOS, DAMAGE_TYPE_UNIVERSAL, WEAPON_TYPE_WHOKNOWS )
        call DestroyEffect( AddSpecialEffectTarget("Abilities\\Spells\\Human\\MarkOfChaos\\MarkOfChaosTarget.mdl",t, "origin")  )
        if  IsUnitType(t, UNIT_TYPE_HERO) == true then
            set udg_n=udg_n+3
        else
            set udg_n=udg_n+1
        endif
    endif
    set t=null
    return false
endfunction

function Trig_ChaosS_Conditions takes nothing returns boolean
    local unit u=GetTriggerUnit()
    local boolexpr b
    local integer l=GetSpellAbilityId()
    local unit t
    local integer g
    local texttag a
    local integer i
    local unit m
    if l=='A03O' then
        set udg_U=u
        set udg_P=GetTriggerPlayer()
        set g=GetConvertedPlayerId(udg_P)
        set b=Condition(function newxuanquchaos)
        if GetUnitAbilityLevel(u,'B01T')>0 then
            set udg_Re=0.15+(0.05*(GetHeroLevel(u)/10))
            set udg_n=50
        else
            set udg_Re=0.1+(0.04*(GetHeroLevel(u)/10))
            set udg_n=20
        endif
        call GroupEnumUnitsInRange(udg_NullGroup,GetUnitX(u),GetUnitY(u),600,b)
        set udg_UGharm[g]=udg_UGharm[g]+(udg_n/5)
        call DestroyBoolExpr(b)
    elseif l=='A03M' then
        set t=GetSpellTargetUnit()
        if CheckLinken(t)==true then
            set l=GetHeroLevel(u)
            set i=GetRandomInt(R2I((l-5)/5),5)
            set m=CreateUnit(getcorrectplayer(u) ,'u000',GetUnitX(t),GetUnitY(t),0)
            call UnitAddAbility(m,'A007')
            call UnitApplyTimedLife( m, 'BTLF', 2.00 )
            call SetUnitAbilityLevel(m,'A007',i)
            call IssueTargetOrderById( m,852095, t)
            call UnitDamageTarget( u, t, GetRandomReal(l,5*l), true, true, ATTACK_TYPE_CHAOS, DAMAGE_TYPE_UNIVERSAL, WEAPON_TYPE_WHOKNOWS )
            call DestroyEffect( AddSpecialEffectTarget("war3mapImported\\15.mdx", t, "origin") )
            call SetUnitX(u,GetUnitX(t)+GetRandomReal(-50,50))
            call SetUnitY(u,GetUnitY(t)+GetRandomReal(-50,50))
            set a=CreateTextTag()
            call SetTextTagText(a, I2S(i)+"s", 0.023)
            call SetTextTagPosUnit(a,t,0)
            call SetTextTagColor(a,130,130,130,255)
            call SetTextTagVelocity( a, 0.00, 0.04 )
            call SetTextTagFadepoint( a, 0.50 )
            call SetTextTagLifespan(a, 1 )
            call SetTextTagPermanent( a, false )
        endif
    elseif l=='AIh1' then
        call UnitResetCooldown(u)
    endif
    
    set t=null
    set a=null
    set m=null
    set u=null
    set b=null
    return false
endfunction



//===========================================================================
function InitTrig_ChaosS takes nothing returns nothing
    set gg_trg_ChaosS = CreateTrigger(  )
    call DisableTrigger( gg_trg_ChaosS )
    call TriggerAddCondition( gg_trg_ChaosS, Condition( function Trig_ChaosS_Conditions ) )
endfunction
