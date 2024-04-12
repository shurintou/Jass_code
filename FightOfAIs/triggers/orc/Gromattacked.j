
//===========================================================================
// Trigger: Gromattacked
//===========================================================================
function xuanqugrom takes nothing returns boolean
    local unit t=GetFilterUnit()
    if IsUnitType(t, UNIT_TYPE_STRUCTURE) == false and IsUnitEnemy(t, udg_P) == true and GetUnitAbilityLevel(t, 'Aloc') == 0 and GetUnitState(t, UNIT_STATE_LIFE)>0 then
        call UnitDamageTarget( udg_U, t, udg_i, true, false, ATTACK_TYPE_CHAOS, DAMAGE_TYPE_UNIVERSAL, WEAPON_TYPE_WHOKNOWS )
        call DestroyEffect( AddSpecialEffectTarget("Abilities\\Weapons\\Blood\\BloodImpact.mdl", t, "chest") )
    endif
    set t=null
    return false
endfunction

function grom takes unit u returns nothing
    local boolexpr b
    local integer i=GetHeroLevel(u)
    set udg_U=u
    set udg_i=25+4*i+45*GetUnitAbilityLevel(u,'B01T')
    set b=Condition(function xuanqugrom)
    call SetUnitAnimationByIndex(u, 12 )
    set udg_P=GetOwningPlayer(u)
    call GroupEnumUnitsInRange(udg_NullGroup,GetUnitX(u),GetUnitY(u),250+(i*5),b)
    call DestroyBoolExpr(b)
    set b=null
endfunction


function Trig_Gromattacked_Conditions takes nothing returns boolean
    local integer n
    local unit t=GetAttacker()
    if IsUnitType(t, UNIT_TYPE_HERO) == true then
        set n=GetRandomInt(1,100)
        if n<25 then
            call grom(GetTriggerUnit())
        endif
    else
        if  GetUnitAbilityLevel(t, 'Aloc') == 0 then
            set n=GetRandomInt(1,200)
            if n<25 then
                call grom(GetTriggerUnit())
            endif
        endif
    endif
    set t=null
    return false
endfunction



//===========================================================================
function InitTrig_Gromattacked takes nothing returns nothing
    set gg_trg_Gromattacked = CreateTrigger(  )
    call DisableTrigger( gg_trg_Gromattacked)
    call TriggerAddCondition( gg_trg_Gromattacked, Condition( function Trig_Gromattacked_Conditions ) )
    
endfunction
