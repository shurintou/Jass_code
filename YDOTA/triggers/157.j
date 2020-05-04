
//===========================================================================
// Trigger: 未命名触发器 157
//===========================================================================
function Trig_157_Func002C takes nothing returns boolean
    if ( ( GetOwningPlayer(GetKillingUnitBJ()) == Player(0) ) ) then
        return true
    endif
    if ( ( GetOwningPlayer(GetKillingUnitBJ()) == Player(1) ) ) then
        return true
    endif
    if ( ( GetOwningPlayer(GetKillingUnitBJ()) == Player(2) ) ) then
        return true
    endif
    if ( ( GetOwningPlayer(GetKillingUnitBJ()) == Player(3) ) ) then
        return true
    endif
    if ( ( GetOwningPlayer(GetKillingUnitBJ()) == Player(4) ) ) then
        return true
    endif
    return false
endfunction

function Trig_157_Func003C takes nothing returns boolean
    if ( ( GetOwningPlayer(GetDyingUnit()) == Player(5) ) ) then
        return true
    endif
    if ( ( GetOwningPlayer(GetDyingUnit()) == Player(6) ) ) then
        return true
    endif
    if ( ( GetOwningPlayer(GetDyingUnit()) == Player(7) ) ) then
        return true
    endif
    if ( ( GetOwningPlayer(GetDyingUnit()) == Player(8) ) ) then
        return true
    endif
    if ( ( GetOwningPlayer(GetDyingUnit()) == Player(9) ) ) then
        return true
    endif
    return false
endfunction

function Trig_157_Conditions takes nothing returns boolean
    if ( not ( IsUnitType(GetDyingUnit(), UNIT_TYPE_HERO) == true ) ) then
        return false
    endif
    if ( not Trig_157_Func002C() ) then
        return false
    endif
    if ( not Trig_157_Func003C() ) then
        return false
    endif
    return true
endfunction

function Trig_157_Actions takes nothing returns nothing
    set udg_Tianzaisharenshu = ( udg_Tianzaisharenshu - 1 )
endfunction

//===========================================================================
function InitTrig_157 takes nothing returns nothing
    set gg_trg_157 = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_157, EVENT_PLAYER_UNIT_DEATH )
    call TriggerAddCondition( gg_trg_157, Condition( function Trig_157_Conditions ) )
    call TriggerAddAction( gg_trg_157, function Trig_157_Actions )
endfunction
