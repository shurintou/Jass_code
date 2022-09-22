
//===========================================================================
// Trigger: attacked
//===========================================================================



function Trig_attacked_Conditions takes nothing returns boolean
    local unit u=GetTriggerUnit()
    if IsUnitAlly(GetAttacker(), GetOwningPlayer(u)) == true  then
    if GetUnitAbilityLevel(u,'BEsh')>0 or GetUnitAbilityLevel(u,'BNdo')>0 then
    set u=null
    return false
    else
    call IssueImmediateOrderById( GetAttacker(), 851972 )  
    set u=null
    return false
    endif
    else
    set u=null
    return true  
    endif
    set u=null
endfunction



function Trig_attacked_Actions takes nothing returns nothing
    local unit u=GetTriggerUnit()
    local unit m=GetAttacker()
    local integer i=GetUnitAbilityLevel(u,'A04E')
    local integer n=GetUnitAbilityLevel(u,'AEah')
    local real h=0
    call UnitRemoveAbility( m, 'B021' )
if i>0 then
set u=CreateUnit(Player(bj_PLAYER_NEUTRAL_EXTRA),'n001',0,0,0)
call UnitAddAbility( u, 'A04F' )
call SetUnitAbilityLevel( u, 'A04F', i )
call UnitApplyTimedLife( u, 'BTLF', 60 )
call IssueTargetOrderById( u, 852075, m)

endif

if n>0 then
set i=GetHeroStr(u,true)
set h=18+8*n
call DestroyEffect( AddSpecialEffectTarget("Abilities\\Spells\\NightElf\\ThornsAura\\ThornsAuraDamage.mdl", m, "head") )
call UnitDamageTarget( u, m, 10+0.01*h*i , true, false, ATTACK_TYPE_HERO, DAMAGE_TYPE_NORMAL, WEAPON_TYPE_WHOKNOWS )

endif

if GetUnitAbilityLevel(u,'B03F')>0 then
set i=GetRandomInt(1,100)
   if i<26 then
   set udg_lsu=CreateUnit(GetOwningPlayer(LoadUnitHandle(udg_Hash3,GetHandleId(u),4923)),'n001',GetUnitX(u),GetUnitY(u),0)
   call UnitAddAbility(udg_lsu, 'ACcl' )
   call UnitApplyTimedLife( udg_lsu, 'BTLF', 3 )
   call IssueTargetOrderById( udg_lsu, 852119, m )
   endif
endif


if IsUnitIllusion(m) == true and GetUnitAbilityLevel(m, 'AEev')>0 then
if GetUnitAbilityLevel(m, 'B01A')>0 or GetUnitAbilityLevel(m, 'BOmi')>0 then
call huangwuzhunbei(m,u)
endif
endif

if GetUnitAbilityLevel(u,'B04G')>0 then//军团
set i=LoadInteger(udg_Hash2,GetHandleId(u),8529)
call SetPlayerAbilityAvailable( GetTriggerPlayer(), 'A0DS', true )
    if i==1 then
    set n=GetHeroStr(u,true)
    else
    if i==2 then
    set n=GetHeroAgi(u,true)
    else
    if i==3 then
    set n=GetHeroInt(u,true)
    endif
    endif
    endif
call SetUnitAbilityLevel( u, 'A0DS', R2I(n/9)+1 )
else
call SetPlayerAbilityAvailable( GetTriggerPlayer(), 'A0DS', false )
endif


set u=null
set m=null
endfunction



//===========================================================================
function InitTrig_attacked takes nothing returns nothing
    set gg_trg_attacked = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_attacked, Condition( function Trig_attacked_Conditions ) )
    call TriggerAddAction( gg_trg_attacked, function Trig_attacked_Actions )
endfunction
