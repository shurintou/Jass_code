
//===========================================================================
// Trigger: ImpleCast
//
// if GetUnitDefaultFlyHeight(u)<10 then
// call SetUnitFlyHeight( u, 0.00, 1080.00 )
// endif
// endloop
//===========================================================================


//===========================================================================
//       掘地穿刺 
//===========================================================================
function Trig_ImpleCast_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A032' 
endfunction

function ImpleCast_inj takes nothing returns nothing
    local timer t = GetExpiredTimer()
    local integer k=GetHandleId(t)
    local unit u1=LoadUnitHandle(udg_Hash1,k,1)
    local unit u2=LoadUnitHandle(udg_Hash1,k,2)
    local unit u3
    local integer i=LoadInteger(udg_Hash1,k,3)+1 
    if i==1 then  
      call SaveInteger(udg_Hash1,k,3,i)
      call TimerStart(t,0.29,false,function ImpleCast_inj)      
      set u3=CreateUnit(GetOwningPlayer(u1),'h007',GetUnitX(u2),GetUnitY(u2),0)
      call UnitApplyTimedLife( u3, 'BHwe',0.3)
      call IssueTargetOrderById( u3, 851983, u2 )
    elseif i==2 then
      call UnitDamageTarget( u1, u2, 40+(60*GetUnitAbilityLevel(u1,'A032')), true, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
      call SaveInteger(udg_Hash1,k,3,i)
      call TimerStart(t,0.05,false,function ImpleCast_inj)
    elseif i==3 then
      if GetUnitDefaultFlyHeight(u2)<10 then
      call SetUnitFlyHeight(u2,0, 1850.00 )
      endif
      call SaveInteger(udg_Hash1,k,3,i)
      call TimerStart(t,0.7,false,function ImpleCast_inj)
    elseif i>=4 then
      if GetUnitDefaultFlyHeight(u2)<10 then
      call SetUnitFlyHeight(u2,0,1800000 )
      endif
      call DestroyTimer(t)
      call FlushChildHashtable(udg_Hash1,k)
    endif
    set t=null
    set u1=null
    set u2=null
    set u3=null
endfunction

function ImpleCast takes nothing returns nothing
  local timer t=GetExpiredTimer()
  local integer k=GetHandleId(t)
  local timer t2
  local integer k2
  local real x=LoadReal(udg_Hash1,k,1)
  local real y=LoadReal(udg_Hash1,k,2)
  local real a=LoadReal(udg_Hash1,k,3)
  local real i=LoadReal(udg_Hash1,k,4)+1
  local group g0=LoadGroupHandle(udg_Hash1,k,5)
  local unit u0=LoadUnitHandle(udg_Hash1,k,6)
  local real n=LoadReal(udg_Hash1,k,7) 
  local unit u1
  local unit u2
  local group g=CreateGroup()
  local location p_1=Location(x,y)
  local location p_2=PolarProjectionBJ(p_1,i*50,a)
  local unit u
  if ModuloReal(i,3)==0 then
  call DestroyEffect( AddSpecialEffectLoc("Abilities\\Spells\\Undead\\Impale\\ImpaleMissTarget.mdl",p_2) )
  endif
  call GroupEnumUnitsInRange(g,GetLocationX(p_2),GetLocationY(p_2),120,null)
     loop
      set u1 = FirstOfGroup(g)   
      exitwhen u1==null 
       call GroupRemoveUnit(g,u1) 
       if GetUnitState(u1, UNIT_STATE_LIFE) > 0.00 ==true and IsUnitType(u1, UNIT_TYPE_MECHANICAL) ==false  and IsUnitType(u1, UNIT_TYPE_GIANT) == false and GetUnitAbilityLevel(u1,'Aloc')==0 and IsUnitEnemy(u1, GetOwningPlayer(u0))  and (IsUnitInGroup(u1, g0)==false) then
          if IsUnitType(u1, UNIT_TYPE_STRUCTURE) then
          else
           call GroupAddUnit(g0,u1)
           set t2=CreateTimer()
           set k2=GetHandleId(t2)
           call SaveUnitHandle(udg_Hash1,k2,1,u0)
           call SaveUnitHandle(udg_Hash1,k2,2,u1)
           call SaveInteger(udg_Hash1,k2,3,0)
           call TimerStart(t2,0.01,false,function ImpleCast_inj)
           set t2 = null
           //===
            call DestroyEffect( AddSpecialEffect("Abilities\\Spells\\Undead\\Impale\\ImpaleHitTarget.mdl",GetUnitX(u1),GetUnitY(u1)) )
            call UnitAddAbility( u1, 'Arav' )
            call UnitRemoveAbility( u1, 'Arav' )
            if GetUnitDefaultFlyHeight(u1)<10 then
            call SetUnitFlyHeight(u1,450.00, 1750.00 )
            endif
          endif 
       endif
       set u1 = null
    endloop 
//=============    
     if i<n-1 then
        call SaveReal(udg_Hash1,k,4,i)
        call TimerStart(t,0.02,false,function ImpleCast)
      else
        call DestroyTimer(t)
        call DestroyGroup(g0)
        call FlushChildHashtable(udg_Hash1,k)
      endif
    //========
    set t=null
    set t2=null
    set u=null
    set u0=null
    set u1=null
    set u2=null
    call DestroyGroup(g)
    set g=null
    set g0=null
    
    call RemoveLocation(p_1)
    set p_1=null 
    call RemoveLocation(p_2)
    set p_2=null 
endfunction


function ImpleCast_Move takes nothing returns nothing
  local timer t=GetExpiredTimer()
  local integer k=GetHandleId(t)
  local real x=LoadReal(udg_Hash1,k,1)
  local real y=LoadReal(udg_Hash1,k,2)
  local unit u=LoadUnitHandle(udg_Hash1,k,3)
   call SetUnitAnimation(u, "morph alternate" )
   call SetUnitPosition(u,x,y)
   call DestroyTimer(t)
   call FlushChildHashtable(udg_Hash1,k)
   set t=null
   set u=null
endfunction

function Trig_ImpleCast_Actions takes nothing returns nothing
   local timer t = CreateTimer()
   local integer k=GetHandleId(t)
   local location p_1 = GetUnitLoc(GetTriggerUnit())
   local location p_2 = GetSpellTargetLoc()
   local real a = AngleBetweenPoints(p_1, p_2)
   local real r=DistanceBetweenPoints(p_1,p_2)+150 
   call SaveReal(udg_Hash1,k,1,GetLocationX(p_1))
   call SaveReal(udg_Hash1,k,2,GetLocationY(p_1))
   call SaveReal(udg_Hash1,k,3,a)
   call SaveReal(udg_Hash1,k,4,0)
   call SaveGroupHandle(udg_Hash1,k,5,CreateGroup())
   call SaveUnitHandle(udg_Hash1,k,6,GetTriggerUnit())
   call SaveReal(udg_Hash1,k,7,(r/50))
   call TimerStart(t,0.02,false,function ImpleCast)
   set t=null
   set t=CreateTimer()
   set k=GetHandleId(t)
   call SaveReal(udg_Hash1,k,1,GetLocationX(p_2))
   call SaveReal(udg_Hash1,k,2,GetLocationY(p_2))
   call SaveUnitHandle(udg_Hash1,k,3,GetTriggerUnit())
   call TimerStart(t,(r/2500),false,function ImpleCast_Move)
   
    call RemoveLocation(p_1)
    set p_1 = null
    call RemoveLocation(p_2)
    set p_2 = null
   set t=null
endfunction


//===========================================================================
function InitTrig_ImpleCast takes nothing returns nothing
    set gg_trg_ImpleCast = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_ImpleCast, Condition( function Trig_ImpleCast_Conditions ) )
    call TriggerAddAction( gg_trg_ImpleCast, function Trig_ImpleCast_Actions )
endfunction
