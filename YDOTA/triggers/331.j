
//===========================================================================
// Trigger: 未命名触发器 331
//===========================================================================
function Trig_331_Func001001003001 takes nothing returns boolean
    return ( IsUnitAliveBJ(GetEnumUnit()) == true )
endfunction

function Trig_331_Func001001003002 takes nothing returns boolean
    return ( IsUnitEnemy(GetEnumUnit(), GetTriggerPlayer()) == true )
endfunction

function Trig_331_Func001001003 takes nothing returns boolean
    return GetBooleanAnd( Trig_331_Func001001003001(), Trig_331_Func001001003002() )
endfunction

function Trig_331_Func001002 takes nothing returns nothing
    call SetUnitPositionLoc( GetEnumUnit(), udg_jiantaweizhi )
endfunction

function Trig_331_Func002001003001 takes nothing returns boolean
    return ( UnitHasBuffBJ(GetEnumUnit(), 'B00J') == true )
endfunction

function Trig_331_Func002001003002 takes nothing returns boolean
    return ( IsUnitEnemy(GetEnumUnit(), GetTriggerPlayer()) == true )
endfunction

function Trig_331_Func002001003 takes nothing returns boolean
    return GetBooleanAnd( Trig_331_Func002001003001(), Trig_331_Func002001003002() )
endfunction

function Trig_331_Func002A takes nothing returns nothing
endfunction

function Trig_331_Func003001003001 takes nothing returns boolean
    return ( IsUnitType(udg_beijiantadanwei, UNIT_TYPE_STRUCTURE) == false )
endfunction

function Trig_331_Func003001003002 takes nothing returns boolean
    return ( IsUnitEnemy(udg_beijiantadanwei, udg_jiantawanjia) == true )
endfunction

function Trig_331_Func003001003 takes nothing returns boolean
    return GetBooleanAnd( Trig_331_Func003001003001(), Trig_331_Func003001003002() )
endfunction

function Trig_331_Func003002 takes nothing returns nothing
    call SetUnitPositionLoc( GetEnumUnit(), udg_jiantaweizhi )
endfunction

function Trig_331_Actions takes nothing returns nothing
    call ForGroupBJ( GetUnitsInRangeOfLocMatching(512, udg_jiantaweizhi, Condition(function Trig_331_Func001001003)), function Trig_331_Func001002 )
    call ForGroupBJ( GetUnitsInRangeOfLocMatching(512, udg_jiantaweizhi, Condition(function Trig_331_Func002001003)), function Trig_331_Func002A )
    call ForGroupBJ( GetUnitsInRangeOfLocMatching(512, udg_jiantaweizhi, Condition(function Trig_331_Func003001003)), function Trig_331_Func003002 )
    set bj_forLoopBIndex = 1
    set bj_forLoopBIndexEnd = 10
    loop
        exitwhen bj_forLoopBIndex > bj_forLoopBIndexEnd
        set bj_forLoopBIndex = bj_forLoopBIndex + 1
    endloop
endfunction

//===========================================================================
function InitTrig_331 takes nothing returns nothing
    set gg_trg_331 = CreateTrigger(  )
    call TriggerAddAction( gg_trg_331, function Trig_331_Actions )
endfunction
