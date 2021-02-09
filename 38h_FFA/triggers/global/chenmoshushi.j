
//===========================================================================
// Trigger: chenmoshushi
//===========================================================================
function Trig_chenmoshushi_Conditions takes nothing returns boolean
     return  GetUnitAbilityLevel(GetTriggerUnit(), 'B02U') >0
endfunction

function Trig_chenmoshushi_Actions takes nothing returns nothing
local unit t=GetTriggerUnit()
local unit  m=CreateUnit(Player(PLAYER_NEUTRAL_AGGRESSIVE),'n001',0,0,0)
call UnitAddAbility(m,'A092')
call UnitApplyTimedLife( m, 'BTLF', 10 )
call IssueTargetOrderById( m, 852668, t )
set m=null
set t=null
endfunction

//===========================================================================
function InitTrig_chenmoshushi takes nothing returns nothing
    set gg_trg_chenmoshushi = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_chenmoshushi, Condition( function Trig_chenmoshushi_Conditions ) )
    call TriggerAddAction( gg_trg_chenmoshushi, function Trig_chenmoshushi_Actions )
endfunction
