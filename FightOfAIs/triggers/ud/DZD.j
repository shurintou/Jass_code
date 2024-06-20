
//===========================================================================
// Trigger: DZD
//===========================================================================
function shieldzhadanbaozhahhhhh takes nothing returns boolean
    local unit t=GetFilterUnit()
    if IsUnitType(t, UNIT_TYPE_STRUCTURE) == false and IsUnitEnemy(t, udg_P) == true and GetUnitAbilityLevel(t, 'Aloc') == 0 and GetUnitState(t, UNIT_STATE_LIFE)>0 and IsUnitType(t, UNIT_TYPE_MAGIC_IMMUNE)==false and GetUnitAbilityLevel(t, 'Avul') == 0 and IsUnitType(t, UNIT_TYPE_MECHANICAL) == false then
        call UnitDamageTarget( udg_U, t, udg_Re, true, false,  ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
    endif
    set t=null
    return false
endfunction

function shieldbaozhale takes unit u returns nothing
    local boolexpr b
    set udg_P=GetOwningPlayer(u)
    set udg_U=u
    set udg_Re=0.15*GetUnitState(u, UNIT_STATE_MAX_LIFE)
    call UnitRemoveAbility(u,'A065')
    call DestroyEffect( AddSpecialEffectTarget("war3mapImported\\HellFire2.mdx", u, "origin") )
    set b=Condition(function shieldzhadanbaozhahhhhh)
    call GroupEnumUnitsInRange(udg_NullGroup,GetUnitX(u),GetUnitY(u),500,b)
    call DestroyBoolExpr(b)
    set b=null
endfunction



function Trig_DZD_Conditions takes nothing returns boolean
    local unit u=GetTriggerUnit()
    local real r=GetUnitState(u, UNIT_STATE_MAX_LIFE)
    local integer i=GetConvertedPlayerId(GetTriggerPlayer())
    local real h=GetEventDamage()
    local real hp=GetUnitState(u, UNIT_STATE_LIFE)
    local unit t=GetEventDamageSource()
    
    call SetUnitAbilityLevel( u, 'A03B', R2I((r-hp)/r*30) )
    
    if udg_UGharm[i]>0 then
        if udg_UGharm[i]>h then
            set udg_UGharm[i]=udg_UGharm[i]-h
            call SetUnitState( u, UNIT_STATE_LIFE, hp+h)
        else
            call SetUnitState( u, UNIT_STATE_LIFE, hp+udg_UGharm[i])
            set udg_UGharm[i]=0
            call shieldbaozhale(u)
        endif
    else
        call IssueImmediateOrderById(u, 852184 )
    endif
    
    if  IsUnitType(t, UNIT_TYPE_HERO) == true  then
        call IssueTargetOrderById( u, 852662,  t )
    endif
    set t=null
    set u=null
    return false
endfunction



//===========================================================================
function InitTrig_DZD takes nothing returns nothing
    set gg_trg_DZD = CreateTrigger(  )
    call DisableTrigger( gg_trg_DZD )
    call TriggerAddCondition( gg_trg_DZD, Condition( function Trig_DZD_Conditions ) )
endfunction
