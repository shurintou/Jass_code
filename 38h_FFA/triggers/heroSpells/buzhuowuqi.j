
//===========================================================================
// Trigger: buzhuowuqi
//
// IsUnitType(GetFilterUnit(), UNIT_TYPE_ETHEREAL) == false
//===========================================================================
function Trig_buzhuowuqi_Conditions takes nothing returns boolean
    local real r=GetEventDamage()
    return GetTriggerUnit() == GetEventDamageSource() and  r< 5 and r>0  
endfunction

function Trig_buzhuowuqi_Actions takes nothing returns nothing
local integer i=GetHandleId(gg_trg_wuqiluanwu)
local group g=LoadGroupHandle(udg_Hash1, i, 4)
local integer n=0
local unit m
local unit target=LoadUnitHandle(udg_Hash1, i, 6)
local unit u=GetTriggerUnit()

call UnitDamageTarget( u, target, 20*GetUnitAbilityLevel(u,'A0CY'), true, false, ATTACK_TYPE_HERO, DAMAGE_TYPE_NORMAL, WEAPON_TYPE_WHOKNOWS )
call GroupRemoveUnit(g,target)

if IsUnitGroupEmptyBJ(g) or GetUnitState(u, UNIT_STATE_LIFE)<=0 then
call DisableTrigger( gg_trg_buzhuowuqi )
call DisableTrigger( gg_trg_buzhuomubiaodanwei )
set target=LoadUnitHandle(udg_Hash1, i, 2)
call SetUnitX(u,GetUnitX(target)+GetRandomReal(-45,45))
call SetUnitY(u,GetUnitY(target)+GetRandomReal(-45,45))
call UnitRemoveAbility( u, 'A03E' )
call UnitRemoveAbility( u, 'A0D0' )
//call UnitRemoveAbility( u, 'ACm2' )
call DestroyEffect( LoadEffectHandle(udg_Hash1, i, 3) )
call SelectUnitForPlayerSingle( u, GetOwningPlayer(u) )
call SetUnitAnimation( u, "stand" )
call FlushChildHashtable( udg_Hash1, i )
//call SetUnitInvulnerable( u, false )
call SetUnitVertexColor( u, 255, 255, 255, 255 )
call IssueTargetOrderById( u, 851983, target )
call GroupClear(g)
call DestroyGroup(g)
endif



loop
exitwhen n==1 or IsUnitGroupEmptyBJ(g)
set m=GroupPickRandomUnit(g)
if IsUnitType(m, UNIT_TYPE_ETHEREAL) == false and GetUnitState(m, UNIT_STATE_LIFE)>0 then
set n=1
call SetUnitX(u,GetUnitX(m))
call SetUnitY(u,GetUnitY(m))
call IssueTargetOrderById( u, 851983, m )
else
endif
call GroupRemoveUnit(g,m)
endloop



    set u=null
    set target=null
    set g=null
    set m=null
endfunction

//===========================================================================
function InitTrig_buzhuowuqi takes nothing returns nothing
    set gg_trg_buzhuowuqi = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_buzhuowuqi, Condition( function Trig_buzhuowuqi_Conditions ) )
    call TriggerAddAction( gg_trg_buzhuowuqi, function Trig_buzhuowuqi_Actions )
endfunction
