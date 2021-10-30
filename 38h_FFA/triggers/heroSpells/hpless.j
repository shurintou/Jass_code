
//===========================================================================
// Trigger: hpless
//===========================================================================
function Trig_hpless_Conditions takes nothing returns boolean
    return GetUnitState(GetTriggerUnit(), UNIT_STATE_LIFE) - GetEventDamage()  < 0 
endfunction

function Trig_hpless_Actions takes nothing returns nothing
local unit u=GetTriggerUnit()
local unit m
local real fc=GetUnitFacing(u)
local real x=GetUnitX(u)
local real y=GetUnitY(u)
local unit t=LoadUnitHandle(udg_Hash1,GetHandleId(gg_trg_zhaohuanxiong),1)
local unit hu=GetEventDamageSource()

call UnitAddAbility( u, 'Agho' )
call ShowUnit( u, false )
call SetUnitInvulnerable( u, true )
set m=CreateUnit(GetTriggerPlayer(),'ngz4',x,y,fc)
call SetUnitState( m, UNIT_STATE_LIFE, 1 )
call SetUnitState( u, UNIT_STATE_LIFE,GetUnitState(u, UNIT_STATE_MAX_LIFE))
call UnitDamageTarget( hu, m, 9999, true, false, ATTACK_TYPE_HERO, DAMAGE_TYPE_NORMAL, WEAPON_TYPE_WHOKNOWS )
call UnitDamageTarget( hu, t,  GetUnitState(t, UNIT_STATE_MAX_LIFE)*0.2 , true, false, ATTACK_TYPE_HERO, DAMAGE_TYPE_NORMAL, WEAPON_TYPE_WHOKNOWS )

set u=null
set m=null
set hu=null
set t=null
endfunction

//===========================================================================
function InitTrig_hpless takes nothing returns nothing
    set gg_trg_hpless = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_hpless, Condition( function Trig_hpless_Conditions ) )
    call TriggerAddAction( gg_trg_hpless, function Trig_hpless_Actions )
endfunction
