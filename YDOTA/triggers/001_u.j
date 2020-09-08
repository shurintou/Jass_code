
//===========================================================================
// Trigger: 未命名触发器 001 复制
//===========================================================================
function Trig_001_u_Conditions takes nothing returns boolean
    if ( not ( UnitHasBuffBJ(GetTriggerUnit(), 'B000') == true ) ) then
        return false
    endif
    return true
endfunction

function Trig_001_u_Func005C takes nothing returns boolean
    return true
endfunction

function Trig_001_u_Actions takes nothing returns nothing
    if ( Trig_001_u_Func005C() ) then
        call UnitApplyTimedLifeBJ( 1.50, 'BHwe', GetLastCreatedUnit() )
    else
    endif
    call TriggerSleepAction( 1.00 )
endfunction

//===========================================================================
function InitTrig_001_u takes nothing returns nothing
    set gg_trg_001_u = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_001_u, EVENT_PLAYER_UNIT_ATTACKED )
    call TriggerAddCondition( gg_trg_001_u, Condition( function Trig_001_u_Conditions ) )
    call TriggerAddAction( gg_trg_001_u, function Trig_001_u_Actions )
endfunction
