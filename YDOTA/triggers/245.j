
//===========================================================================
// Trigger: 未命名触发器 245
//===========================================================================
function Trig_245_Func003C takes nothing returns boolean
    if ( ( GetOwningPlayer(GetDyingUnit()) == Player(0) ) ) then
        return true
    endif
    if ( ( GetOwningPlayer(GetDyingUnit()) == Player(1) ) ) then
        return true
    endif
    if ( ( GetOwningPlayer(GetDyingUnit()) == Player(2) ) ) then
        return true
    endif
    if ( ( GetOwningPlayer(GetDyingUnit()) == Player(3) ) ) then
        return true
    endif
    if ( ( GetOwningPlayer(GetDyingUnit()) == Player(4) ) ) then
        return true
    endif
    return false
endfunction

function Trig_245_Func004C takes nothing returns boolean
    if ( ( GetOwningPlayer(GetKillingUnitBJ()) == Player(5) ) ) then
        return true
    endif
    if ( ( GetOwningPlayer(GetKillingUnitBJ()) == Player(6) ) ) then
        return true
    endif
    if ( ( GetOwningPlayer(GetKillingUnitBJ()) == Player(7) ) ) then
        return true
    endif
    if ( ( GetOwningPlayer(GetKillingUnitBJ()) == Player(8) ) ) then
        return true
    endif
    if ( ( GetOwningPlayer(GetKillingUnitBJ()) == Player(9) ) ) then
        return true
    endif
    return false
endfunction

function Trig_245_Conditions takes nothing returns boolean
    if ( not ( IsUnitType(GetDyingUnit(), UNIT_TYPE_HERO) == true ) ) then
        return false
    endif
    if ( not Trig_245_Func003C() ) then
        return false
    endif
    if ( not Trig_245_Func004C() ) then
        return false
    endif
    return true
endfunction

function Trig_245_Actions takes nothing returns nothing
    set udg_Shenglingsharenshu = ( udg_Shenglingsharenshu - 1 )
endfunction

//===========================================================================
function InitTrig_245 takes nothing returns nothing
    set gg_trg_245 = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_245, EVENT_PLAYER_UNIT_DEATH )
    call TriggerAddCondition( gg_trg_245, Condition( function Trig_245_Conditions ) )
    call TriggerAddAction( gg_trg_245, function Trig_245_Actions )
endfunction
