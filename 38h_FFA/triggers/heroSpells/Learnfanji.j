
//===========================================================================
// Trigger: Learnfanji
//===========================================================================
function Trig_Learnfanji_Conditions takes nothing returns boolean
    return GetLearnedSkill() == 'A02P' 
endfunction

function Trig_Learnfanji_Actions takes nothing returns nothing
    call EnableTrigger( gg_trg_fanji )
    call TriggerRegisterPlayerUnitEventSimple( gg_trg_HuanXiangFanJi, GetTriggerPlayer(), EVENT_PLAYER_UNIT_ATTACKED )
    call AddSpecialEffectTargetUnitBJ( "origin", GetTriggerUnit(), "war3mapImported\\Warmth.MDX" )
    call DestroyTrigger( GetTriggeringTrigger() )
endfunction

//===========================================================================
function InitTrig_Learnfanji takes nothing returns nothing
    set gg_trg_Learnfanji = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_Learnfanji, Condition( function Trig_Learnfanji_Conditions ) )
    call TriggerAddAction( gg_trg_Learnfanji, function Trig_Learnfanji_Actions )
endfunction
