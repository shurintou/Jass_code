
//===========================================================================
// Trigger: Invulnerable Cut
//
// call SetUnitAnimation( u, "attack" )
// function UnitenemyT takes group g,unit u returns integer ////不用了
// local boolean bm=false
// local unit target
// local integer i=0
// loop
// exitwhen bm==true or g==null
// set target=GroupPickRandomUnit(g)
// if IsUnitAlly(target, GetOwningPlayer(u)) == false   then
// set bm=true
// else
// call GroupRemoveUnit(g,target)
// endif
// set i=i+1
// endloop
// call GroupClear(g)
// call DestroyGroup(g)
// set g=null
// set bm=false
// set i=H2I(target)
// set target=null
// return i
// endfunction 
//===========================================================================
function Trig_Invulnerable_Cut_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A02S' 
endfunction

function UnitIsNotStr takes nothing returns boolean 
return IsUnitIdType(GetUnitTypeId(GetFilterUnit()), UNIT_TYPE_STRUCTURE) == false and GetUnitState(GetFilterUnit(), UNIT_STATE_LIFE) > 0.00 ==true and IsUnitEnemy(GetFilterUnit(), GetOwningPlayer(udg_lsu)) == true and GetUnitAbilityLevel(GetFilterUnit(),'Aloc') == 0 and IsUnitType(GetFilterUnit(), UNIT_TYPE_GIANT) == false and IsUnitVisible(GetFilterUnit(), GetOwningPlayer(udg_lsu))==true 
endfunction 

function move takes nothing returns nothing
    local timer tm=GetExpiredTimer()
    local integer m=GetHandleId(tm)
    local unit u=LoadUnitHandle(udg_Hash1, m, 1)
    local integer le=GetUnitAbilityLevel(u,'ANfb')
    local integer i=LoadInteger(udg_Hash1, m, 2)
    local unit target
    local real xCast=GetUnitX(u)
    local real yCast=GetUnitY(u)
    local real x=0
    local real y=0
    local group g=CreateGroup()
    local boolexpr b=Condition(function UnitIsNotStr)
    local real har=0

    set udg_lsu=u
    call GroupEnumUnitsInRange(g,xCast,yCast,500,b) 
    set target=GroupPickRandomUnit(g)
    
    if i>0 and target !=null then
    ////////////////////////////////////
    set x=GetUnitX(target)+GetRandomReal(-75,75)
    set y=GetUnitY(target)+GetRandomReal(-75,75)
    call SetUnitX(u,x)
    call SetUnitY(u,y)
    set har=GetRandomReal(150,250)
    call UnitDamageTarget( u, target, har, true, false, ATTACK_TYPE_HERO, DAMAGE_TYPE_NORMAL, WEAPON_TYPE_WHOKNOWS )
    call SaveInteger(udg_Hash1,m,2,i-1)
    else
    call DestroyEffect( LoadEffectHandle(udg_Hash1, m, 3) )
    call SelectUnitForPlayerSingle( u, GetOwningPlayer(u) )
    call SetUnitAnimation( u, "stand" )
    call FlushChildHashtable( udg_Hash1, m )
    call PauseTimer(tm)
    call DestroyTimer(tm)
    call SetUnitInvulnerable( u, false )
    call SetUnitVertexColor( u, 255, 90, 80, 255 )
    endif
    call GroupClear(g)
    call DestroyGroup(g)
    call DestroyBoolExpr(b)

    set u=null
    set target=null
    set g=null
    set b=null
    set tm=null
endfunction


function InvulnerableCutAct takes nothing returns nothing
    local timer tt=GetExpiredTimer()
    local integer g=GetHandleId(tt)
    local unit u
    local unit target=LoadUnitHandle(udg_Hash3,g,2)
    local timer tm
    local integer n=0
    local integer i=0
    local real har=0
    
    if UnitHasBuffBJ(target,'BUhf') then//没林肯
    set u=LoadUnitHandle(udg_Hash3,g,1)
    set tm=CreateTimer()
    set n=2+(GetUnitAbilityLevel(u,'A02S')*2)
    set i=GetHandleId(tm)
    set har=GetRandomReal(150,250)
    call SetUnitX(u,GetUnitX(target))
    call SetUnitY(u,GetUnitY(target))
    call IssueTargetOrderById( u, 851983, target )
    call UnitDamageTarget( u, target, har, true, false, ATTACK_TYPE_HERO, DAMAGE_TYPE_NORMAL, WEAPON_TYPE_WHOKNOWS )
    call SaveUnitHandle(udg_Hash1,i,1,u)
    call SaveInteger(udg_Hash1,i,2,n)
    call SelectUnitRemoveForPlayer( u, GetOwningPlayer(u) )
    call SetUnitInvulnerable( u, true )
    call SaveEffectHandle( udg_Hash1, i, 3, AddSpecialEffectTarget("Abilities\\Weapons\\PhoenixMissile\\Phoenix_Missile_mini.mdl", u, "weapon") )
    call SetUnitVertexColor( u, 255, 90, 80, 125 )
    call TimerStart(tm,0.4,true,function move)
    set u=CreateUnit(Player(PLAYER_NEUTRAL_AGGRESSIVE),'n001',GetUnitX(target),GetUnitY(target),0)
    call UnitAddAbility(u,'A056')
    call IssueTargetOrderById( u, 852095, target )
    call UnitApplyTimedLife( u, 'BTLF', 5.00 )
    else
    endif
    call UnitRemoveAbility(target,'BUhf')
    call FlushChildHashtable( udg_Hash3, g )
    call PauseTimer(tt)
    call DestroyTimer(tt)

    set tt=null
    set tm=null
    set u=null
    set target=null
endfunction

function Trig_Invulnerable_Cut_Actions takes nothing returns nothing
local timer tm=CreateTimer()
local integer i=GetHandleId(tm)
local unit m=CreateUnit(GetTriggerPlayer(),'n001',0,0,0)
local unit t=GetSpellTargetUnit()

call UnitAddAbility( m, 'Auhf' )
call IssueTargetOrderById( m, 852209, t )
call UnitApplyTimedLife( m, 'BTLF', 5.00 )
call SaveUnitHandle(udg_Hash3,i,2,t)
call SaveUnitHandle(udg_Hash3,i,1,GetTriggerUnit())
call TimerStart(tm,0.01,false,function InvulnerableCutAct)

set tm=null
set m=null
set t=null
endfunction


//===========================================================================
function InitTrig_Invulnerable_Cut takes nothing returns nothing
    set gg_trg_Invulnerable_Cut = CreateTrigger(  )
    
    call TriggerAddCondition( gg_trg_Invulnerable_Cut, Condition( function Trig_Invulnerable_Cut_Conditions ) )
    call TriggerAddAction( gg_trg_Invulnerable_Cut, function Trig_Invulnerable_Cut_Actions )
endfunction
