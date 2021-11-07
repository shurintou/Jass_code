
//===========================================================================
// Trigger: jingxiangbaoji
//===========================================================================
function Trig_jingxiangbaoji_Conditions takes nothing returns boolean
    return GetLearnedSkill() == 'AOmi' 
endfunction

function Trig_jingxiangbaoji_Actions takes nothing returns nothing
local unit u=GetTriggerUnit()
local integer i=GetUnitAbilityLevel(u, 'AOmi' )
if i==1 then
call SetPlayerAbilityAvailable( GetOwningPlayer(u), 'A006', true )
endif
call SetUnitAbilityLevel( u, 'A006', i )
if i==3 then
call DestroyTrigger( GetTriggeringTrigger() )
endif
set u=null
endfunction

//===========================================================================
function InitTrig_jingxiangbaoji takes nothing returns nothing
    set gg_trg_jingxiangbaoji = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_jingxiangbaoji, Condition( function Trig_jingxiangbaoji_Conditions ) )
    call TriggerAddAction( gg_trg_jingxiangbaoji, function Trig_jingxiangbaoji_Actions )
endfunction
