
//===========================================================================
// Trigger: 未命名触发器 329
//===========================================================================
function Trig_329_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A08I' ) ) then
        return false
    endif
    return true
endfunction

function Trig_329_Func001002003001 takes nothing returns boolean
    return ( IsUnitType(udg_beijiantadanwei, UNIT_TYPE_STRUCTURE) == false )
endfunction

function Trig_329_Func001002003002 takes nothing returns boolean
    return ( IsUnitEnemy(udg_beijiantadanwei, udg_jiantawanjia) == true )
endfunction

function Trig_329_Func001002003 takes nothing returns boolean
    return GetBooleanAnd( Trig_329_Func001002003001(), Trig_329_Func001002003002() )
endfunction

function Trig_329_Func015001003001001 takes nothing returns boolean
    return ( IsUnitType(GetFilterUnit(), UNIT_TYPE_STRUCTURE) == false )
endfunction

function Trig_329_Func015001003001002 takes nothing returns boolean
    return ( IsUnitAliveBJ(GetFilterUnit()) == true )
endfunction

function Trig_329_Func015001003001 takes nothing returns boolean
    return GetBooleanAnd( Trig_329_Func015001003001001(), Trig_329_Func015001003001002() )
endfunction

function Trig_329_Func015001003002 takes nothing returns boolean
    return ( IsUnitEnemy(GetFilterUnit(), GetTriggerPlayer()) == true )
endfunction

function Trig_329_Func015001003 takes nothing returns boolean
    return GetBooleanAnd( Trig_329_Func015001003001(), Trig_329_Func015001003002() )
endfunction

function Trig_329_Func015002 takes nothing returns nothing
    call SetUnitPositionLoc( GetEnumUnit(), udg_jiantaweizhi )
endfunction

function Trig_329_Actions takes nothing returns nothing
    set udg_jiantadanweizu = GetUnitsInRangeOfLocMatching(512, udg_jiantaweizhi, Condition(function Trig_329_Func001002003))
    set udg_jiantatexiao = GetLastCreatedEffectBJ()
    set udg_zhendong = String2OrderIdBJ("shakebody")
    set udg_beijiantadanwei = GetEnumUnit()
    set udg_jiantachufadanweiweizhi = GetUnitLoc(GetTriggerUnit())
    set udg_jiantashanghai = GetLastCreatedUnit()
    set udg_jiantawanjia = GetTriggerPlayer()
    set udg_jiantaweizhi = GetSpellTargetLoc()
    set udg_EEEE = GetTriggerUnit()
    call UnitApplyTimedLifeBJ( 20.00, 'BHwe', udg_jiantashanghai )
    call TriggerSleepAction( 1.00 )
    call SetUnitAnimation( udg_EEEE, "slam" )
    call AddSpecialEffectLocBJ( udg_jiantachufadanweiweizhi, "Abilities\\Spells\\NightElf\\Blink\\BlinkTarget.mdl" )
    call TriggerSleepAction( 0.40 )
    call ForGroupBJ( GetUnitsInRangeOfLocMatching(512, udg_jiantaweizhi, Condition(function Trig_329_Func015001003)), function Trig_329_Func015002 )
    call SetUnitPositionLoc( udg_EEEE, udg_jiantaweizhi )
    call IssueImmediateOrder( udg_jiantashanghai, "whirlwind" )
    call TriggerSleepAction( 20.00 )
    call RemoveLocation( udg_jiantaweizhi )
    call RemoveLocation( udg_jiantachufadanweiweizhi )
    call DestroyEffect( udg_jiantatexiao )
    call DestroyGroup( udg_jiantadanweizu )
endfunction

//===========================================================================
function InitTrig_329 takes nothing returns nothing
    set gg_trg_329 = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_329, EVENT_PLAYER_UNIT_SPELL_CAST )
    call TriggerAddCondition( gg_trg_329, Condition( function Trig_329_Conditions ) )
    call TriggerAddAction( gg_trg_329, function Trig_329_Actions )
endfunction
