
//===========================================================================
// Trigger: HuangWu
//===========================================================================
function Trig_HuangWu_Conditions takes nothing returns boolean
    return IsUnitEnemy(GetEventTargetUnit(), GetTriggerPlayer()) == true and GetOwningPlayer(GetEventTargetUnit()) != Player(PLAYER_NEUTRAL_AGGRESSIVE)
endfunction


function huangwu takes nothing returns nothing
local unit u=GetEnumUnit()
local real x=GetUnitX(udg_lsu)
local real y=GetUnitY(udg_lsu)
local real dx=0
local real dy=0
local real ex=0
local real ey=0
set dx=GetUnitX(u)
set dy=GetUnitY(u)
set ex=dx-x
set ey=dy-y


if IsUnitAlly(u, GetOwningPlayer(udg_lsu)) == true and SquareRoot(ex*ex+ey*ey)<375 and u!=udg_lsu then
set udg_N=1
endif

set u=null
endfunction


function huangwuzhunbei takes unit m,unit t returns nothing
local integer ib=0
local integer level=GetUnitAbilityLevel(m, 'AEev')

set udg_lsu=t
set udg_N=0
call ForGroup(udg_CheckHpGroup,function huangwu)
if udg_N==1 then
else
call DestroyEffect( AddSpecialEffectTarget("Abilities\\Spells\\Undead\\DeathandDecay\\DeathandDecayTarget.mdl", udg_lsu, "chest") )
call UnitDamageTarget( CreateUnit(GetOwningPlayer(m),'n00T',0,0,0), udg_lsu, 12*level, true, false, ATTACK_TYPE_HERO, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
endif

endfunction


function Trig_HuangWu_Actions takes nothing returns nothing
call huangwuzhunbei(GetTriggerUnit(),GetEventTargetUnit())
endfunction

//===========================================================================
function InitTrig_HuangWu takes nothing returns nothing
    set gg_trg_HuangWu = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_HuangWu, Condition( function Trig_HuangWu_Conditions ) )
    call TriggerAddAction( gg_trg_HuangWu, function Trig_HuangWu_Actions )
endfunction
