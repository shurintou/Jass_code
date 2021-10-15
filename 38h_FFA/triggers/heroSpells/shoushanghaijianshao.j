
//===========================================================================
// Trigger: shoushanghaijianshao
//===========================================================================
function Trig_shoushanghaijianshao_Conditions takes nothing returns boolean
     return IsUnitAlly(GetEventDamageSource(), GetTriggerPlayer()) == false and GetEventDamage()<2000 and GetEventDamage()>0 and GetUnitTypeId(GetEventDamageSource())!= 'e000'
endfunction


function Trig_shoushanghaijianshao_Actions takes nothing returns nothing
local integer i=LoadInteger(udg_Hash1,GetHandleId(gg_trg_sigedead),1)
local real r=GetEventDamage()
local unit u=GetTriggerUnit()
call SetUnitState( u, UNIT_STATE_LIFE, GetUnitState(u, UNIT_STATE_LIFE)+0.02*i*r )
set u=null
endfunction

//===========================================================================
function InitTrig_shoushanghaijianshao takes nothing returns nothing
    set gg_trg_shoushanghaijianshao = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_shoushanghaijianshao, Condition( function Trig_shoushanghaijianshao_Conditions ) )
    call TriggerAddAction( gg_trg_shoushanghaijianshao, function Trig_shoushanghaijianshao_Actions )
endfunction
