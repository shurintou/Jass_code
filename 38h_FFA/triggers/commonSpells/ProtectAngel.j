
//===========================================================================
// Trigger: ProtectAngel
//===========================================================================
function Trig_ProtectAngel_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A059' 
endfunction


function moveangle takes nothing returns nothing
local timer tm=GetExpiredTimer()
local integer i=GetHandleId(tm)
local unit m=LoadUnitHandle(udg_Hash1,i,2)
local unit u=LoadUnitHandle(udg_Hash1,i,1)
local real x
local real y
local integer n
local integer level
local real r
local real pia=3.1415/180

if GetUnitState(u, UNIT_STATE_LIFE)>0 and  GetUnitState(m, UNIT_STATE_LIFE)>0 then
set x=GetUnitX(u)
set y=GetUnitY(u)
call SetUnitX(m,x)
call SetUnitY(m,y)
set level=GetUnitAbilityLevel(u, 'A059')
set n=LoadInteger(udg_Hash1,i,5)
set r=100+200*level
   if n==2 then
   set n=0
   loop
   exitwhen n>3+3*level
   call DestroyEffect( AddSpecialEffect("Abilities\\Spells\\Human\\Resurrect\\ResurrectTarget.mdl",x+(Cos(120/(1+level)*n*pia)*r),y+(Sin(120/(1+level)*n*pia)*r)) )
   set n=n+1
   endloop
   call SaveInteger(udg_Hash1,i,5,0)
   else
   call SaveInteger(udg_Hash1,i,5,n+1)
   endif

else
call FlushChildHashtable( udg_Hash1, i )
call PauseTimer(tm)
call DestroyTimer(tm)
endif

set tm=null
set u=null
set m=null
endfunction

function Trig_ProtectAngel_Actions takes nothing returns nothing
local unit u=GetTriggerUnit()
local real x=GetUnitX(u)
local real y=GetUnitY(u)
local unit m=CreateUnit(GetTriggerPlayer(),'n001',x,y,0)
local integer level=GetUnitAbilityLevel(u, 'A059')
local timer tm=CreateTimer()
local integer i=GetHandleId(tm)


call SaveUnitHandle(udg_Hash1,i,1,u)
call SaveUnitHandle(udg_Hash1,i,2,m)
call SaveInteger(udg_Hash1,i,5,0)
call UnitAddAbility( m, 'AHad' )
call SetUnitAbilityLevel( m, 'AHad', level )
call UnitApplyTimedLife( m, 'BTLF', 2.5+level )
call TimerStart(tm,0.5,true,function moveangle)


set u=null
set m=null
set tm=null
endfunction

//===========================================================================
function InitTrig_ProtectAngel takes nothing returns nothing
    set gg_trg_ProtectAngel = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_ProtectAngel, Condition( function Trig_ProtectAngel_Conditions ) )
    call TriggerAddAction( gg_trg_ProtectAngel, function Trig_ProtectAngel_Actions )
endfunction
