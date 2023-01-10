
//===========================================================================
// Trigger: PoisonAttack
//===========================================================================
function Trig_PoisonAttack_Conditions takes nothing returns boolean
    return IsUnitEnemy(GetEventTargetUnit(), GetTriggerPlayer()) == true 
endfunction

function Trig_PoisonAttack_Actions takes nothing returns nothing
local unit u=GetTriggerUnit()
local unit m=GetEventTargetUnit()
local real ph=GetUnitLifePercent(m)
local integer n=1
local integer i=0

loop
exitwhen n==5 or i==1
if ph<100-n*20 then
set n=n+1
else
set i=1
endif
endloop

if n==1 then
else
set i=((n-2)*4)+GetUnitAbilityLevel(u,'A06D')
endif
call SetUnitAbilityLevel(u,'A06E',i)

set u=null
set m=null
endfunction

//===========================================================================
function InitTrig_PoisonAttack takes nothing returns nothing
    set gg_trg_PoisonAttack = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_PoisonAttack, Condition( function Trig_PoisonAttack_Conditions ) )
    call TriggerAddAction( gg_trg_PoisonAttack, function Trig_PoisonAttack_Actions )
endfunction
