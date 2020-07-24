
//===========================================================================
// Trigger: 未命名触发器 029
//===========================================================================
function Trig_029_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A0B1' ) ) then
        return false
    endif
    return true
endfunction

function Trig_029_Func003Func001A takes nothing returns nothing
    call UnitAddAbilityBJ( 'A0AZ', GetEnumUnit() )
    call IssuePointOrderLoc( GetEnumUnit(), "selfdestruct", GetUnitLoc(GetEnumUnit()) )
endfunction

function Trig_029_Func003Func002A takes nothing returns nothing
    call UnitAddAbilityBJ( 'A0AZ', GetEnumUnit() )
    call IssuePointOrderLoc( GetEnumUnit(), "selfdestruct", GetUnitLoc(GetEnumUnit()) )
endfunction

function Trig_029_Func003Func003A takes nothing returns nothing
    call UnitAddAbilityBJ( 'A0AZ', GetEnumUnit() )
    call IssuePointOrderLoc( GetEnumUnit(), "selfdestruct", GetUnitLoc(GetEnumUnit()) )
endfunction

function Trig_029_Func003C takes nothing returns boolean
    if ( not ( GetUnitAbilityLevelSwapped('A0AY', GetTriggerUnit()) == 1 ) ) then
        return false
    endif
    return true
endfunction

function Trig_029_Actions takes nothing returns nothing
    set udg_zhadan2danweizu = GetUnitsOfTypeIdAll('n02X')
    set udg_zhadan1danweizu = GetUnitsOfTypeIdAll('n02W')
    if ( Trig_029_Func003C() ) then
        call ForGroupBJ( udg_zhadan1danweizu, function Trig_029_Func003Func003A )
    else
        call ForGroupBJ( udg_zhadan1danweizu, function Trig_029_Func003Func001A )
        call ForGroupBJ( udg_zhadan2danweizu, function Trig_029_Func003Func002A )
    endif
    call PolledWait( 4.00 )
    call RemoveLocation( GetUnitLoc(GetEnumUnit()) )
    call DestroyGroup( udg_zhadan1danweizu )
    call DestroyGroup( udg_zhadan2danweizu )
endfunction

//===========================================================================
function InitTrig_029 takes nothing returns nothing
    set gg_trg_029 = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_029, EVENT_PLAYER_UNIT_SPELL_CAST )
    call TriggerAddCondition( gg_trg_029, Condition( function Trig_029_Conditions ) )
    call TriggerAddAction( gg_trg_029, function Trig_029_Actions )
endfunction
