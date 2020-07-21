
//===========================================================================
// Trigger: 未命名触发器 039
//===========================================================================
function Trig_039_Conditions takes nothing returns boolean
    if ( not ( GetLearnedSkill() == 'A01Z' ) ) then
        return false
    endif
    return true
endfunction

function Trig_039_Func001Func001Func002A takes nothing returns nothing
    call UnitDamageTargetBJ( GetTriggerUnit(), GetEnumUnit(), ( GetUnitStateSwap(UNIT_STATE_MAX_LIFE, GetEnumUnit()) * 0.06 ), ATTACK_TYPE_HERO, DAMAGE_TYPE_MAGIC )
    call DestroyGroup( udg_tongkudanweizu )
    call RemoveLocation( udg_tongkuweizhi )
endfunction

function Trig_039_Func001Func002Func003002003001 takes nothing returns boolean
    return ( IsUnitType(GetFilterUnit(), UNIT_TYPE_STRUCTURE) == false )
endfunction

function Trig_039_Func001Func002Func003002003002 takes nothing returns boolean
    return ( IsUnitEnemy(GetFilterUnit(), udg_tongkuwanjia) == true )
endfunction

function Trig_039_Func001Func002Func003002003 takes nothing returns boolean
    return GetBooleanAnd( Trig_039_Func001Func002Func003002003001(), Trig_039_Func001Func002Func003002003002() )
endfunction

function Trig_039_Func001Func002Func005A takes nothing returns nothing
    call UnitDamageTargetBJ( GetTriggerUnit(), GetEnumUnit(), ( GetUnitStateSwap(UNIT_STATE_MAX_LIFE, GetEnumUnit()) * 0.03 ), ATTACK_TYPE_HERO, DAMAGE_TYPE_MAGIC )
    call DestroyGroup( udg_tongkudanweizu )
    call RemoveLocation( udg_tongkuweizhi )
endfunction

function Trig_039_Func001C takes nothing returns boolean
    if ( not ( GetUnitAbilityLevelSwapped('A01Z', GetTriggerUnit()) == 1 ) ) then
        return false
    endif
    return true
endfunction

function Trig_039_Actions takes nothing returns nothing
    if ( Trig_039_Func001C() ) then
        set udg_tongkucishu = 1
        loop
            exitwhen udg_tongkucishu > 99999
            set udg_tongkuweizhi = GetUnitLoc(GetTriggerUnit())
            set udg_tongkuwanjia = GetTriggerPlayer()
            set udg_tongkudanweizu = GetUnitsInRangeOfLocMatching(600.00, udg_tongkuweizhi, Condition(function Trig_039_Func001Func002Func003002003))
            call PolledWait( 1.00 )
            call ForGroupBJ( udg_tongkudanweizu, function Trig_039_Func001Func002Func005A )
            set udg_tongkucishu = udg_tongkucishu + 1
        endloop
    else
        set udg_tongkucishu = 1
        loop
            exitwhen udg_tongkucishu > 99999
            call PolledWait( 1.00 )
            call ForGroupBJ( udg_tongkudanweizu, function Trig_039_Func001Func001Func002A )
            set udg_tongkucishu = udg_tongkucishu + 1
        endloop
    endif
endfunction

//===========================================================================
function InitTrig_039 takes nothing returns nothing
    set gg_trg_039 = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_039, EVENT_PLAYER_HERO_SKILL )
    call TriggerAddCondition( gg_trg_039, Condition( function Trig_039_Conditions ) )
    call TriggerAddAction( gg_trg_039, function Trig_039_Actions )
endfunction
