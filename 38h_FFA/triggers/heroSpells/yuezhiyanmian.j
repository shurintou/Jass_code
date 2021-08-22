
//===========================================================================
// Trigger: yuezhiyanmian
//===========================================================================
function Trig_yuezhiyanmian_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A08X' 
endfunction

function removeyinshen takes nothing returns nothing
local unit t=GetEnumUnit()
if IsUnitAlly(t, GetOwningPlayer(udg_lsu)) == true then
call UnitRemoveAbility(t,'A08Y')
endif
set t=null
endfunction

function addyinshen takes nothing returns nothing
local unit t=GetEnumUnit()
if IsUnitAlly(t, GetOwningPlayer(udg_lsu)) == true then
call UnitAddAbility(t,'A08Y')
call SetUnitAbilityLevel(t,'A08Y',GetUnitAbilityLevel(udg_lsu,'A08X'))
call DestroyEffect( AddSpecialEffectTarget("Abilities\\Spells\\Human\\Invisibility\\InvisibilityTarget.mdl", t, "origin") )
endif
set t=null
endfunction

function maddyinshen takes nothing returns nothing
local unit t=GetEnumUnit()
if IsUnitAlly(t, GetOwningPlayer(udg_lsu)) == true then
call UnitAddAbility(t,'A08Y')
call SetUnitAbilityLevel(t,'A08Y',GetUnitAbilityLevel(udg_lsu,'A08X'))
endif
set t=null
endfunction

function ffffff takes nothing returns nothing
local timer tm=GetExpiredTimer()
local integer i=GetHandleId(tm)
local integer n=LoadInteger(udg_Hash1,i,2)
set udg_lsu=LoadUnitHandle(udg_Hash1,i,1)
if n>0 then
call SaveInteger(udg_Hash1,i,2,n-1)
call ForGroup(udg_CheckHpGroup,function maddyinshen)
else
call ForGroup(udg_CheckHpGroup,function removeyinshen)
call FlushChildHashtable( udg_Hash1, i )
call PauseTimer(tm)
call DestroyTimer(tm)
endif
set tm=null
endfunction

function Trig_yuezhiyanmian_Actions takes nothing returns nothing
local unit u=GetTriggerUnit()
local timer tm=CreateTimer()
set udg_lsu=u
call ForGroup(udg_CheckHpGroup,function addyinshen)
call SaveInteger(udg_Hash1,GetHandleId(tm),2,11)
call SaveUnitHandle(udg_Hash1,GetHandleId(tm),1,u)
call TimerStart(tm,1,true,function ffffff)
set u=null
set tm=null
endfunction

//===========================================================================
function InitTrig_yuezhiyanmian takes nothing returns nothing
    set gg_trg_yuezhiyanmian = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_yuezhiyanmian, Condition( function Trig_yuezhiyanmian_Conditions ) )
    call TriggerAddAction( gg_trg_yuezhiyanmian, function Trig_yuezhiyanmian_Actions )
endfunction
