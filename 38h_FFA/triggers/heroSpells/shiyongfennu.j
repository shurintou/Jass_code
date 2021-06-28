
//===========================================================================
// Trigger: shiyongfennu
//===========================================================================
function Trig_shiyongfennu_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A0CQ' 
endfunction

function wujinfennuact takes nothing returns nothing
local timer tm=GetExpiredTimer()
local integer i=GetHandleId(tm)
local unit u=LoadUnitHandle(udg_Hash1, i, 1)
call DisableTrigger( gg_trg_wujindefennu )
call UnitRemoveAbility( u, 'A0CR' )
call UnitRemoveAbility( u, 'B046' )
call SetPlayerAbilityAvailable( GetOwningPlayer(u), 'A0CQ', true )
call DestroyEffect(LoadEffectHandle(udg_Hash1,i,2))
call FlushChildHashtable( udg_Hash1, i )
call PauseTimer(tm)
call DestroyTimer(tm)
    
set tm=null
set u=null
endfunction



function Trig_shiyongfennu_Actions takes nothing returns nothing
local timer tm=CreateTimer()
local integer i=GetHandleId(tm)
local unit u=GetTriggerUnit()
call SaveUnitHandle(udg_Hash1,i,1,u)
call SaveEffectHandle(udg_Hash1,i,2,AddSpecialEffectTarget("war3mapImported\\BloodBuff.mdx", u, "origin"))
call TimerStart(tm,3+GetUnitAbilityLevel(u, 'A0CQ'),false,function wujinfennuact)
call SetPlayerAbilityAvailable( GetOwningPlayer(u), 'A0CQ', false )
call EnableTrigger( gg_trg_wujindefennu )
call UnitAddAbility( u, 'A0CR' )
set tm=null
set u=null
endfunction

//===========================================================================
function InitTrig_shiyongfennu takes nothing returns nothing
    set gg_trg_shiyongfennu = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_shiyongfennu, Condition( function Trig_shiyongfennu_Conditions ) )
    call TriggerAddAction( gg_trg_shiyongfennu, function Trig_shiyongfennu_Actions )
endfunction
