
//===========================================================================
// Trigger: Xbiaoji
//
// 641：X标记的Timer
//===========================================================================
function Trig_Xbiaoji_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A04J' 
endfunction

function returnX takes nothing returns nothing
local timer tm=GetExpiredTimer()
local integer i=GetHandleId(tm)
local unit u=LoadUnitHandle(udg_Hash3,i,1)
local unit m=LoadUnitHandle(udg_Hash3,i,5)
local real x=LoadReal(udg_Hash3,i,2)
local real y=LoadReal(udg_Hash3,i,3)

call DestroyEffect( AddSpecialEffectTarget("war3mapImported\\EMPBomb.mdx", m, "chest") )
call UnitRemoveAbility( u, 'A04K' )
call SetPlayerAbilityAvailable( GetOwningPlayer(u), 'A04J', true )
call DestroyEffect(LoadEffectHandle(udg_Hash3,i,4))
if IsUnitType(m, UNIT_TYPE_MAGIC_IMMUNE) == false and IsUnitHidden(m)==false and IsUnitLoaded(m)==false then
call SetUnitX(m,x)
call SetUnitY(m,y)
endif
call FlushChildHashtable( udg_Hash3, i )
call PauseTimer(tm)
call DestroyTimer(tm)

set tm=null
set u=null
set m=null
endfunction


function enemybiaoji takes nothing returns nothing
local timer tt=GetExpiredTimer()
local timer tm=CreateTimer()
local integer i=GetHandleId(tm)
local integer m=GetHandleId(tt)
local unit u=LoadUnitHandle(udg_Hash3,m,1)
local unit t=LoadUnitHandle(udg_Hash3,m,2)
local real x=GetUnitX(t)
local real y=GetUnitY(t)

if UnitHasBuffBJ(t,'BUhf') then
call SaveUnitHandle(udg_Hash3,i,5,t)
call SaveUnitHandle(udg_Hash3,i,1,u)
call SaveReal(udg_Hash3,i,2,x)
call SaveReal(udg_Hash3,i,3,y)
call SaveEffectHandle(udg_Hash3,i,4, AddSpecialEffect("Doodads\\Cinematic\\GlowingRunes\\GlowingRunes1.mdl", x, y))
call SaveTimerHandle(udg_Hash3,GetHandleId(u),641,tm)
call TimerStart(tm,GetUnitAbilityLevel(u,'A04J'),false,function returnX)
call SetPlayerAbilityAvailable( GetOwningPlayer(u), 'A04J', false )
call UnitAddAbility( u, 'A04K' )
endif
call UnitRemoveAbility(t,'BUhf')
call FlushChildHashtable( udg_Hash3, m )
call PauseTimer(tt)
call DestroyTimer(tt)


set tm=null
set tt=null
set t=null
set u=null
endfunction


function Trig_Xbiaoji_Actions takes nothing returns nothing
local timer tm=CreateTimer()
local integer i=GetHandleId(tm)
local unit m=CreateUnit(GetTriggerPlayer(),'n001',0,0,0)
local unit t=GetSpellTargetUnit()
local unit u=GetTriggerUnit()
local real x=GetUnitX(t)
local real y=GetUnitY(t)

if IsUnitEnemy(t, GetTriggerPlayer()) == true then
call UnitAddAbility( m, 'Auhf' )
call IssueTargetOrderById( m, 852209, t )
call UnitApplyTimedLife( m, 'BTLF', 5.00 )
call SaveUnitHandle(udg_Hash3,i,2,t)
call SaveUnitHandle(udg_Hash3,i,1,u)
call TimerStart(tm,0.01,false,function enemybiaoji)
else
call SaveUnitHandle(udg_Hash3,i,5,t)
call SaveUnitHandle(udg_Hash3,i,1,u)
call SaveReal(udg_Hash3,i,2,x)
call SaveReal(udg_Hash3,i,3,y)
call SaveEffectHandle(udg_Hash3,i,4, AddSpecialEffect("Doodads\\Cinematic\\GlowingRunes\\GlowingRunes1.mdl", x, y))
call SaveTimerHandle(udg_Hash3,GetHandleId(u),641,tm)
call TimerStart(tm,GetUnitAbilityLevel(u,'A04J'),false,function returnX)
call SetPlayerAbilityAvailable( GetOwningPlayer(u), 'A04J', false )
call UnitAddAbility( u, 'A04K' )
endif


set tm=null
set m=null
set t=null
set u=null
endfunction



//===========================================================================
function InitTrig_Xbiaoji takes nothing returns nothing
    set gg_trg_Xbiaoji = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_Xbiaoji, Condition( function Trig_Xbiaoji_Conditions ) )
    call TriggerAddAction( gg_trg_Xbiaoji, function Trig_Xbiaoji_Actions )
endfunction
