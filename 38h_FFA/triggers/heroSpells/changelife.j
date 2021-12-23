
//===========================================================================
// Trigger: changelife
//===========================================================================
function Trig_changelife_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A02Q' 
endfunction

function TBCheckLinkin takes nothing returns nothing
    local timer tm=GetExpiredTimer()
    local integer n=GetHandleId(tm)
    local unit u
    local unit target=LoadUnitHandle(udg_Hash3,n,2)
    local real ur=0
    local real tr=0
    local integer i=0
    local real dur=0

    if UnitHasBuffBJ(target,'BUhf') then
    set u=LoadUnitHandle(udg_Hash3,n,1)
    set ur=GetUnitLifePercent(u)  
    set tr=GetUnitLifePercent(target) 
    set i=GetUnitAbilityLevel(u,'A02Q')
    set dur=(36-(i*6))
    call DestroyEffect( AddSpecialEffectTarget("war3mapImported\\Boomnl.mdx", u, "origin") )
    call DestroyEffect( AddSpecialEffectTarget("war3mapImported\\Boomnl.mdx", target, "origin") )
    call SetUnitLifePercentBJ( u, tr )
    if ur >= dur then
    call SetUnitLifePercentBJ( target, ur )
    else
    call SetUnitLifePercentBJ( target, dur )
    endif
    else
    endif
    call UnitRemoveAbility(target,'BUhf')
    call FlushChildHashtable( udg_Hash3, n )
    call PauseTimer(tm)
    call DestroyTimer(tm)
    
    set tm=null 
    set u=null
    set target=null
endfunction

function Trig_changelife_Actions takes nothing returns nothing
local timer tm
local integer i
local player p=GetTriggerPlayer()
local unit m
local unit t=GetSpellTargetUnit()
local real ur=0
local real tr=0
local real dur=0



if IsUnitEnemy(t,p) then
set tm=CreateTimer()
set i=GetHandleId(tm)
set m=CreateUnit(p,'n001',0,0,0)
call UnitAddAbility( m, 'Auhf' )
call IssueTargetOrderById( m, 852209, t )
call UnitApplyTimedLife( m, 'BTLF', 5.00 )
call SaveUnitHandle(udg_Hash3,i,2,t)
call SaveUnitHandle(udg_Hash3,i,1,GetTriggerUnit())
call TimerStart(tm,0.01,false,function TBCheckLinkin)
else
set m=GetTriggerUnit()
set ur=GetUnitLifePercent(m)  
set tr=GetUnitLifePercent(t) 
set i=GetUnitAbilityLevel(m,'A02Q')
set dur=(36-(i*6))
call DestroyEffect( AddSpecialEffectTarget("war3mapImported\\Boomnl.mdx", m, "origin") )
call DestroyEffect( AddSpecialEffectTarget("war3mapImported\\Boomnl.mdx", t, "origin") )
    call SetUnitLifePercentBJ( m, tr )
    if ur >= dur then
    call SetUnitLifePercentBJ( t, ur )
    else
    call SetUnitLifePercentBJ( t, dur )
    endif
endif

set tm=null
set m=null
set p=null
set t=null
endfunction

//===========================================================================
function InitTrig_changelife takes nothing returns nothing
    set gg_trg_changelife = CreateTrigger(  )
    
    call TriggerAddCondition( gg_trg_changelife, Condition( function Trig_changelife_Conditions ) )
    call TriggerAddAction( gg_trg_changelife, function Trig_changelife_Actions )
endfunction
