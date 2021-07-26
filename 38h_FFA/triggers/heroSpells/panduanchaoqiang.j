
//===========================================================================
// Trigger: panduanchaoqiang
//
// call SaveInteger(udg_Hash1,GetHandleId( gg_trg_panduanchaoqiang),GetHandleId(u),//叠加次数保存在触发ID为主索引,单位ID为子索引的表中
// call SaveUnitHandle(udg_Hash1,GetHandleId(gg_trg_chaoqiangstrong),2,GetEventTargetUnit())//攻击目标保存于该触发的索引中
// call SaveInteger(udg_Hash1,GetHandleId(gg_trg_chaoqiangstrong),4,1)//已攻击次数,大于则删除BUFF
//===========================================================================
function Trig_panduanchaoqiang_Conditions takes nothing returns boolean
    local real r=GetEventDamage()
    return GetTriggerUnit() == GetEventDamageSource() and  r< 5 and r>0 and GetUnitAbilityLevel(GetTriggerUnit(), 'A09X')>0               
endfunction

function Trig_panduanchaoqiang_Actions takes nothing returns nothing
local unit u=GetTriggerUnit()
local integer y=GetHandleId(gg_trg_chaoqiangstrong)
local unit t=LoadUnitHandle(udg_Hash1,y,2)
local integer i=GetHandleId( gg_trg_panduanchaoqiang)
local integer l=GetHandleId(t)
local integer n
local integer level=GetUnitAbilityLevel(u, 'A0BJ')
local integer na

if GetUnitAbilityLevel(t, 'B03U')>0 then
set n=LoadInteger(udg_Hash1,i,l)
call SaveInteger(udg_Hash1,i,l,n+1)
call UnitDamageTarget( u, t, (5+5*level)*n, true, false, ATTACK_TYPE_HERO, DAMAGE_TYPE_NORMAL, WEAPON_TYPE_WHOKNOWS )
else
call SaveInteger(udg_Hash1,i,l,1)
endif
call UnitAddAbility( t, 'A0BK' )
call UnitRemoveAbility( t, 'A0BK' )

if GetUnitAbilityLevel(u, 'Bfzy')>0 then
set na=LoadInteger(udg_Hash1,y,4)
    if na>=2+level then
    call UnitRemoveAbility( u, 'Bfzy' )
    call SaveInteger(udg_Hash1,y,4,0)
    else
    call SaveInteger(udg_Hash1,y,4,na+1)
    endif
else
call SaveInteger(udg_Hash1,y,4,0)
endif

if GetUnitAbilityLevel(u, 'Blsh')>0 then
set level=GetUnitAbilityLevel(u, 'A0BM')
call UnitDamageTarget( u, t, 0.01*GetUnitState(u, UNIT_STATE_LIFE)*(3+level), true, false, ATTACK_TYPE_HERO, DAMAGE_TYPE_NORMAL, WEAPON_TYPE_WHOKNOWS )
endif

set u=null
set t=null
endfunction

//===========================================================================
function InitTrig_panduanchaoqiang takes nothing returns nothing
    set gg_trg_panduanchaoqiang = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_panduanchaoqiang, Condition( function Trig_panduanchaoqiang_Conditions ) )
    call TriggerAddAction( gg_trg_panduanchaoqiang, function Trig_panduanchaoqiang_Actions )
endfunction
