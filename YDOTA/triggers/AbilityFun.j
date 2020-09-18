
//===========================================================================
// Trigger: AbilityFun
//===========================================================================
function AbilityIfA takes nothing returns boolean
    return IsUnitHiddenBJ(GetFilterUnit()) == false and IsUnitType(GetFilterUnit(), UNIT_TYPE_STRUCTURE) == false and IsPlayerEnemy(GetOwningPlayer(GetFilterUnit()), GetOwningPlayer(GetTriggerUnit())) == true and GetFilterUnit() != GetSpellTargetUnit()
endfunction

function AbilityIfB takes nothing returns boolean
    return IsUnitHiddenBJ(GetFilterUnit()) == false and IsUnitType(GetFilterUnit(), UNIT_TYPE_STRUCTURE) == false and IsPlayerEnemy(GetOwningPlayer(GetFilterUnit()), GetOwningPlayer(GetTriggerUnit())) == false and GetFilterUnit() != GetSpellTargetUnit()
endfunction

function Ability takes nothing returns nothing
    local location l = GetUnitLoc(GetTriggerUnit())
//下边这一行的'e000'是辅助单位的代码,创造一个和我一样的辅助单位,然后按Ctrl+D查看代码在下边更换掉就OK了
    call CreateNUnitsAtLoc( 1, 'e009', GetOwningPlayer(GetTriggerUnit()), l, bj_UNIT_FACING )
    call UnitAddAbility( bj_lastCreatedUnit, GetSpellAbilityId() )
    call SetUnitAbilityLevel( bj_lastCreatedUnit, GetSpellAbilityId(), GetUnitAbilityLevel(GetTriggerUnit(), GetSpellAbilityId()) )
    call UnitApplyTimedLife( bj_lastCreatedUnit, 'BHwe', 3.00 )
    call IssueTargetOrder( bj_lastCreatedUnit, OrderId2StringBJ(GetUnitCurrentOrder(GetTriggerUnit())), GetEnumUnit() )
    call RemoveLocation(l)
    set l = null
endfunction

function AbilityGo_Diren takes nothing returns nothing
    local location l = GetUnitLoc(GetSpellTargetUnit())
    set bj_wantDestroyGroup = true
    call ForGroupBJ( GetUnitsInRangeOfLocMatching(300, l, Condition(function AbilityIfA)), function Ability )
    call RemoveLocation(l)
    set l = null
endfunction

function AbilityGo_Tongban takes nothing returns nothing
    local location l = GetUnitLoc(GetSpellTargetUnit())
    set bj_wantDestroyGroup = true
    call ForGroupBJ( GetUnitsInRangeOfLocMatching(500, l, Condition(function AbilityIfB)), function Ability )
    call RemoveLocation(l)
    set l = null
endfunction

function InitTrig_AbilityFun takes nothing returns nothing
endfunction
