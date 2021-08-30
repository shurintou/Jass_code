
//===========================================================================
// Trigger: learnaddstrong
//===========================================================================
function Trig_learnaddstrong_Conditions takes nothing returns boolean
    return GetLearnedSkill() == 'A0CH' 
endfunction


function huixuebyliliang takes nothing returns nothing
local unit u=LoadUnitHandle(udg_Hash1,GetHandleId(gg_trg_learnaddstrong),1)
local integer st=GetHeroStr(u, true)
local integer level= GetUnitAbilityLevel(u, 'A0CH')
call SetUnitState( u, UNIT_STATE_LIFE, GetUnitState(u, UNIT_STATE_LIFE)+0.01*level*st )
set u=null
endfunction



function Trig_learnaddstrong_Actions takes nothing returns nothing
    call SaveUnitHandle(udg_Hash1,GetHandleId(gg_trg_learnaddstrong),1,GetTriggerUnit())
    call TimerStart(CreateTimer(),0.1,true,function huixuebyliliang)
    call SetHeroStr( null, GetHeroStr(null, false), true )
    call DisableTrigger( GetTriggeringTrigger() )
endfunction

//===========================================================================
function InitTrig_learnaddstrong takes nothing returns nothing
    set gg_trg_learnaddstrong = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_learnaddstrong, Condition( function Trig_learnaddstrong_Conditions ) )
    call TriggerAddAction( gg_trg_learnaddstrong, function Trig_learnaddstrong_Actions )
endfunction
