
//===========================================================================
// Trigger: medivenshifa
//
// 
//     
//===========================================================================
function shamodanwei takes nothing returns boolean
    local unit t=GetFilterUnit()
    
    
    if IsUnitType(t, UNIT_TYPE_STRUCTURE) == false and IsUnitEnemy(t, udg_P) == true and GetUnitAbilityLevel(t, 'Aloc') == 0 and GetUnitState(t, UNIT_STATE_LIFE)>0  then
        call UnitDamageTarget( udg_U, t,udg_Re*GetUnitState(t, UNIT_STATE_MAX_LIFE) , true, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
        call DestroyEffect( AddSpecialEffect("Abilities\\Weapons\\TreantMissile\\TreantMissile.mdl", GetUnitX(t), GetUnitY(t)) )
    endif
    set t=null
    
    return false
endfunction


function Trig_medivenshifa_Conditions takes nothing returns boolean
    local unit m
    local unit u=GetTriggerUnit()
    local integer i=GetSpellAbilityId()
    local integer n=0
    local boolexpr b
    local real x
    local real y
    local integer le=R2I((GetHeroLevel(u)-3)/7)
    if  i == 'A030'  then
        set x=GetSpellTargetX()
        set y=GetSpellTargetY()
        set m=CreateUnit(getcorrectplayer(u),'u000',GetUnitX(u),GetUnitY(u),0)
        call SetUnitAbilityLevel(u,'A030',le)
        call UnitAddAbility( m, 'A02Z' )
        call SetUnitAbilityLevel(m,'A02Z',le)
        call UnitApplyTimedLife( m, 'BTLF', 10.00 )
        call IssuePointOrderById( m, 852652, x, y )
        set n=1
    elseif  i=='SNin' then
        set x=GetSpellTargetX()
        set y=GetSpellTargetY()
        call SetUnitAbilityLevel(u,'SNin',le)
        set m=CreateUnit(getcorrectplayer(u),'u000',0,0,0)
        call UnitApplyTimedLife( m, 'BTLF', 10.00 )
        call UnitAddAbility(m,'A05L')
        call SetUnitAbilityLevel(m,'A05L',le)
        call IssuePointOrderById( m, 852089, x,y )
        set n=1
    elseif  i=='A032' then
        call SetUnitAbilityLevel(u,'A032',le)
        set m=GetSpellTargetUnit()
        set x=GetUnitX(m)
        set y=GetUnitY(m)
        set n=1
    elseif i=='AIh1' then
        call UnitRemoveAbility(u,'A030')
        call UnitRemoveAbility(u,'SNin')
        call UnitRemoveAbility(u,'A032')
        call UnitAddAbility(u,'A030')
        call UnitAddAbility(u,'SNin')
        call UnitAddAbility(u,'A032')
        call SetUnitAbilityLevel(u,'A030',le)
        call SetUnitAbilityLevel(u,'A032',le)
        call SetUnitAbilityLevel(u,'SNin',le)
        call UnitMakeAbilityPermanent( u, true, 'A030' )
        call UnitMakeAbilityPermanent( u, true, 'SNin' )
        call UnitMakeAbilityPermanent( u, true, 'A032' )
    endif
    
    
    if n==1 then
        set b=Condition(function shamodanwei)
        set udg_P=GetOwningPlayer(u)
        set udg_U=u
        if GetUnitFlyHeight(udg_U) >= 100.00 then
            set udg_Re=0.1
        else
            set udg_Re=0.05
        endif
        if GetUnitAbilityLevel(u,'B01T')>0 then
            set udg_Re=udg_Re+0.05
        endif
        call GroupEnumUnitsInRange(udg_NullGroup,x,y,1000,b)
        call DestroyBoolExpr(b)
    endif
    
    set u=null
    set m=null
    set b=null
    return false
endfunction



//===========================================================================
function InitTrig_medivenshifa takes nothing returns nothing
    set gg_trg_medivenshifa = CreateTrigger(  )
    call DisableTrigger( gg_trg_medivenshifa )
    call TriggerAddCondition( gg_trg_medivenshifa, Condition( function Trig_medivenshifa_Conditions ) )
endfunction
