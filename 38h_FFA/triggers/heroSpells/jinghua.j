
//===========================================================================
// Trigger: jinghua
//===========================================================================
function Trig_jinghua_Conditions takes nothing returns boolean
   return GetSpellAbilityId() == 'A07V' 
endfunction

function JHCheckLinkin takes nothing returns nothing
local timer tm=GetExpiredTimer()
local integer i=GetHandleId(tm)
local unit t=LoadUnitHandle(udg_Hash3,i,2)
local unit u


if UnitHasBuffBJ(t,'B02K') then//没林肯
set u=LoadUnitHandle(udg_Hash3,i,1)
call UnitDamageTarget( u, t, 100+100*GetUnitAbilityLevel(u,'A07V'), true, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
endif

call FlushChildHashtable( udg_Hash3, i )
call PauseTimer(tm)
call DestroyTimer(tm)

set tm=null
set t=null
set u=null
endfunction


function Trig_jinghua_Actions takes nothing returns nothing
local timer tm=CreateTimer()
local integer i=GetHandleId(tm)
local unit t=GetSpellTargetUnit()


call SaveUnitHandle(udg_Hash3,i,2,t)
call SaveUnitHandle(udg_Hash3,i,1,GetTriggerUnit())
call TimerStart(tm,2,false,function JHCheckLinkin)

set tm=null
set t=null
endfunction

//===========================================================================
function InitTrig_jinghua takes nothing returns nothing
    set gg_trg_jinghua = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_jinghua, Condition( function Trig_jinghua_Conditions ) )
    call TriggerAddAction( gg_trg_jinghua, function Trig_jinghua_Actions )
endfunction
