
//===========================================================================
// Trigger: 未命名触发器 173
//===========================================================================
function Trig_173_Func003C takes nothing returns boolean
    if ( ( GetUnitTypeId(GetSummonedUnit()) == 'n02H' ) ) then
        return true
    endif
    if ( ( GetUnitTypeId(GetSummonedUnit()) == 'n03C' ) ) then
        return true
    endif
    if ( ( GetUnitTypeId(GetSummonedUnit()) == 'n03D' ) ) then
        return true
    endif
    if ( ( GetUnitTypeId(GetSummonedUnit()) == 'n02I' ) ) then
        return true
    endif
    return false
endfunction

function Trig_173_Conditions takes nothing returns boolean
    if ( not Trig_173_Func003C() ) then
        return false
    endif
    return true
endfunction

function Trig_173_Actions takes nothing returns nothing
    call IssueImmediateOrder( GetSummonedUnit(), "manaflareon" )
    call SetUnitAbilityLevelSwapped( 'A0BR', GetSummonedUnit(), GetUnitAbilityLevelSwapped('A06Y', udg_youmindanwei) )
endfunction

//===========================================================================
function InitTrig_173 takes nothing returns nothing
    set gg_trg_173 = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_173, EVENT_PLAYER_UNIT_SUMMON )
    call TriggerAddCondition( gg_trg_173, Condition( function Trig_173_Conditions ) )
    call TriggerAddAction( gg_trg_173, function Trig_173_Actions )
endfunction
