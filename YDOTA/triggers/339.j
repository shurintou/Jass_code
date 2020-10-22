
//===========================================================================
// Trigger: 未命名触发器 339
//===========================================================================
function Trig_339_Conditions takes nothing returns boolean
    if ( not ( GetLearnedSkill() == 'AUts' ) ) then
        return false
    endif
    return true
endfunction

function Trig_339_Func003C takes nothing returns boolean
    if ( not ( GetUnitAbilityLevelSwapped('AUts', GetTriggerUnit()) == 1 ) ) then
        return false
    endif
    return true
endfunction

function Trig_339_Func004C takes nothing returns boolean
    if ( not ( GetUnitAbilityLevelSwapped('AUts', GetTriggerUnit()) == 2 ) ) then
        return false
    endif
    return true
endfunction

function Trig_339_Func005C takes nothing returns boolean
    if ( not ( GetUnitAbilityLevelSwapped('AUts', GetTriggerUnit()) == 3 ) ) then
        return false
    endif
    return true
endfunction

function Trig_339_Func006C takes nothing returns boolean
    if ( not ( GetUnitAbilityLevelSwapped('AUts', GetTriggerUnit()) == 4 ) ) then
        return false
    endif
    return true
endfunction

function Trig_339_Actions takes nothing returns nothing
    if ( Trig_339_Func003C() ) then
        call TriggerSleepAction( 0.50 )
        call SetUnitVertexColorBJ( GetTriggerUnit(), 100, 100, 100, 30.00 )
    else
    endif
    if ( Trig_339_Func004C() ) then
        call TriggerSleepAction( 0.50 )
        call SetUnitVertexColorBJ( GetTriggerUnit(), 100, 100, 100, 60.00 )
    else
    endif
    if ( Trig_339_Func005C() ) then
        call TriggerSleepAction( 0.50 )
        call SetUnitVertexColorBJ( GetTriggerUnit(), 100, 100, 100, 90.00 )
    else
    endif
    if ( Trig_339_Func006C() ) then
        call TriggerSleepAction( 0.50 )
        call SetUnitVertexColorBJ( GetTriggerUnit(), 100, 100, 100, 100.00 )
    else
    endif
endfunction

//===========================================================================
function InitTrig_339 takes nothing returns nothing
    set gg_trg_339 = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_339, EVENT_PLAYER_HERO_SKILL )
    call TriggerAddCondition( gg_trg_339, Condition( function Trig_339_Conditions ) )
    call TriggerAddAction( gg_trg_339, function Trig_339_Actions )
endfunction
