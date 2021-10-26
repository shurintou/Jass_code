
//===========================================================================
// Trigger: wujindetili
//===========================================================================
function Trig_wujindetili_Conditions takes nothing returns boolean
    return GetLearnedSkill() == 'A0CS' 
endfunction

function wujinhuifu takes nothing returns nothing
local timer tm=GetExpiredTimer()
local integer i=GetHandleId(tm)
local integer n=0
local unit m=LoadUnitHandle(udg_Hash1,i,2)
local integer level=GetUnitAbilityLevel(m,'A0CS')
local real x=0
local real y=0
local real dx=0
local real dy=0
local real ex=0
local real ey=0
local real r=0 
local real hp=GetUnitState(m, UNIT_STATE_LIFE)

if hp==GetUnitState(m, UNIT_STATE_MAX_LIFE) then
else
set x=LoadReal(udg_Hash1,i,3)
set y=LoadReal(udg_Hash1,i,4)
set dx=GetUnitX(m)
set dy=GetUnitY(m)
set ex=x-dx
set ey=y-dy
set r=SquareRoot(ex * ex + ey * ey)
if r>0 and r<200 then
call SetUnitState( m, UNIT_STATE_LIFE, hp+0.04*level*r )
call DestroyEffect( AddSpecialEffectTarget("Objects\\Spawnmodels\\Human\\HumanBlood\\BloodElfSpellThiefBlood.mdl", m, "chest") )
endif
endif
call SaveReal(udg_Hash1,i,3,dx)
call SaveReal(udg_Hash1,i,4,dy)


set tm=null
set m=null
endfunction



function Trig_wujindetili_Actions takes nothing returns nothing
local timer tm
local unit u=GetTriggerUnit()
local integer m=0
set tm=CreateTimer()
set m=GetHandleId(tm)
call SaveUnitHandle(udg_Hash1,m,2,u)
call SaveReal(udg_Hash1,m,3,GetUnitX(u))
call SaveReal(udg_Hash1,m,4,GetUnitY(u))
call TimerStart(tm,0.2,true,function wujinhuifu)
call DisableTrigger( gg_trg_wujindetili )
set tm=null
set u=null
endfunction

//===========================================================================
function InitTrig_wujindetili takes nothing returns nothing
    set gg_trg_wujindetili = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_wujindetili, Condition( function Trig_wujindetili_Conditions ) )
    call TriggerAddAction( gg_trg_wujindetili, function Trig_wujindetili_Actions )
endfunction
