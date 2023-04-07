
//===========================================================================
// Trigger: PlantTree
//===========================================================================
function Trig_PlantTree_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A069' 
endfunction


function removetreeact takes nothing returns nothing
local timer tm=GetExpiredTimer()
local integer n=GetHandleId(tm)
local integer i=0
loop
exitwhen i>8
set i=i+1
call RemoveDestructable(LoadDestructableHandle(udg_Hash1, n, i))
endloop
call FlushChildHashtable( udg_Hash1, n )
call PauseTimer(tm)
call DestroyTimer(tm)

set tm=null
endfunction

function PTCheckLinkin takes nothing returns nothing
local timer tm=GetExpiredTimer()
local integer i=GetHandleId(tm)
local unit t=LoadUnitHandle(udg_Hash3,i,2)
local unit u
local destructable de
local real pia=3.1415926
local integer n=0
local timer tt
local integer g=0
local real x=0
local real y=0
local integer level=0


if GetUnitAbilityLevel(t,'BUhf')>0 then
set u=LoadUnitHandle(udg_Hash3,i,1)
set tt=CreateTimer()
set g=GetHandleId(tt)
set x=GetUnitX(t)
set y=GetUnitY(t)
set level=GetUnitAbilityLevel(u,'A069')
call UnitDamageTarget( u, t, 50*level, true, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
loop
exitwhen n>8
set n=n+1
set de=CreateDestructable('CTtr',RealX(x+(40*(Cos(45*n)*pia))),RealY(y+(40*(Sin(45*n)*pia))),0,1,0)
call SaveDestructableHandle( udg_Hash1, g, n, de )

endloop 
call TimerStart(tt,2.25+0.75*level,false,function removetreeact)
endif

call UnitRemoveAbility(t,'BUhf')
call FlushChildHashtable( udg_Hash3, i )
call PauseTimer(tm)
call DestroyTimer(tm)

set tm=null
set t=null
set tt=null
set de=null
set u=null
endfunction

function Trig_PlantTree_Actions takes nothing returns nothing
local timer tm=CreateTimer()
local integer i=GetHandleId(tm)
local unit t=GetSpellTargetUnit()
local integer n=0
local destructable de
local unit u=GetTriggerUnit()
local real x=GetSpellTargetX()
local real y=GetSpellTargetY()
local real pia=3.1415926
local unit m=CreateUnit(GetTriggerPlayer(),'n006',x,y,0)

if t!=null and IsUnitEnemy(t, GetTriggerPlayer()) then
call UnitAddAbility( m, 'Auhf' )
call IssueTargetOrderById( m, 852209, t )
call UnitApplyTimedLife( m, 'BTLF', 5.00 )
call SaveUnitHandle(udg_Hash3,i,2,t)
call SaveUnitHandle(udg_Hash3,i,1,u)
call TimerStart(tm,0.01,false,function PTCheckLinkin)
else
loop
exitwhen n>8
set n=n+1
set de=CreateDestructable('CTtr',RealX(x+(40*(Cos(45*n)*pia))),RealY(y+(40*(Sin(45*n)*pia))),0,1,0)
call SaveDestructableHandle( udg_Hash1, i, n, de )

endloop 
call TimerStart(tm,2.25+0.75*GetUnitAbilityLevel(u,'A069'),false,function removetreeact)
endif

set de=null
set u=null
set tm=null
set m=null
set t=null
endfunction

//===========================================================================
function InitTrig_PlantTree takes nothing returns nothing
    set gg_trg_PlantTree = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_PlantTree, Condition( function Trig_PlantTree_Conditions ) )
    call TriggerAddAction( gg_trg_PlantTree, function Trig_PlantTree_Actions )
endfunction
