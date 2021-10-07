
//===========================================================================
// Trigger: attackevil
//===========================================================================
function Trig_attackevil_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A087' 
endfunction


function removeda takes nothing returns nothing
local timer tm=GetExpiredTimer()
local integer i=GetHandleId(tm)
local unit u=LoadUnitHandle(udg_Hash1,i,1)
call UnitRemoveAbility( u, 'A07Y' )
call SetPlayerAbilityAvailable( GetOwningPlayer(u), 'Astn', true )
call UnitRemoveAbility( u, 'Amgl' )
call SetPlayerAbilityAvailable( GetOwningPlayer(u), 'A087', true )
    



call FlushChildHashtable( udg_Hash1, i )
call PauseTimer(tm)
call DestroyTimer(tm)
   
set tm=null
set u=null
endfunction

function Trig_attackevil_Actions takes nothing returns nothing
    local timer tm=CreateTimer()
    local unit u=GetTriggerUnit()
    local integer i=GetHandleId(tm)
    
    call TimerStart(tm,4+2*GetUnitAbilityLevel(u,'A087'),false,function removeda)
    call SaveUnitHandle(udg_Hash1,i,1,u)
    call SetPlayerAbilityAvailable( GetTriggerPlayer(), 'Astn', false )
    call UnitAddAbility( u, 'A07Y' )
    call SetPlayerAbilityAvailable( GetTriggerPlayer(), 'A087', false )
    call UnitAddAbility( u, 'Amgl' )
    
    set tm=null
    set u=null
endfunction

//===========================================================================
function InitTrig_attackevil takes nothing returns nothing
    set gg_trg_attackevil = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_attackevil, Condition( function Trig_attackevil_Conditions ) )
    call TriggerAddAction( gg_trg_attackevil, function Trig_attackevil_Actions )
endfunction
