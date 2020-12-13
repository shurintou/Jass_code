
//===========================================================================
// Trigger: 未命名触发器 032
//===========================================================================
function Trig_032_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A04H' ) ) then
        return false
    endif
    return true
endfunction

function Trig_032_Func001002003001 takes nothing returns boolean
    return ( IsUnitEnemy(GetFilterUnit(), GetTriggerPlayer()) == true )
endfunction

function Trig_032_Func001002003002 takes nothing returns boolean
    return ( IsUnitType(GetFilterUnit(), UNIT_TYPE_STRUCTURE) == false )
endfunction

function Trig_032_Func001002003 takes nothing returns boolean
    return GetBooleanAnd( Trig_032_Func001002003001(), Trig_032_Func001002003002() )
endfunction

function Trig_032_Func002Func001Func001Func006A takes nothing returns nothing
    set udg_daofengxuanqudian = GetUnitLoc(GetEnumUnit())
    set udg_daofengdian = GetUnitLoc(GetTriggerUnit())
    call UnitDamageTargetBJ( GetTriggerUnit(), GetEnumUnit(), ( DistanceBetweenPoints(udg_daofengdian, udg_daofengxuanqudian) * 0.05 ), ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC )
    call PolledWait( 3.00 )
    call RemoveLocation( udg_daofengdian )
    call RemoveLocation( udg_daofengxuanqudian )
    call DestroyGroup( udg_daofengdanweizu )
endfunction

function Trig_032_Func002Func001Func001C takes nothing returns boolean
    if ( not ( DistanceBetweenPoints(udg_daofengdian, udg_daofengxuanqudian) < 4000.00 ) ) then
        return false
    endif
    return true
endfunction

function Trig_032_Func002C takes nothing returns boolean
    if ( not ( GetUnitAbilityLevelSwapped('A04H', GetTriggerUnit()) == 1 ) ) then
        return false
    endif
    return true
endfunction

function Trig_032_Func003Func001Func001Func006A takes nothing returns nothing
    set udg_daofengxuanqudian = GetUnitLoc(GetEnumUnit())
    set udg_daofengdian = GetUnitLoc(GetTriggerUnit())
    call UnitDamageTargetBJ( GetTriggerUnit(), GetEnumUnit(), ( DistanceBetweenPoints(udg_daofengdian, udg_daofengxuanqudian) * 0.15 ), ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC )
    call PolledWait( 3.00 )
    call RemoveLocation( udg_daofengdian )
    call RemoveLocation( udg_daofengxuanqudian )
    call DestroyGroup( udg_daofengdanweizu )
endfunction

function Trig_032_Func003Func001Func001C takes nothing returns boolean
    if ( not ( DistanceBetweenPoints(udg_daofengdian, udg_daofengxuanqudian) < 4000.00 ) ) then
        return false
    endif
    return true
endfunction

function Trig_032_Func003C takes nothing returns boolean
    if ( not ( GetUnitAbilityLevelSwapped('A04H', GetTriggerUnit()) == 2 ) ) then
        return false
    endif
    return true
endfunction

function Trig_032_Func004Func001Func001Func006A takes nothing returns nothing
    set udg_daofengxuanqudian = GetUnitLoc(GetEnumUnit())
    set udg_daofengdian = GetUnitLoc(GetTriggerUnit())
    call UnitDamageTargetBJ( GetTriggerUnit(), GetEnumUnit(), ( DistanceBetweenPoints(udg_daofengdian, udg_daofengxuanqudian) * 0.25 ), ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC )
    call PolledWait( 3.00 )
    call RemoveLocation( udg_daofengdian )
    call RemoveLocation( udg_daofengxuanqudian )
    call DestroyGroup( udg_daofengdanweizu )
endfunction

function Trig_032_Func004Func001Func001C takes nothing returns boolean
    if ( not ( DistanceBetweenPoints(udg_daofengdian, udg_daofengxuanqudian) < 4000.00 ) ) then
        return false
    endif
    return true
endfunction

function Trig_032_Func004C takes nothing returns boolean
    if ( not ( GetUnitAbilityLevelSwapped('A04H', GetTriggerUnit()) == 3 ) ) then
        return false
    endif
    return true
endfunction

