
//===========================================================================
// Trigger: UG2
//
// UGharm  is using.
//  
//     
//===========================================================================
function yougui takes nothing returns boolean
    local unit u=GetFilterUnit()
    local integer i=GetUnitTypeId(u)
    if IsUnitType(u, UNIT_TYPE_STRUCTURE) == false and IsUnitEnemy(u, udg_PG) == true and GetUnitAbilityLevel(u, 'Aloc') == 0 and GetUnitState(u, UNIT_STATE_LIFE)>0 and i != 'Udth' and i != 'O00H' then
        call UnitDamageTarget( udg_UG, u, udg_Re, true, false, ATTACK_TYPE_CHAOS, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
        call DestroyEffect( AddSpecialEffectTarget("Abilities\\Spells\\Undead\\DeathandDecay\\DeathandDecayDamage.mdl", u, "chest") )
    endif
    set u=null
    return false
endfunction



function zheshe takes unit u returns nothing
    local boolexpr b
    set udg_UG=u
    set udg_PG=GetOwningPlayer(u)
    set udg_Re=70+(1.2*GetHeroLevel(u))
    set b=Condition(function yougui)
    call GroupEnumUnitsInRange(udg_NullGroup,GetUnitX(u),GetUnitY(u),1000,b)
    call DestroyBoolExpr(b)
    set b=null
endfunction

function Trig_UG2_Conditions takes nothing returns boolean
    local unit u=GetTriggerUnit()
    local real h=GetEventDamage()
    local integer i=GetConvertedPlayerId(GetTriggerPlayer())
    
    call IssueTargetOrderById( u, 852095, GetEventDamageSource() )
    
    call IssueImmediateOrderById( u, 852183 )
    call SetUnitState( u, UNIT_STATE_LIFE, GetUnitState(u, UNIT_STATE_LIFE)+0.16*h )
    set h=h+udg_UGharm[i]
    loop
        exitwhen h<1000
        set h=h-1000
        call zheshe(u)
    endloop
    set udg_UGharm[i]=h
    
    set u=null
    return false
endfunction



//===========================================================================
function InitTrig_UG2 takes nothing returns nothing
    set gg_trg_UG2 = CreateTrigger(  )
    call DisableTrigger(gg_trg_UG2)
    call TriggerAddCondition( gg_trg_UG2, Condition( function Trig_UG2_Conditions ) )
    
endfunction
