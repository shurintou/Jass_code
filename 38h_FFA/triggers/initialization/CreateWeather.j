
//===========================================================================
// Trigger: CreateWeather
//
// 大雨 暴雪 大风  无//1,2,3,4
//===========================================================================
function Trig_CreateWeather_Actions takes nothing returns nothing
    local integer i=GetRandomInt(1,4)
    set udg_WeatherN=i
    call RemoveWeatherEffect( GetLastCreatedWeatherEffect() )
    if i==1 then//大雨
    call AddWeatherEffectSaveLast( GetPlayableMapRect(), 'RAhr' )
    call EnableWeatherEffect( GetLastCreatedWeatherEffect(), true )
    call DisplayTimedTextToForce( GetPlayersAll(), 30, "|cff7ebff1天空下起了大雨|r" )
    else
    if i==2 then
    call DisplayTimedTextToForce( GetPlayersAll(), 30, "|cff7ebff1天空下起了暴雪|r" )
    call AddWeatherEffectSaveLast( GetPlayableMapRect(), 'SNbs' )
    call EnableWeatherEffect( GetLastCreatedWeatherEffect(), true )
    else
    if i==3 then
    call DisplayTimedTextToForce( GetPlayersAll(), 30, "|cff7ebff1开始刮飓风了!|r" )
    call AddWeatherEffectSaveLast( GetPlayableMapRect(), 'WNcw' )
    call EnableWeatherEffect( GetLastCreatedWeatherEffect(), true )
    else
    if i==4 then
    call EnableWeatherEffect( GetLastCreatedWeatherEffect(), false )
    endif
    endif
    endif
    endif
endfunction

//===========================================================================
function InitTrig_CreateWeather takes nothing returns nothing
    set gg_trg_CreateWeather = CreateTrigger(  )
    call TriggerRegisterTimerEventPeriodic( gg_trg_CreateWeather, 120.00 )
    call TriggerAddAction( gg_trg_CreateWeather, function Trig_CreateWeather_Actions )
endfunction
