
//===========================================================================
// Trigger: vieee
//===========================================================================
function Trig_vieee_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A08P' 
endfunction


function harmwateract takes nothing returns nothing
local unit t=GetEnumUnit()
local integer i=GetHandleId(gg_trg_vieee)
local unit u=LoadUnitHandle(udg_Hash1,i,1)
local location l
local real r

if IsUnitEnemy(t, GetOwningPlayer(u)) then
set l=GetUnitLoc(t) 
set r=GetLocationZ(l)
    if r>295 then 
    else
    call UnitDamageTarget( u, t,LoadInteger(udg_Hash1,i,5)*GetUnitAbilityLevel(u, 'A08P')/2 , true, false, ATTACK_TYPE_HERO, DAMAGE_TYPE_NORMAL, WEAPON_TYPE_WHOKNOWS )
    //call DestroyEffect( AddSpecialEffectTarget("Abilities\\Spells\\Other\\ImmolationRed\\ImmolationRedDamage.mdl", t, "chest") )
    //call DestroyEffect( AddSpecialEffectTarget("Abilities\\Spells\\Human\\FlameStrike\\FlameStrikeDamageTarget.mdl", t, "chest") )
    call UnitAddAbility( t, 'A0B2' )
    call UnitRemoveAbility( t, 'A0B2' )
    endif
call RemoveLocation(l)
endif

set t=null
set l=null
set u=null
endfunction

function colorwaterchange takes nothing returns nothing
local timer tm=GetExpiredTimer()
local integer i=GetHandleId(tm)
local integer n=LoadInteger(udg_Hash1,i,1)
local integer g=LoadInteger(udg_Hash1,i,2)
local integer y=g*5
if n==0 then//0即为增长颜色
    if g<51 then
    call SetWaterBaseColor( 255, 255-y, 255-y, 255 )
    call SaveInteger(udg_Hash1,i,2,g+1)
    else
    call SetWaterBaseColor( 255, 0, 0, 255 )
    call SaveInteger(udg_Hash1,i,1,5)
    endif
else
    if g>0  then
    call SetWaterBaseColor( 255, 255-y, 255-y, 255 )
    call SaveInteger(udg_Hash1,i,2,g-1)
    else
    call FlushChildHashtable( udg_Hash1, i )
    call PauseTimer(tm)
    call DestroyTimer(tm)
    call SetWaterBaseColor( 255, 255, 255, 255 )
    endif
endif
call SaveInteger(udg_Hash1,GetHandleId(gg_trg_vieee),5,g)
call ForGroup(udg_CheckHpGroup,function harmwateract)
set tm=null
endfunction


function Trig_vieee_Actions takes nothing returns nothing
    local unit u=GetTriggerUnit()
    local integer i=GetHandleId(u)
    local real x=LoadReal(udg_Hash1,i,217)
    local real y=LoadReal(udg_Hash1,i,218)
    local unit m=CreateUnit(GetOwningPlayer(u),'n001',x,y,0)
    local timer tm=CreateTimer()
    local integer n=GetHandleId(tm)

    call UnitAddAbility(m,'ANvc')
    call SetUnitAbilityLevel(m,'ANvc',GetUnitAbilityLevel(u,'A08P'))
    call IssuePointOrderById( m, 852669, x, y )
    call UnitApplyTimedLife( m, 'BTLF', 30 )
    call IssueImmediateOrderById( u, 851972 )
    call SetUnitAnimation( u, "spell" )
    call SaveInteger(udg_Hash1,n,1,0)//是增长颜色还是退颜色
    call SaveInteger(udg_Hash1,n,2,0)//步骤
    call TimerStart(tm,0.3,true,function colorwaterchange)
   set tm=null
   set u=null
   set m=null
endfunction

//===========================================================================
function InitTrig_vieee takes nothing returns nothing
    set gg_trg_vieee = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_vieee, Condition( function Trig_vieee_Conditions ) )
    call TriggerAddAction( gg_trg_vieee, function Trig_vieee_Actions )
endfunction
