
//===========================================================================
// Trigger: START
//===========================================================================
function Trig_START_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A00K' ) ) then
        return false
    endif
    return true
endfunction

function Trig_START_Func006001003001 takes nothing returns boolean
    return ( IsUnitAliveBJ(GetFilterUnit()) == true )
endfunction

function Trig_START_Func006001003002 takes nothing returns boolean
    return ( IsUnitAlly(udg_DH, GetOwningPlayer(GetFilterUnit())) == false )
endfunction

function Trig_START_Func006001003 takes nothing returns boolean
    return GetBooleanAnd( Trig_START_Func006001003001(), Trig_START_Func006001003002() )
endfunction

function Trig_START_Func006A takes nothing returns nothing
    call UnitRemoveBuffBJ( 'Bmlc', GetEnumUnit() )
    call GroupAddUnitSimple( GetEnumUnit(), udg_nongminzu )
    call CreateNUnitsAtLoc( 1, 'e008', GetOwningPlayer(GetTriggerUnit()), GetUnitLoc(GetTriggerUnit()), bj_UNIT_FACING )
    call ShowUnitHide( GetLastCreatedUnit() )
    call GroupAddUnitSimple( GetLastCreatedUnit(), udg_xiaojinglingzu )
    call IssueTargetOrder( GetLastCreatedUnit(), "magicleash", GetEnumUnit() )
    call SetUnitPathing( GetEnumUnit(), false )
endfunction

function Trig_START_Actions takes nothing returns nothing
    set udg_DH = GetTriggerUnit()
    call TerrainDeformationRippleBJ( 20.00, false, GetUnitLoc(GetTriggerUnit()), 512.00, 512.00, 150.00, 1, 256.00 )
    set udg_bo_wen = GetLastCreatedTerrainDeformation()
    call ForGroupBJ( GetUnitsInRangeOfLocMatching(400.00, GetUnitLoc(udg_DH), Condition(function Trig_START_Func006001003)), function Trig_START_Func006A )
    call EnableTrigger( gg_trg_GO_AROUND )
endfunction

//===========================================================================
function InitTrig_START takes nothing returns nothing
    set gg_trg_START = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_START, EVENT_PLAYER_UNIT_SPELL_CAST )
    call TriggerAddCondition( gg_trg_START, Condition( function Trig_START_Conditions ) )
    call TriggerAddAction( gg_trg_START, function Trig_START_Actions )
endfunction
