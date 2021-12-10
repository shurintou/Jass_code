
//===========================================================================
// Trigger: PanDuanHuiJi
//===========================================================================
function Trig_PanDuanHuiJi_Conditions takes nothing returns boolean
    local real r=GetEventDamage()
    return GetTriggerUnit() == GetEventDamageSource() and  r< 5 and r>0 and GetUnitAbilityLevel(GetTriggerUnit(), 'A09Y')>0               
endfunction

function huijidown takes nothing returns nothing
local timer tm=GetExpiredTimer()
local integer i=GetHandleId(tm)
local unit m=LoadUnitHandle(udg_Hash1,i,1)

call SetUnitFlyHeight( m, 0.00, 480.00 )
call FlushChildHashtable( udg_Hash1, i )
call PauseTimer(tm)
call DestroyTimer(tm)

set tm=null
set m=null
endfunction


function Trig_PanDuanHuiJi_Actions takes nothing returns nothing
local timer tm
local integer n
local unit u=GetTriggerUnit()
local unit t=LoadUnitHandle(udg_Hash1,GetHandleId(u),2872)

if GetUnitDefaultFlyHeight(t)<10 then
set tm=CreateTimer()
set n=GetHandleId(tm)
call UnitAddAbility( t, 'Amrf' )
call UnitRemoveAbility( t, 'Amrf' )
call SetUnitFlyHeight(  t, 480.00, 480.00 )
call SaveUnitHandle(udg_Hash1,n,1,t)
call TimerStart(tm,0.75,false,function huijidown)
endif
call DestroyEffect( AddSpecialEffectTarget("war3mapImported\\AncientsWrath.mdx", t, "chest") )
call UnitRemoveAbility( u, 'A0A0' )
call SetPlayerAbilityAvailable( GetTriggerPlayer(), 'A09Z', true )
call DisableTrigger( gg_trg_AttackWithHuiJi )
call DisableTrigger( GetTriggeringTrigger() )

set t=null
set tm=null
set u=null
endfunction

//===========================================================================
function InitTrig_PanDuanHuiJi takes nothing returns nothing
    set gg_trg_PanDuanHuiJi = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_PanDuanHuiJi, Condition( function Trig_PanDuanHuiJi_Conditions ) )
    call TriggerAddAction( gg_trg_PanDuanHuiJi, function Trig_PanDuanHuiJi_Actions )
endfunction
