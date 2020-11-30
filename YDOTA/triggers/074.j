
//===========================================================================
// Trigger: 未命名触发器 074
//===========================================================================
function Trig_074_Conditions takes nothing returns boolean
    if ( not ( GetLearnedSkill() == 'A0BC' ) ) then
        return false
    endif
    return true
endfunction

function Trig_074_Func002C takes nothing returns boolean
    if ( not ( GetUnitAbilityLevelSwapped('A0BC', GetTriggerUnit()) == 1 ) ) then
        return false
    endif
    return true
endfunction

function Trig_074_Func003C takes nothing returns boolean
    if ( not ( GetUnitAbilityLevelSwapped('A0BC', GetTriggerUnit()) == 2 ) ) then
        return false
    endif
    return true
endfunction

function Trig_074_Func004C takes nothing returns boolean
    if ( not ( GetUnitAbilityLevelSwapped('A0BC', GetTriggerUnit()) == 3 ) ) then
        return false
    endif
    return true
endfunction

function Trig_074_Func005C takes nothing returns boolean
    if ( not ( GetUnitAbilityLevelSwapped('A0BC', GetTriggerUnit()) == 4 ) ) then
        return false
    endif
    return true
endfunction

function Trig_074_Actions takes nothing returns nothing
    set udg_xuexingfangyu = GetTriggerUnit()
    if ( Trig_074_Func002C() ) then
        set udg_xuexingcishu = 1
        loop
            exitwhen udg_xuexingcishu > 600
            call PolledWait( 11.00 )
            call UnitRemoveBuffs( udg_xuexingfangyu, false, true )
            set udg_xuexingcishu = udg_xuexingcishu + 1
        endloop
    else
    endif
    if ( Trig_074_Func003C() ) then
        set udg_xuexingcishu = 1
        loop
            exitwhen udg_xuexingcishu > 600
            call PolledWait( 10.00 )
            call UnitRemoveBuffs( udg_xuexingfangyu, false, true )
            set udg_xuexingcishu = udg_xuexingcishu + 1
        endloop
    else
    endif
    if ( Trig_074_Func004C() ) then
        set udg_xuexingcishu = 1
        loop
            exitwhen udg_xuexingcishu > 600
            call PolledWait( 9.00 )
            call UnitRemoveBuffs( udg_xuexingfangyu, false, true )
            set udg_xuexingcishu = udg_xuexingcishu + 1
        endloop
    else
    endif
    if ( Trig_074_Func005C() ) then
        set udg_xuexingcishu = 1
        loop
            exitwhen udg_xuexingcishu > 600
            call PolledWait( 8.00 )
            call UnitRemoveBuffs( udg_xuexingfangyu, false, true )
            set udg_xuexingcishu = udg_xuexingcishu + 1
        endloop
    else
    endif
endfunction

//===========================================================================
function InitTrig_074 takes nothing returns nothing
    set gg_trg_074 = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_074, EVENT_PLAYER_HERO_SKILL )
    call TriggerAddCondition( gg_trg_074, Condition( function Trig_074_Conditions ) )
    call TriggerAddAction( gg_trg_074, function Trig_074_Actions )
endfunction
