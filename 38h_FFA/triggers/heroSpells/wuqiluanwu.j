
//===========================================================================
// Trigger: wuqiluanwu
//
// function movelww takes nothing returns nothing
//     local timer tm=GetExpiredTimer()
//     local integer m=GetHandleId(tm)
//     local unit u=LoadUnitHandle(udg_Hash1, m, 1)
//     local integer le=GetUnitAbilityLevel(u,'A0CY')
//     local integer i=LoadInteger(udg_Hash1, m, 2)
//     local group g=LoadGroupHandle(udg_Hash1, m, 4)
//     local unit target=GroupPickRandomUnit(g)
//     local real x
//     local real y
//     if target!=null then
//     ////////////////////////////////////
//     set x=GetUnitX(target)+GetRandomReal(-45,45)
//     set y=GetUnitY(target)+GetRandomReal(-45,45)
//     call SetUnitX(u,x)
//     call SetUnitY(u,y)
//     call UnitDamageTarget( u, target, 20*le, true, false, ATTACK_TYPE_HERO, DAMAGE_TYPE_NORMAL, WEAPON_TYPE_WHOKNOWS )
//     call IssueTargetOrderById( u, 851983, target )
//     call GroupRemoveUnit(g,target)
//     else
//     set target=LoadUnitHandle(udg_Hash1, m, 2)
//     set x=GetUnitX(target)+GetRandomReal(-45,45)
//     set y=GetUnitY(target)+GetRandomReal(-45,45)
//     call SetUnitX(u,x)
//     call SetUnitY(u,y)
//     call UnitRemoveAbility( u, 'A03E' )
//     call DestroyEffect( LoadEffectHandle(udg_Hash1, m, 3) )
//     call SelectUnitForPlayerSingle( u, GetOwningPlayer(u) )
//     call SetUnitAnimation( u, "stand" )
//     call FlushChildHashtable( udg_Hash1, m )
//     call PauseTimer(tm)
//     call DestroyTimer(tm)
//     call SetUnitInvulnerable( u, false )
//     call SetUnitVertexColor( u, 255, 255, 255, 255 )
//     call GroupClear(g)
//     call DestroyGroup(g)
//     endif
//    
//     set u=null
//     set target=null
//     set g=null
//     set tm=null
// endfunction
//===========================================================================
function Trig_wuqiluanwu_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A0CY' 
endfunction


function UnitIsNotLWW takes nothing returns boolean 
return IsUnitIdType(GetUnitTypeId(GetFilterUnit()), UNIT_TYPE_STRUCTURE) == false and GetUnitState(GetFilterUnit(), UNIT_STATE_LIFE) > 0.00 ==true and IsUnitEnemy(GetFilterUnit(), GetOwningPlayer(udg_lsu)) == true and GetUnitAbilityLevel(GetFilterUnit(),'Aloc') == 0 and IsUnitType(GetFilterUnit(), UNIT_TYPE_GIANT) == false and IsUnitVisible(GetFilterUnit(), GetOwningPlayer(udg_lsu))==true and IsUnitType(GetFilterUnit(), UNIT_TYPE_ETHEREAL) == false
endfunction 


function Trig_wuqiluanwu_Actions takes nothing returns nothing
local unit target=GetSpellTargetUnit()
local unit u=GetTriggerUnit()
local integer i=GetHandleId(gg_trg_wuqiluanwu)
local group g=CreateGroup()
local boolexpr b
    set udg_lsu=u
    set b=Condition(function UnitIsNotLWW)
    call UnitAddAbility( u, 'A03E' )
    call UnitAddAbility( u, 'A0D0' )
    //call UnitAddAbility( u, 'ACm2' )
    call GroupEnumUnitsInRange(g,GetUnitX(target),GetUnitY(target),500,b) 
    call SetUnitX(u,GetUnitX(target))
    call SetUnitY(u,GetUnitY(target))
    call IssueTargetOrderById( u, 851983, target )
    call UnitDamageTarget( u, target, 20*GetUnitAbilityLevel(u, 'A0CY'), true, false, ATTACK_TYPE_HERO, DAMAGE_TYPE_NORMAL, WEAPON_TYPE_WHOKNOWS )
    call SaveUnitHandle(udg_Hash1,i,1,u)
    call SaveUnitHandle(udg_Hash1,i,2,target)
    call SaveGroupHandle(udg_Hash1,i,4,g)
    call SelectUnitRemoveForPlayer( u, GetOwningPlayer(u) )
   // call SetUnitInvulnerable( u, true )
    call SaveEffectHandle( udg_Hash1, i, 3, AddSpecialEffectTarget("Abilities\\Weapons\\PhoenixMissile\\Phoenix_Missile_mini.mdl", u, "weapon") )
    call SetUnitVertexColor( u, 255, 255, 255, 125 )
    call DestroyBoolExpr(b)
    call GroupRemoveUnit(g,target)
    call EnableTrigger( gg_trg_buzhuowuqi )
    call EnableTrigger( gg_trg_buzhuomubiaodanwei )
    set u=null
    set target=null
    set g=null
    set b=null
endfunction

//===========================================================================
function InitTrig_wuqiluanwu takes nothing returns nothing
    set gg_trg_wuqiluanwu = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_wuqiluanwu, Condition( function Trig_wuqiluanwu_Conditions ) )
    call TriggerAddAction( gg_trg_wuqiluanwu, function Trig_wuqiluanwu_Actions )
endfunction
