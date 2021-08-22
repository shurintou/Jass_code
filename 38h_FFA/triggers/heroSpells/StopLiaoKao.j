
//===========================================================================
// Trigger: StopLiaoKao
//===========================================================================
function Trig_StopLiaoKao_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A0AE' 
endfunction

function Trig_StopLiaoKao_Actions takes nothing returns nothing
local unit u=GetTriggerUnit()
local timer tm=LoadTimerHandle(udg_Hash1,GetHandleId(u),5675)
local integer i=GetHandleId(tm)

  call RemoveUnit(LoadUnitHandle(udg_Hash1,i,2))
  call UnitRemoveAbility( u, 'A0AE' )
  call SetPlayerAbilityAvailable( GetOwningPlayer(u), 'A0AD', true )
  call FlushChildHashtable( udg_Hash1, i )
  call PauseTimer(tm)
  call DestroyTimer(tm)

set u=null
set tm=null
endfunction

//===========================================================================
function InitTrig_StopLiaoKao takes nothing returns nothing
    set gg_trg_StopLiaoKao = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_StopLiaoKao, Condition( function Trig_StopLiaoKao_Conditions ) )
    call TriggerAddAction( gg_trg_StopLiaoKao, function Trig_StopLiaoKao_Actions )
endfunction
