
//===========================================================================
// Trigger: learndawn
//===========================================================================
function Trig_learndawn_Conditions takes nothing returns boolean
    return GetLearnedSkill() == 'A042' 
endfunction

function storeeee takes nothing returns nothing
call SaveInteger(udg_Hash1,GetHandleId(GetEnumUnit()),252,0)
endfunction



function Trig_learndawn_Actions takes nothing returns nothing
call ForGroup(udg_CheckHpGroup,function storeeee)
call DestroyTrigger( GetTriggeringTrigger() )
endfunction

//===========================================================================
function InitTrig_learndawn takes nothing returns nothing
    set gg_trg_learndawn = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_learndawn, Condition( function Trig_learndawn_Conditions ) )
    call TriggerAddAction( gg_trg_learndawn, function Trig_learndawn_Actions )
endfunction
