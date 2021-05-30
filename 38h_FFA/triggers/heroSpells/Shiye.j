
//===========================================================================
// Trigger: Shiye
//
// udg_shouwan  /////////兽兽使用者的敌对玩家
//===========================================================================
function Trig_Shiye_Conditions takes nothing returns boolean
    return GetLearnedSkill() == 'AOsf' 
endfunction


function shiyecheck takes nothing returns nothing
if IsUnitVisible(udg_lsu, GetEnumPlayer()) == true then
call SetPlayerAbilityAvailable( GetOwningPlayer(udg_lsu), 'ACua', false )
endif
endfunction



function shiyeact takes nothing returns nothing
local unit u=LoadUnitHandle(udg_Hash1, GetHandleId(GetExpiredTimer()), 1)
call SetPlayerAbilityAvailable( GetOwningPlayer(u), 'ACua', true )
call SetUnitAbilityLevel( u, 'ACua', GetUnitAbilityLevel(u, 'AOsf') )
set udg_lsu=u
call ForForce( udg_shouwan,function shiyecheck)
set u=null
endfunction



function Trig_Shiye_Actions takes nothing returns nothing
local timer tm=CreateTimer()
local unit u=GetTriggerUnit()
local integer i=GetHandleId(tm)
call SaveUnitHandle(udg_Hash1,i,1,u)
call TimerStart(tm,0.5,true,function shiyeact)
call UnitAddAbility( u, 'A004' )
call SetPlayerAbilityAvailable( GetOwningPlayer(u), 'A004', false )
call DestroyTrigger( GetTriggeringTrigger() )
set tm=null
set u=null
endfunction

//===========================================================================
function InitTrig_Shiye takes nothing returns nothing
    set gg_trg_Shiye = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_Shiye, Condition( function Trig_Shiye_Conditions ) )
    call TriggerAddAction( gg_trg_Shiye, function Trig_Shiye_Actions )
endfunction
