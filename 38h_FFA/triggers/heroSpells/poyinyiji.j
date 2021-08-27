
//===========================================================================
// Trigger: poyinyiji
//===========================================================================
function Trig_poyinyiji_Conditions takes nothing returns boolean
    return UnitHasBuffBJ(GetTriggerUnit(), 'BOwk') == true and IsUnitEnemy(GetEventTargetUnit(), GetOwningPlayer(GetTriggerUnit())) == true
endfunction

function Trig_poyinyiji_Actions takes nothing returns nothing
local unit u=GetEventTargetUnit()
call UnitAddAbility( u , 'A008' )
call UnitRemoveAbility( u, 'A008' )
call DestroyEffect( AddSpecialEffectTarget("Objects\\Spawnmodels\\Human\\HumanBlood\\HumanBloodKnight.mdl", u, "chest") )
set u=null
endfunction

//===========================================================================
function InitTrig_poyinyiji takes nothing returns nothing
    set gg_trg_poyinyiji = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_poyinyiji, Condition( function Trig_poyinyiji_Conditions ) )
    call TriggerAddAction( gg_trg_poyinyiji, function Trig_poyinyiji_Actions )
endfunction
