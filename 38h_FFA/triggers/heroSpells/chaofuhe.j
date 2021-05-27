
//===========================================================================
// Trigger: chaofuhe
//===========================================================================
function Trig_chaofuhe_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A0CB' 
endfunction

function CFHCheckLinkin takes nothing returns nothing
local timer tm=GetExpiredTimer()
local integer i=GetHandleId(tm)
local unit t=LoadUnitHandle(udg_Hash3,i,2)
local unit u
local unit m

if UnitHasBuffBJ(t,'BUhf') then//没林肯
set u=LoadUnitHandle(udg_Hash3,i,1)
call UnitDamageTarget( u, t, 150+0.1*GetUnitState(u, UNIT_STATE_MAX_MANA), true, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
call DestroyEffect( AddSpecialEffectTarget("Abilities\\Spells\\Demon\\DemonBoltImpact\\DemonBoltImpact.mdl", t, "chest") )
else
endif
call UnitRemoveAbility(t,'BUhf')
call FlushChildHashtable( udg_Hash3, i )
call PauseTimer(tm)
call DestroyTimer(tm)

set tm=null
set t=null
set u=null
set m=null
endfunction



function Trig_chaofuhe_Actions takes nothing returns nothing
local timer tm=CreateTimer()
local integer i=GetHandleId(tm)
local unit m=CreateUnit(GetTriggerPlayer(),'n001',0,0,0)
local unit t=GetSpellTargetUnit()

call UnitAddAbility( m, 'Auhf' )
call IssueTargetOrderById( m, 852209, t )
call UnitApplyTimedLife( m, 'BTLF', 5.00 )
call SaveUnitHandle(udg_Hash3,i,2,t)
call SaveUnitHandle(udg_Hash3,i,1,GetTriggerUnit())
call TimerStart(tm,0.01,false,function CFHCheckLinkin)

set tm=null
set m=null
set t=null
endfunction

//===========================================================================
function InitTrig_chaofuhe takes nothing returns nothing
    set gg_trg_chaofuhe = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_chaofuhe, Condition( function Trig_chaofuhe_Conditions ) )
    call TriggerAddAction( gg_trg_chaofuhe, function Trig_chaofuhe_Actions )
endfunction
