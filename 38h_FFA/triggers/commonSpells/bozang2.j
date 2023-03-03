
//===========================================================================
// Trigger: bozang2
//
// 触发器名字里有2是因为怕与顶端代码名字重复起冲突
//===========================================================================
function Trig_bozang2_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A074' 
endfunction

function bozangact takes nothing returns nothing
local timer tm=GetExpiredTimer()
local unit u
local integer i=GetHandleId(tm)

set u=LoadUnitHandle(udg_Hash3,i,2)
call UnitRemoveAbility(u,'A075')
call UnitRemoveAbility(u,'B02B')
call SetPlayerAbilityAvailable( GetOwningPlayer(LoadUnitHandle(udg_Hash3,i,1)), 'A074', true )
call SaveInteger(udg_Hash3,GetHandleId(u),619,0)
call FlushChildHashtable( udg_Hash3, i )
call PauseTimer(tm)
call DestroyTimer(tm)


set tm=null
set u=null
endfunction


function Trig_bozang2_Actions takes nothing returns nothing
local unit u=GetTriggerUnit()
local unit t=GetSpellTargetUnit()
local timer tm
local integer n=0

call SetPlayerAbilityAvailable( GetOwningPlayer(u), 'A074', false )
set tm=CreateTimer()
set n=GetHandleId(tm)
call SaveUnitHandle(udg_Hash3,n,2,t)
call SaveUnitHandle(udg_Hash3,n,1,u)
call SaveInteger(udg_Hash3,GetHandleId(t),619,1)
call UnitAddAbility(t,'A075')
call TimerStart(tm,5,false,function bozangact)

set tm=null
set u=null
set t=null
endfunction

//===========================================================================
function InitTrig_bozang2 takes nothing returns nothing
    set gg_trg_bozang2 = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_bozang2, Condition( function Trig_bozang2_Conditions ) )
    call TriggerAddAction( gg_trg_bozang2, function Trig_bozang2_Actions )
endfunction
