
//===========================================================================
// Trigger: 未命名触发器 328
//===========================================================================
function Trig_328_Conditions takes nothing returns boolean
    if ( not ( GetSpellAbilityId() == 'A08H' ) ) then
        return false
    endif
    return true
endfunction

function Trig_328_Actions takes nothing returns nothing
    set udg_jiaochahuanweidanweididian = GetUnitLoc(GetTriggerUnit())
    set udg_jiaochahuanweimubiaodidian = GetUnitLoc(GetSpellTargetUnit())
    set udg_jiaochahuanweimubiao = GetSpellTargetUnit()
    set udg_jiaochahuanweidanwei = GetTriggerUnit()
    call TriggerSleepAction( 1.00 )
    call SetUnitPositionLoc( udg_jiaochahuanweidanwei, udg_jiaochahuanweimubiaodidian )
    call SetUnitPositionLoc( udg_jiaochahuanweimubiao, udg_jiaochahuanweidanweididian )
    call RemoveLocation( udg_jiaochahuanweidanweididian )
    call RemoveLocation( udg_jiaochahuanweimubiaodidian )
endfunction

//===========================================================================
function InitTrig_328 takes nothing returns nothing
    set gg_trg_328 = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_328, EVENT_PLAYER_UNIT_SPELL_CAST )
    call TriggerAddCondition( gg_trg_328, Condition( function Trig_328_Conditions ) )
    call TriggerAddAction( gg_trg_328, function Trig_328_Actions )
endfunction
