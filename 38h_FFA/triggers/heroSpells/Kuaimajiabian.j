
//===========================================================================
// Trigger: Kuaimajiabian
//===========================================================================
function Trig_Kuaimajiabian_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A09R' 
endfunction


function jiasuend takes nothing returns nothing
local timer tm=GetExpiredTimer()
local integer i=GetHandleId(tm)
local unit u=LoadUnitHandle(udg_Hash1, i, 1)

call UnitRemoveAbility( u, 'A09Q' )
call UnitRemoveAbility( u, 'B036' )
call SetPlayerAbilityAvailable( GetOwningPlayer(u), 'A09R', true )
call FlushChildHashtable( udg_Hash1, i )
call PauseTimer(tm)
call DestroyTimer(tm)

set tm=null
set u=null
endfunction


function Trig_Kuaimajiabian_Actions takes nothing returns nothing
local unit u=GetTriggerUnit()
local timer tm=CreateTimer()
local integer i=GetHandleId(tm)

call SetUnitAnimation( u, "stand hit" )
call SetPlayerAbilityAvailable(GetOwningPlayer(u) , 'A09R', false )
call UnitAddAbility( u, 'A09Q' )
call SetPlayerAbilityAvailable(GetOwningPlayer(u) , 'A09Q', false )
call SaveUnitHandle(udg_Hash1,i,1,u)
call TimerStart(tm,5,false,function jiasuend)

set u=null
set tm=null
endfunction

//===========================================================================
function InitTrig_Kuaimajiabian takes nothing returns nothing
    set gg_trg_Kuaimajiabian = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_Kuaimajiabian, Condition( function Trig_Kuaimajiabian_Conditions ) )
    call TriggerAddAction( gg_trg_Kuaimajiabian, function Trig_Kuaimajiabian_Actions )
endfunction
