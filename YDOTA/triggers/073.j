
//===========================================================================
// Trigger: 未命名触发器 073
//===========================================================================
function Trig_073_Func002C takes nothing returns boolean
    if ( ( UnitHasBuffBJ(GetTriggerUnit(), 'BNmr') == true ) ) then
        return true
    endif
    if ( ( UnitHasBuffBJ(GetTriggerUnit(), 'B01K') == true ) ) then
        return true
    endif
    if ( ( UnitHasBuffBJ(GetTriggerUnit(), 'B01L') == true ) ) then
        return true
    endif
    if ( ( UnitHasBuffBJ(GetTriggerUnit(), 'B01M') == true ) ) then
        return true
    endif
    return false
endfunction

function Trig_073_Conditions takes nothing returns boolean
    if ( not ( GetUnitTypeId(GetAttacker()) == 'H003' ) ) then
        return false
    endif
    if ( not Trig_073_Func002C() ) then
        return false
    endif
    return true
endfunction

function Trig_073_Func004C takes nothing returns boolean
    if ( not ( udg_xinlinggongjicishu <= 10 ) ) then
        return false
    endif
    if ( not ( UnitHasBuffBJ(GetTriggerUnit(), 'BNmr') == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_073_Func005C takes nothing returns boolean
    if ( not ( udg_xinlinggongjicishu <= 16 ) ) then
        return false
    endif
    if ( not ( UnitHasBuffBJ(GetTriggerUnit(), 'B01L') == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_073_Func006C takes nothing returns boolean
    if ( not ( udg_xinlinggongjicishu <= 13 ) ) then
        return false
    endif
    if ( not ( UnitHasBuffBJ(GetTriggerUnit(), 'B01K') == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_073_Func007Func002C takes nothing returns boolean
    if ( not ( udg_xinlinggongjicishu <= 5 ) ) then
        return false
    endif
    return true
endfunction

function Trig_073_Func007C takes nothing returns boolean
    if ( not ( udg_xinlinggongjicishu <= 20 ) ) then
        return false
    endif
    if ( not ( UnitHasBuffBJ(GetTriggerUnit(), 'B01M') == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_073_Actions takes nothing returns nothing
    set udg_xinlinggongjicishu = GetRandomInt(1, 100)
    if ( Trig_073_Func004C() ) then
        call UnitDamageTargetBJ( GetAttacker(), GetAttackedUnitBJ(), ( I2R(GetHeroStatBJ(bj_HEROSTAT_INT, GetAttacker(), true)) * 2.50 ), ATTACK_TYPE_MELEE, DAMAGE_TYPE_DIVINE )
    else
    endif
    if ( Trig_073_Func005C() ) then
        call UnitDamageTargetBJ( GetAttacker(), GetAttackedUnitBJ(), ( I2R(GetHeroStatBJ(bj_HEROSTAT_INT, GetAttacker(), true)) * 3.50 ), ATTACK_TYPE_MELEE, DAMAGE_TYPE_DIVINE )
    else
    endif
    if ( Trig_073_Func006C() ) then
        call UnitDamageTargetBJ( GetAttacker(), GetAttackedUnitBJ(), ( I2R(GetHeroStatBJ(bj_HEROSTAT_INT, GetAttacker(), true)) * 3.00 ), ATTACK_TYPE_MELEE, DAMAGE_TYPE_DIVINE )
    else
    endif
    if ( Trig_073_Func007C() ) then
        call UnitDamageTargetBJ( GetAttacker(), GetAttackedUnitBJ(), ( I2R(GetHeroStatBJ(bj_HEROSTAT_INT, GetAttacker(), true)) * 4.00 ), ATTACK_TYPE_MELEE, DAMAGE_TYPE_DIVINE )
        if ( Trig_073_Func007Func002C() ) then
            call UnitResetCooldown( GetAttacker() )
        else
        endif
    else
    endif
endfunction

//===========================================================================
function InitTrig_073 takes nothing returns nothing
    set gg_trg_073 = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_073, EVENT_PLAYER_UNIT_ATTACKED )
    call TriggerAddCondition( gg_trg_073, Condition( function Trig_073_Conditions ) )
    call TriggerAddAction( gg_trg_073, function Trig_073_Actions )
endfunction
