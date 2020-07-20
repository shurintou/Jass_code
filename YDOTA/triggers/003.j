
//===========================================================================
// Trigger: 未命名触发器 003
//===========================================================================
function Trig_003_Func013C takes nothing returns boolean
    if ( ( GetUnitTypeId(GetTriggerUnit()) == 'H004' ) ) then
        return true
    endif
    if ( ( GetUnitTypeId(GetTriggerUnit()) == 'H002' ) ) then
        return true
    endif
    if ( ( GetUnitTypeId(GetTriggerUnit()) == 'H00L' ) ) then
        return true
    endif
    return false
endfunction

function Trig_003_Conditions takes nothing returns boolean
    if ( not ( UnitHasBuffBJ(GetTriggerUnit(), 'B01H') == true ) ) then
        return false
    endif
    if ( not Trig_003_Func013C() ) then
        return false
    endif
    return true
endfunction

function Trig_003_Func008Func002C takes nothing returns boolean
    if ( not ( udg_xiongbeigongjicishu == 1 ) ) then
        return false
    endif
    return true
endfunction

function Trig_003_Func008Func003C takes nothing returns boolean
    if ( not ( GetUnitAbilityLevelSwapped('A09J', GetTriggerUnit()) == 1 ) ) then
        return false
    endif
    if ( not ( udg_xiongzhanshixueliang < 30.00 ) ) then
        return false
    endif
    return true
endfunction

function Trig_003_Func008C takes nothing returns boolean
    if ( not Trig_003_Func008Func003C() ) then
        return false
    endif
    return true
endfunction

function Trig_003_Func009Func002C takes nothing returns boolean
    if ( not ( udg_xiongbeigongjicishu == 1 ) ) then
        return false
    endif
    if ( not ( udg_xiongbeigongjicishu == 2 ) ) then
        return false
    endif
    if ( not ( udg_xiongbeigongjicishu == 3 ) ) then
        return false
    endif
    if ( not ( udg_xiongbeigongjicishu == 4 ) ) then
        return false
    endif
    return true
endfunction

function Trig_003_Func009Func003C takes nothing returns boolean
    if ( not ( GetUnitAbilityLevelSwapped('A09J', GetTriggerUnit()) == 4 ) ) then
        return false
    endif
    if ( not ( udg_xiongzhanshixueliang < 35.00 ) ) then
        return false
    endif
    return true
endfunction

function Trig_003_Func009C takes nothing returns boolean
    if ( not Trig_003_Func009Func003C() ) then
        return false
    endif
    return true
endfunction

function Trig_003_Func010Func002Func001C takes nothing returns boolean
    if ( ( udg_xiongbeigongjicishu == 1 ) ) then
        return true
    endif
    if ( ( udg_xiongbeigongjicishu == 2 ) ) then
        return true
    endif
    if ( ( udg_xiongbeigongjicishu == 3 ) ) then
        return true
    endif
    return false
endfunction

function Trig_003_Func010Func002C takes nothing returns boolean
    if ( not Trig_003_Func010Func002Func001C() ) then
        return false
    endif
    return true
endfunction

function Trig_003_Func010Func003C takes nothing returns boolean
    if ( not ( GetUnitAbilityLevelSwapped('A09J', GetTriggerUnit()) == 3 ) ) then
        return false
    endif
    if ( not ( udg_xiongzhanshixueliang < 35.00 ) ) then
        return false
    endif
    return true
endfunction

function Trig_003_Func010C takes nothing returns boolean
    if ( not Trig_003_Func010Func003C() ) then
        return false
    endif
    return true
endfunction

function Trig_003_Func011Func003Func001C takes nothing returns boolean
    if ( ( udg_xiongbeigongjicishu == 1 ) ) then
        return true
    endif
    if ( ( udg_xiongbeigongjicishu == 2 ) ) then
        return true
    endif
    return false
endfunction

function Trig_003_Func011Func003C takes nothing returns boolean
    if ( not Trig_003_Func011Func003Func001C() ) then
        return false
    endif
    return true
endfunction

function Trig_003_Func011Func004C takes nothing returns boolean
    if ( not ( GetUnitAbilityLevelSwapped('A09J', GetTriggerUnit()) == 2 ) ) then
        return false
    endif
    if ( not ( udg_xiongzhanshixueliang < 30.00 ) ) then
        return false
    endif
    return true
endfunction

function Trig_003_Func011C takes nothing returns boolean
    if ( not Trig_003_Func011Func004C() ) then
        return false
    endif
    return true
endfunction

function Trig_003_Actions takes nothing returns nothing
    set udg_xiongdanwei = GetLastCreatedUnit()
    set udg_xiongdidian = GetUnitLoc(GetTriggerUnit())
    set udg_xongwanjia = GetTriggerPlayer()
    set udg_xiong = GetTriggerUnit()
    set udg_xiongbeigongjicishu = GetRandomInt(1, 10)
    set udg_gongjixiongdanwei = GetAttacker()
    set udg_xiongzhanshixueliang = GetUnitLifePercent(GetTriggerUnit())
    if ( Trig_003_Func008C() ) then
        call UnitDamageTargetBJ( GetTriggerUnit(), udg_gongjixiongdanwei, ( GetUnitStateSwap(UNIT_STATE_MAX_LIFE, GetTriggerUnit()) * 0.15 ), ATTACK_TYPE_CHAOS, DAMAGE_TYPE_NORMAL )
        if ( Trig_003_Func008Func002C() ) then
            call UnitResetCooldown( udg_xiong )
        else
        endif
    else
    endif
    if ( Trig_003_Func009C() ) then
        call UnitDamageTargetBJ( GetTriggerUnit(), udg_gongjixiongdanwei, ( GetUnitStateSwap(UNIT_STATE_MAX_LIFE, GetTriggerUnit()) * 0.36 ), ATTACK_TYPE_CHAOS, DAMAGE_TYPE_NORMAL )
        if ( Trig_003_Func009Func002C() ) then
            call UnitResetCooldown( udg_xiong )
        else
        endif
    else
    endif
    if ( Trig_003_Func010C() ) then
        call UnitDamageTargetBJ( GetTriggerUnit(), udg_gongjixiongdanwei, ( GetUnitStateSwap(UNIT_STATE_MAX_LIFE, GetTriggerUnit()) * 0.29 ), ATTACK_TYPE_CHAOS, DAMAGE_TYPE_NORMAL )
        if ( Trig_003_Func010Func002C() ) then
            call UnitResetCooldown( udg_xiong )
        else
        endif
    else
    endif
    if ( Trig_003_Func011C() ) then
        call CreateNUnitsAtLocFacingLocBJ( 1, 'n02G', udg_xongwanjia, udg_xiongdidian, GetRectCenter(GetPlayableMapRect()) )
        call UnitDamageTargetBJ( udg_xiongdanwei, udg_gongjixiongdanwei, ( GetUnitStateSwap(UNIT_STATE_MAX_LIFE, udg_xiong) * 0.22 ), ATTACK_TYPE_CHAOS, DAMAGE_TYPE_NORMAL )
        if ( Trig_003_Func011Func003C() ) then
            call UnitResetCooldown( udg_xiong )
        else
        endif
    else
    endif
endfunction

//===========================================================================
function InitTrig_003 takes nothing returns nothing
    set gg_trg_003 = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_003, EVENT_PLAYER_UNIT_ATTACKED )
    call TriggerAddCondition( gg_trg_003, Condition( function Trig_003_Conditions ) )
    call TriggerAddAction( gg_trg_003, function Trig_003_Actions )
endfunction
