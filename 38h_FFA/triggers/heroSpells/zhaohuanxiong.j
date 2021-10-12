
//===========================================================================
// Trigger: zhaohuanxiong
//
// 把熊存在该触发中call SaveUnitHandle(udg_Hash1,GetHandleId(gg_trg_zhaohuanxiong),2,m)
//===========================================================================
function Trig_zhaohuanxiong_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'Arsg' 
endfunction

function Trig_zhaohuanxiong_Actions takes nothing returns nothing
local integer i=GetHandleId(gg_trg_zhaohuanxiong)
local unit u=GetTriggerUnit()
local unit m=LoadUnitHandle(udg_Hash1,i,2)
local integer level=GetUnitAbilityLevel(u, 'Arsg')
local real w=1.2+0.1*level

if m==null then
set m=CreateUnit(GetTriggerPlayer(),'ngz4',GetUnitX(u),GetUnitY(u),270)
call SaveUnitHandle(udg_Hash1,i,2,m)
call TriggerRegisterUnitEvent( gg_trg_huigui, m, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent(gg_trg_hpless,m, EVENT_UNIT_DAMAGED )
else
call SetUnitInvulnerable( m, false )
call SetUnitState( m, UNIT_STATE_LIFE,GetUnitState(m, UNIT_STATE_MAX_LIFE))
call UnitRemoveAbility( m, 'Agho' )
call ShowUnit( m, true )
call SetUnitX(m,GetUnitX(u))
call SetUnitY(m,GetUnitY(u))
endif

if level==4 then
    call UnitAddAbility( m, 'ANd1' )
       if LoadInteger(udg_Hash1,i,5)==0 then
       call SaveInteger(udg_Hash1,i,5,1)
       call TriggerRegisterUnitEvent( gg_trg_attacktree, m, EVENT_UNIT_TARGET_IN_RANGE )
       endif
    call UnitAddAbility( m, 'A07X' )
    call UnitAddAbility( m, 'A022' )//魔抗
    call UnitAddAbility( m, 'A0BH' )//闪烁
    call UnitAddAbility( m, 'A070' )
    else
    if level==3 then
    call UnitAddAbility( m, 'A07X' )
    call UnitAddAbility( m, 'A0BH' )//闪烁
    call UnitAddAbility( m, 'A070' )
       if LoadInteger(udg_Hash1,i,5)==0 then
       call SaveInteger(udg_Hash1,i,5,1)
       call TriggerRegisterUnitEvent( gg_trg_attacktree, m, EVENT_UNIT_TARGET_IN_RANGE )
       endif
    else
    if level==2 then
    call UnitAddAbility( m, 'A070' )
    call UnitAddAbility( m, 'A0BH' )//闪烁
    endif
    endif
    endif
call SetUnitVertexColor( m, 255, 130, 200, 255 )
call SetUnitScale( m, w, w, w )
call UnitRemoveBuffsEx( m, true, true, false, false, true, true, false )
call DestroyEffect( AddSpecialEffectTarget("Abilities\\Spells\\Orc\\FeralSpirit\\feralspiritdone.mdl", m, "chest") )
call DestroyEffect( AddSpecialEffectTarget("Abilities\\Spells\\Orc\\FeralSpirit\\feralspiritdone.mdl", u, "chest") )

set u=null
set m=null
endfunction

//===========================================================================
function InitTrig_zhaohuanxiong takes nothing returns nothing
    set gg_trg_zhaohuanxiong = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_zhaohuanxiong, Condition( function Trig_zhaohuanxiong_Conditions ) )
    call TriggerAddAction( gg_trg_zhaohuanxiong, function Trig_zhaohuanxiong_Actions )
endfunction