function Trig_032_Func005Func001Func001Func006A takes nothing returns nothing
    set udg_daofengxuanqudian = GetUnitLoc(GetEnumUnit())
    set udg_daofengdian = GetUnitLoc(GetTriggerUnit())
    call UnitDamageTargetBJ( GetTriggerUnit(), GetEnumUnit(), ( DistanceBetweenPoints(udg_daofengdian, udg_daofengxuanqudian) * 0.35 ), ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC )
    call PolledWait( 3.00 )
    call RemoveLocation( udg_daofengdian )
    call RemoveLocation( udg_daofengxuanqudian )
    call DestroyGroup( udg_daofengdanweizu )
endfunction

function Trig_032_Func005Func001Func001C takes nothing returns boolean
    if ( not ( DistanceBetweenPoints(udg_daofengdian, udg_daofengxuanqudian) < 4000.00 ) ) then
        return false
    endif
    return true
endfunction

function Trig_032_Func005C takes nothing returns boolean
    if ( not ( GetUnitAbilityLevelSwapped('A04H', GetTriggerUnit()) == 4 ) ) then
        return false
    endif
    return true
endfunction

function Trig_032_Actions takes nothing returns nothing
    set udg_daofengdanweizu = GetUnitsInRangeOfLocMatching(400.00, GetUnitLoc(GetTriggerUnit()), Condition(function Trig_032_Func001002003))
    if ( Trig_032_Func002C() ) then
        set udg_daofengcishu = 1
        loop
            exitwhen udg_daofengcishu > 4
            if ( Trig_032_Func002Func001Func001C() ) then
                call TriggerSleepAction( 1.00 )
                call GroupRemoveUnitSimple( GetTriggerUnit(), udg_daofengdanweizu )
                call ForGroupBJ( udg_daofengdanweizu, function Trig_032_Func002Func001Func001Func006A )
            else
                call RemoveLocation( udg_daofengdian )
                call RemoveLocation( udg_daofengxuanqudian )
                call DestroyGroup( udg_daofengdanweizu )
            endif
            set udg_daofengcishu = udg_daofengcishu + 1
        endloop
    else
    endif
    if ( Trig_032_Func003C() ) then
        set udg_daofengcishu = 1
        loop
            exitwhen udg_daofengcishu > 4
            if ( Trig_032_Func003Func001Func001C() ) then
                call TriggerSleepAction( 1.00 )
                call GroupRemoveUnitSimple( GetTriggerUnit(), udg_daofengdanweizu )
                call ForGroupBJ( udg_daofengdanweizu, function Trig_032_Func003Func001Func001Func006A )
            else
                call RemoveLocation( udg_daofengdian )
                call RemoveLocation( udg_daofengxuanqudian )
                call DestroyGroup( udg_daofengdanweizu )
            endif
            set udg_daofengcishu = udg_daofengcishu + 1
        endloop
    else
    endif
    if ( Trig_032_Func004C() ) then
        set udg_daofengcishu = 1
        loop
            exitwhen udg_daofengcishu > 4
            if ( Trig_032_Func004Func001Func001C() ) then
                call TriggerSleepAction( 1.00 )
                call GroupRemoveUnitSimple( GetTriggerUnit(), udg_daofengdanweizu )
                call ForGroupBJ( udg_daofengdanweizu, function Trig_032_Func004Func001Func001Func006A )
            else
                call RemoveLocation( udg_daofengdian )
                call RemoveLocation( udg_daofengxuanqudian )
                call DestroyGroup( udg_daofengdanweizu )
            endif
            set udg_daofengcishu = udg_daofengcishu + 1
        endloop
    else
    endif
    if ( Trig_032_Func005C() ) then
        set udg_daofengcishu = 1
        loop
            exitwhen udg_daofengcishu > 4
            if ( Trig_032_Func005Func001Func001C() ) then
                call TriggerSleepAction( 1.00 )
                call GroupRemoveUnitSimple( GetTriggerUnit(), udg_daofengdanweizu )
                call ForGroupBJ( udg_daofengdanweizu, function Trig_032_Func005Func001Func001Func006A )
            else
                call RemoveLocation( udg_daofengdian )
                call RemoveLocation( udg_daofengxuanqudian )
                call DestroyGroup( udg_daofengdanweizu )
            endif
            set udg_daofengcishu = udg_daofengcishu + 1
        endloop
    else
    endif
endfunction

//===========================================================================
function InitTrig_032 takes nothing returns nothing
    set gg_trg_032 = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_032, EVENT_PLAYER_UNIT_SPELL_CAST )
    call TriggerAddCondition( gg_trg_032, Condition( function Trig_032_Conditions ) )
    call TriggerAddAction( gg_trg_032, function Trig_032_Actions )
endfunction
