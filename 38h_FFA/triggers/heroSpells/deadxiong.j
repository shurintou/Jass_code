
//===========================================================================
// Trigger: deadxiong
//===========================================================================
function Trig_deadxiong_Actions takes nothing returns nothing
local unit u=LoadUnitHandle(udg_Hash1,GetHandleId(gg_trg_zhaohuanxiong),2)
local unit m
local real fc=GetUnitFacing(u)
local real x=GetUnitX(u)
local real y=GetUnitY(u)

call UnitAddAbility( u, 'Agho' )
call ShowUnit( u, false )
call SetUnitInvulnerable( u, true )
set m=CreateUnit(GetTriggerPlayer(),'ngz4',x,y,fc)
call SetUnitState( m, UNIT_STATE_LIFE, 1 )
call SetUnitState( u, UNIT_STATE_LIFE,GetUnitState(u, UNIT_STATE_MAX_LIFE))
call UnitDamageTarget( GetKillingUnit(), m, 9999, true, false, ATTACK_TYPE_HERO, DAMAGE_TYPE_NORMAL, WEAPON_TYPE_WHOKNOWS )

set u=null
set m=null
endfunction

//===========================================================================
function InitTrig_deadxiong takes nothing returns nothing
    set gg_trg_deadxiong = CreateTrigger(  )
    call TriggerAddAction( gg_trg_deadxiong, function Trig_deadxiong_Actions )
endfunction
