
//===========================================================================
// Trigger: qixue
//===========================================================================
function Trig_qixue_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A0BT' 
endfunction

function Trig_qixue_Actions takes nothing returns nothing
local integer i=GetRandomInt(1,4)
    if i==2 then
    set udg_WeatherN=i
    call RemoveWeatherEffect( GetLastCreatedWeatherEffect() )
    call DisplayTimedTextToForce( GetPlayersAll(), 30, "|cff7ebff1祈雪成功,天空下起了暴雪|r" )
    call AddWeatherEffectSaveLast( GetPlayableMapRect(), 'SNbs' )
    call EnableWeatherEffect( GetLastCreatedWeatherEffect(), true )
    else
    call DisplayTextToPlayer( GetTriggerPlayer(), 0, 0, "|cff7ebff1祈雪失败|r" )
    endif
endfunction

//===========================================================================
function InitTrig_qixue takes nothing returns nothing
    set gg_trg_qixue = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_qixue, Condition( function Trig_qixue_Conditions ) )
    call TriggerAddAction( gg_trg_qixue, function Trig_qixue_Actions )
endfunction
