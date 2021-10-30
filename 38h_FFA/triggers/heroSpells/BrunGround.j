
//===========================================================================
// Trigger: BrunGround
//
// call UnitAddAbility( null, 'A041' )
//     call SetUnitAbilityLevel( null, 'A041', GetUnitAbilityLevel(GetTriggerUnit(), 'A041') )
//    
//     call UnitApplyTimedLife( null, 'BTLF', 60 )
//  call SetPlayerAbilityAvailable( Player(0), 'A041', false )
// Amgl
//===========================================================================
function Trig_BrunGround_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'ANsg' 
endfunction


function burngroundact takes nothing returns nothing
local timer tm=GetExpiredTimer()
local integer i=GetHandleId(tm)
local unit u
local unit m
local integer n=LoadInteger(udg_Hash1,i,2)
local real level=0
local player p

if n>0 then
set u=LoadUnitHandle(udg_Hash1,i,1)
set m=LoadUnitHandle(udg_Hash1,i,3)
set level=0.5+GetUnitAbilityLevel(u, 'ANsg')
call SetUnitX(m,GetUnitX(u))
call SetUnitY(m,GetUnitY(u))
call SetUnitState( u, UNIT_STATE_LIFE, GetUnitState(u, UNIT_STATE_LIFE)+level )
call SaveInteger(udg_Hash1,i,2,n-1)
else
set u=LoadUnitHandle(udg_Hash1,i,1)
set p=GetOwningPlayer(u)
call UnitRemoveAbility( u, 'Amgl' )
call SetPlayerAbilityAvailable( p, 'A046', false )
call SetPlayerAbilityAvailable( p, 'ANsg', true )
call UnitRemoveAbility( u, 'B01B' )
call FlushChildHashtable( udg_Hash1, i )
call PauseTimer(tm)
call DestroyTimer(tm)
endif

set tm=null
set u=null
set m=null
set p=null
endfunction



function Trig_BrunGround_Actions takes nothing returns nothing
local unit u=GetTriggerUnit()
local timer tm=CreateTimer()
local integer i=GetHandleId(tm)
local integer level=GetUnitAbilityLevel(u, 'ANsg')
local real x=GetUnitX(u)
local real y=GetUnitY(u)
local player p=GetTriggerPlayer()
local unit m=CreateUnit(p,'n001',x,y,0)

call UnitAddAbility( u, 'B01B' )
call SetUnitAbilityLevel( u, 'A046', level )
call SetPlayerAbilityAvailable( p, 'A046', true )
call UnitAddAbility( m, 'ANst' )
call SetUnitAbilityLevel( m, 'ANst', level )
call UnitApplyTimedLife( m, 'BTLF', 60 )
call IssuePointOrderById( m, 852593, x, y )
call SaveUnitHandle(udg_Hash1,i,1,u)
call SaveUnitHandle(udg_Hash1,i,3,m)
call SaveInteger(udg_Hash1,i,2,60+(20*level))
call SetPlayerAbilityAvailable( p, 'ANsg', false )
call UnitAddAbility( u, 'Amgl' )
call TimerStart(tm,0.1,true,function burngroundact)

set m=null
set u=null
set tm=null
set p=null
endfunction

//===========================================================================
function InitTrig_BrunGround takes nothing returns nothing
    set gg_trg_BrunGround = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_BrunGround, Condition( function Trig_BrunGround_Conditions ) )
    call TriggerAddAction( gg_trg_BrunGround, function Trig_BrunGround_Actions )
endfunction
