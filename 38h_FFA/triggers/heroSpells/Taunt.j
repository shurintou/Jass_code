
//===========================================================================
// Trigger: Taunt
//===========================================================================
function Trig_Taunt_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A02P' 
endfunction


function UnitIsNotTaunt takes nothing returns boolean 
return IsUnitIdType(GetUnitTypeId(GetFilterUnit()), UNIT_TYPE_STRUCTURE) == false and GetUnitState(GetFilterUnit(), UNIT_STATE_LIFE) > 0.00 ==true and IsUnitEnemy(GetFilterUnit(), GetOwningPlayer(udg_lsu)) == true
endfunction 

function AttackZSX takes nothing returns nothing
local unit u=GetEnumUnit()
call UnitWakeUp(u)
call IssueTargetOrderById(u , 851983, udg_lsu )
call DestroyEffect( AddSpecialEffectTarget("Abilities\\Weapons\\LavaSpawnMissile\\LavaSpawnBirthMissile.mdl", u, "chest") )
set u=null
endfunction

function TauntAct takes nothing returns nothing
local timer tm=GetExpiredTimer()
local integer i=GetHandleId(tm)
local unit u=LoadUnitHandle(udg_Hash1,i,1)
local integer n=LoadInteger(udg_Hash1,i,2)
local group g=LoadGroupHandle(udg_Hash1,i,3)

if n>0 then
set udg_lsu=u
call ForGroup(g,function AttackZSX)
call SaveInteger(udg_Hash1,i,2,n-1)
else
call UnitRemoveAbility(u,'Amgl')
call SetPlayerAbilityAvailable( GetOwningPlayer(u), 'A02P', true )
call FlushChildHashtable( udg_Hash1, i )
call PauseTimer(tm)
call DestroyTimer(tm)
call GroupClear(g)
call DestroyGroup(g)
endif

set tm=null
set u=null
set g=null
endfunction

function Trig_Taunt_Actions takes nothing returns nothing
local unit u=GetTriggerUnit()
local timer tm=CreateTimer()
local integer level=GetUnitAbilityLevel(u,'A02P')
local integer i=GetHandleId(tm)
local group g=CreateGroup()
local boolexpr b=Condition(function UnitIsNotTaunt)

set udg_lsu=u
call GroupEnumUnitsInRange(g,GetUnitX(u),GetUnitY(u),300,b)
call SaveUnitHandle(udg_Hash1,i,1,u)
call SaveInteger(udg_Hash1,i,2,10+(5*level))
call SaveGroupHandle(udg_Hash1,i,3,g)
call SetPlayerAbilityAvailable( GetOwningPlayer(u), 'A02P', false )
call UnitAddAbility(u,'Amgl')
call TimerStart(tm,0.1,true,function TauntAct)
call DestroyBoolExpr(b)

set tm=null
set u=null
set g=null
set b=null
endfunction

//===========================================================================
function InitTrig_Taunt takes nothing returns nothing
    set gg_trg_Taunt = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_Taunt, Condition( function Trig_Taunt_Conditions ) )
    call TriggerAddAction( gg_trg_Taunt, function Trig_Taunt_Actions )
endfunction
