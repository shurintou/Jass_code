
//===========================================================================
// Trigger: mieshi
//===========================================================================
function Trig_mieshi_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A0CX' 
endfunction

function mieshiact takes nothing returns nothing
local timer tm=GetExpiredTimer()
local integer i=GetHandleId(tm)
local integer n=LoadInteger(udg_Hash1,i,4)
local unit u=LoadUnitHandle(udg_Hash1,i,1)
local real x=0
local real y=0
if n>0 then
set x=LoadReal(udg_Hash1,i,2)
set y=LoadReal(udg_Hash1,i,3)
call DestroyEffect( AddSpecialEffect("Abilities\\Spells\\Human\\MarkOfChaos\\MarkOfChaosTarget.mdl", x+GetRandomReal(-350,350), y+GetRandomReal(-350,350)) )
call DestroyEffect( AddSpecialEffect("Abilities\\Spells\\Human\\Thunderclap\\ThunderClapCaster.mdl", x+GetRandomReal(-350,350), y+GetRandomReal(-350,350)) )
call DestroyEffect( AddSpecialEffect("Abilities\\Spells\\Human\\FlameStrike\\FlameStrike1.mdl", x+GetRandomReal(-350,350), y+GetRandomReal(-350,350)) )
call DestroyEffect( AddSpecialEffect("Abilities\\Spells\\Human\\FlameStrike\\FlameStrikeTarget.mdl", x+GetRandomReal(-350,350), y+GetRandomReal(-350,350)) )
call DestroyEffect( AddSpecialEffect("Abilities\\Spells\\Orc\\WarStomp\\WarStompCaster.mdl", x+GetRandomReal(-350,350), y+GetRandomReal(-350,350)) )
call DestroyEffect( AddSpecialEffect("Abilities\\Spells\\Orc\\EarthQuake\\EarthQuakeTarget.mdl", x+GetRandomReal(-350,350), y+GetRandomReal(-350,350)) )
call UnitDamagePoint( u, 0, 350.00, x, y, LoadReal(udg_Hash1,i,5), true, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
call DestroyEffect( AddSpecialEffect("Objects\\Spawnmodels\\Other\\NeutralBuildingExplosion\\NeutralBuildingExplosion.mdl", x+GetRandomReal(-350,350), y+GetRandomReal(-350,350)) )
call DestroyEffect( AddSpecialEffect("Abilities\\Spells\\Other\\Volcano\\VolcanoDeath.mdl", x+GetRandomReal(-350,350), y+GetRandomReal(-350,350)) )
call SaveInteger(udg_Hash1,i,4,n-1)
else
call FlushChildHashtable( udg_Hash1, i )
call PauseTimer(tm)
call DestroyTimer(tm)
endif
set tm=null
set u=null
endfunction


function Trig_mieshi_Actions takes nothing returns nothing
local timer tm=CreateTimer()
local integer i=GetHandleId(tm)
local unit u=GetTriggerUnit()
local real x=GetSpellTargetX()
local real y=GetSpellTargetY()
local real mp=GetUnitState(u, UNIT_STATE_MAX_MANA)
local integer level=GetUnitAbilityLevel(u, 'A0CX')
local real hh=(0.3+0.1*level)*mp/30


call DestroyEffect( AddSpecialEffect("Abilities\\Spells\\Human\\MarkOfChaos\\MarkOfChaosTarget.mdl", x+GetRandomReal(-350,350), y+GetRandomReal(-350,350)) )
call DestroyEffect( AddSpecialEffect("Abilities\\Spells\\Human\\Thunderclap\\ThunderClapCaster.mdl", x+GetRandomReal(-350,350), y+GetRandomReal(-350,350)) )
call DestroyEffect( AddSpecialEffect("Abilities\\Spells\\Human\\FlameStrike\\FlameStrike1.mdl", x+GetRandomReal(-350,350), y+GetRandomReal(-350,350)) )
call DestroyEffect( AddSpecialEffect("Abilities\\Spells\\Human\\FlameStrike\\FlameStrikeTarget.mdl", x+GetRandomReal(-350,350), y+GetRandomReal(-350,350)) )
call DestroyEffect( AddSpecialEffect("Abilities\\Spells\\Orc\\WarStomp\\WarStompCaster.mdl", x+GetRandomReal(-350,350), y+GetRandomReal(-350,350)) )
call DestroyEffect( AddSpecialEffect("Abilities\\Spells\\Orc\\EarthQuake\\EarthQuakeTarget.mdl", x+GetRandomReal(-350,350), y+GetRandomReal(-350,350)) )
call DestroyEffect( AddSpecialEffect("Objects\\Spawnmodels\\Other\\NeutralBuildingExplosion\\NeutralBuildingExplosion.mdl", x+GetRandomReal(-350,350), y+GetRandomReal(-350,350)) )
call DestroyEffect( AddSpecialEffect("Abilities\\Spells\\Other\\Volcano\\VolcanoDeath.mdl", x+GetRandomReal(-350,350), y+GetRandomReal(-350,350)) )
call UnitDamagePoint( u, 0, 350.00, x, y, hh, true, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
call SaveInteger(udg_Hash1,i,4,30)
call SaveReal(udg_Hash1,i,3,y)
call SaveReal(udg_Hash1,i,5,hh)
call SaveReal(udg_Hash1,i,2,x)
call SaveUnitHandle(udg_Hash1,i,1,u)
call TimerStart(tm,0.1,true,function mieshiact)

set tm=null
set u=null
endfunction

//===========================================================================
function InitTrig_mieshi takes nothing returns nothing
    set gg_trg_mieshi = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_mieshi, Condition( function Trig_mieshi_Conditions ) )
    call TriggerAddAction( gg_trg_mieshi, function Trig_mieshi_Actions )
endfunction
