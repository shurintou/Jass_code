
//===========================================================================
// Trigger: AttackOther
//
// if IsUnitType(m, UNIT_TYPE_HERO) and GetUnitAbilityLevel(m, 'Aloc')==0 then
// call ZiYuanAttack(u,m)
// endif
// A0DU
//===========================================================================
function ZiYuanAttack takes unit u,unit m returns nothing
local integer i=0
local integer n=0
local integer g=0
local item t
loop
exitwhen i>5 or n==1
set t=UnitItemInSlot(m, i)
if GetItemTypeId(t) == 'sor9' then
set g=GetItemCharges(t) 
set n=1
endif
set i=i+1
endloop
if g==0 then
else
call DestroyEffect( AddSpecialEffectTarget("war3mapImported\\PulsingFire.mdx", u, "chest") )
call UnitDamageTarget( CreateUnit(GetOwningPlayer(m),'n00T',0,0,0), u, 10*g, true, false, ATTACK_TYPE_HERO, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
endif
set t=null
endfunction


function hqi takes integer i returns integer//最多叠10层
if i>10 then
return 10
else
return i
endif 
endfunction


function Trig_AttackOther_Conditions takes nothing returns boolean
    local unit t=GetEventTargetUnit()
    local unit u=GetTriggerUnit()
    local player p=GetTriggerPlayer()
    local integer i=0
    local integer g=0
    local integer level=0
    if  IsUnitEnemy(t, p) == true then
    call ZiYuanAttack(t,u)
        if GetUnitAbilityLevel(u,'B04E')>0 then//双刀
        set i=GetRandomInt(1,100)
           if i<26 then
           set u=CreateUnit(p,'h007',GetUnitX(t),GetUnitY(t),0)
           call UnitRemoveAbility( u, 'A08O' )
           call UnitAddAbility( u, 'A015' )
           call UnitApplyTimedLife( u, 'BHwe',0.3)
           call IssueTargetOrderById( u, 851983, t )
           endif
        endif
        if GetUnitAbilityLevel(u,'B04H')>0 then//黑撕
        set i=GetHandleId(t)
        set g=LoadInteger(udg_Hash4,i,557)
           if GetUnitAbilityLevel(t,'B040')>0 then
           call SaveInteger(udg_Hash4,i,557,hqi(g+1))
           set level=hqi(g+1)
           else
           call SaveInteger(udg_Hash4,i,557,1)
           set level=1
           endif
        set u=CreateUnit(p,'h007',GetUnitX(t),GetUnitY(t),0)
        call UnitRemoveAbility( u, 'A08O' )
        call UnitAddAbility( u, 'A0DU' )
        call SetUnitAbilityLevel( u, 'A0DU', level)
        call UnitApplyTimedLife( u, 'BHwe',0.3)
        call IssueTargetOrderById( u, 851983, t )
        endif
        if GetUnitAbilityLevel(u,'B04J')>0 then//绿爪
        call UnitDamageTarget( u, t, GetUnitState(t, UNIT_STATE_MAX_LIFE)*0.04, true, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
        endif
        if GetUnitAbilityLevel(u,'B04K')>0 then//阿塔玛
        call UnitDamageTarget( u, t, GetUnitState(u, UNIT_STATE_MAX_LIFE)*0.03, true, false, ATTACK_TYPE_HERO, DAMAGE_TYPE_NORMAL, WEAPON_TYPE_WHOKNOWS )
        endif
    endif
set u=null
set p=null
set t=null
return false
endfunction


//===========================================================================
function InitTrig_AttackOther takes nothing returns nothing
    set gg_trg_AttackOther = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_AttackOther, Condition( function Trig_AttackOther_Conditions ) )
endfunction
