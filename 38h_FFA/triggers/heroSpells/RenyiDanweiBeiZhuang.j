
//===========================================================================
// Trigger: RenyiDanweiBeiZhuang
//
// 施法：160  影响区域：250
//===========================================================================
function Trig_RenyiDanweiBeiZhuang_Conditions takes nothing returns boolean
    return GetUnitTypeId(GetTransportUnit()) == 'Nsjs' 
endfunction

function panduanZ takes unit u returns boolean
local location l=GetUnitLoc(u)
local real r=GetLocationZ(l)

if r<295 then
call RemoveLocation(l)
set l=null
return false
else
call RemoveLocation(l)
set l=null
return true
endif

endfunction




function tunshiharm takes nothing returns nothing
    local timer tm = GetExpiredTimer()
    local integer i=GetHandleId(tm)
    local unit u =LoadUnitHandle(udg_Hash1,i,1)
    local unit t =LoadUnitHandle(udg_Hash1,i,2)
    local integer n
    local integer level
    local integer ulevel
    local integer mlevel
if IsUnitLoaded(t) then
    set level=LoadInteger(udg_Hash1,GetHandleId(t),8503)//层数
    set ulevel=GetUnitAbilityLevel(u,'A09G')
    set mlevel=GetUnitAbilityLevel(u,'A09O')
    call UnitShareVision( u, GetOwningPlayer(t), true )
    if IsUnitType(t, UNIT_TYPE_HERO) then
    set n=LoadInteger(udg_Hash1,i,3)      
          if n>1 then
               if GetUnitAbilityLevel(t,'B035')>0 then
               call UnitDamageTarget(u, t, (10+5*ulevel)+mlevel*level, false, false, ATTACK_TYPE_CHAOS, DAMAGE_TYPE_UNKNOWN, WEAPON_TYPE_WHOKNOWS)
               else
               call UnitDamageTarget(u, t, 10+5*ulevel, false, false, ATTACK_TYPE_CHAOS, DAMAGE_TYPE_UNKNOWN, WEAPON_TYPE_WHOKNOWS)
               endif
          call SaveInteger(udg_Hash1,i,3,n-1)
          else
          call IssueTargetOrderById( u, 852047, t )
          endif      
    else
          if  GetUnitAbilityLevel(t,'B035')>0 then
          call UnitDamageTarget(u, t, 2.5*ulevel+2.5*mlevel*level, false, false, ATTACK_TYPE_CHAOS, DAMAGE_TYPE_UNKNOWN, WEAPON_TYPE_WHOKNOWS)
          else
          call UnitDamageTarget(u, t, 2.5*ulevel, false, false, ATTACK_TYPE_CHAOS, DAMAGE_TYPE_UNKNOWN, WEAPON_TYPE_WHOKNOWS)
          endif
    endif
else
    call UnitShareVision( u, GetOwningPlayer(t), false )
    if GetUnitState(t, UNIT_STATE_LIFE) >0 then
    call SetUnitAnimation( u, "puke" )
    call QueueUnitAnimation( u, "stand" )
    endif
    call PauseTimer(tm)
    call DestroyTimer(tm)
    call FlushChildHashtable( udg_Hash1, i )
        
endif

set t=null
set u=null
set tm=null
endfunction

function Trig_RenyiDanweiBeiZhuang_Actions takes nothing returns nothing
    local unit u = GetTransportUnit()
    local unit t = GetLoadedUnit()
    local timer tm = CreateTimer()
    local integer i=GetHandleId(tm)
    
    if IsUnitType(t, UNIT_TYPE_HERO) then
    call SaveInteger(udg_Hash1,i,3,12+4*GetUnitAbilityLevel(u,'A09G'))
    endif
    call SaveUnitHandle(udg_Hash1, i, 1, u)
    call SaveUnitHandle(udg_Hash1, i, 2, t)
    call TimerStart(tm, 0.5, true, function tunshiharm)
    set u = null
    set t = null
    set tm = null
endfunction

//===========================================================================
function InitTrig_RenyiDanweiBeiZhuang takes nothing returns nothing
    set gg_trg_RenyiDanweiBeiZhuang = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_RenyiDanweiBeiZhuang, EVENT_PLAYER_UNIT_LOADED )
    call TriggerAddCondition( gg_trg_RenyiDanweiBeiZhuang, Condition( function Trig_RenyiDanweiBeiZhuang_Conditions ) )
    call TriggerAddAction( gg_trg_RenyiDanweiBeiZhuang, function Trig_RenyiDanweiBeiZhuang_Actions )
endfunction
