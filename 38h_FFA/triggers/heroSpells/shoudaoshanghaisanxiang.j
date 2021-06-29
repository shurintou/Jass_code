
//===========================================================================
// Trigger: shoudaoshanghaisanxiang
//===========================================================================
function Trig_shoudaoshanghaisanxiang_Conditions takes nothing returns boolean
  return IsUnitAlly(GetEventDamageSource(), GetTriggerPlayer()) == false and GetEventDamage()<2000 and GetEventDamage()>0 and  GetUnitAbilityLevel(GetTriggerUnit(), 'A0E3')>0
endfunction

function Trig_shoudaoshanghaisanxiang_Actions takes nothing returns nothing
local unit u=GetTriggerUnit()
local real r=GetEventDamage()
local real h=GetUnitState(u, UNIT_STATE_LIFE)
local real w=100*r/h
local integer i=0
local integer n=GetRandomInt(1,100)
local real m=GetUnitState(u, UNIT_STATE_MANA)
if w<100 then
set i=R2I(w)+GetUnitAbilityLevel(u, 'A0E3')
else
set i=100
endif
if n<=i and m>=i then
call DestroyEffect( AddSpecialEffect("Objects\\Spawnmodels\\Naga\\NagaDeath\\NagaDeath.mdl", GetUnitX(u), GetUnitY(u)) )
call SetUnitState( u, UNIT_STATE_LIFE, h+GetHeroStr(u,true) )
call SetUnitState( u, UNIT_STATE_MANA,m-i)
endif
set u=null
endfunction

//===========================================================================
function InitTrig_shoudaoshanghaisanxiang takes nothing returns nothing
    set gg_trg_shoudaoshanghaisanxiang = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_shoudaoshanghaisanxiang, Condition( function Trig_shoudaoshanghaisanxiang_Conditions ) )
    call TriggerAddAction( gg_trg_shoudaoshanghaisanxiang, function Trig_shoudaoshanghaisanxiang_Actions )
endfunction
