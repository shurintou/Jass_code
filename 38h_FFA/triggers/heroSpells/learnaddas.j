
//===========================================================================
// Trigger: learnaddas
//===========================================================================
function Trig_learnaddas_Conditions takes nothing returns boolean
    return GetLearnedSkill() == 'ANba' and GetUnitAbilityLevel(GetTriggerUnit(),'ANba')==2
endfunction


function checkhp takes nothing returns nothing
local unit u=LoadUnitHandle(udg_Hash1, GetHandleId(GetExpiredTimer()), 1)
local integer level=GetUnitAbilityLevel(u,'ANba')
local real h=GetUnitState(u, UNIT_STATE_LIFE)*100
local real mh=GetUnitState(u, UNIT_STATE_MAX_LIFE)
local integer prhp=R2I(h/mh)
local integer i=R2I((100-prhp)/7)





call SetUnitAbilityLevel( u, 'AIat', i*level )
call SetUnitAbilityLevel( u, 'AIsx', i*level )


set u=null
endfunction



function Trig_learnaddas_Actions takes nothing returns nothing
    local unit u=GetTriggerUnit()
    local timer tm=CreateTimer()
    local integer i=GetHandleId(tm)
    call SaveUnitHandle(udg_Hash1,i,1,u)
    //call UnitAddAbility( u, 'AIat' )
    call SetPlayerAbilityAvailable( GetOwningPlayer(u), 'AIat', true )
    call SetPlayerAbilityAvailable( GetOwningPlayer(u), 'AIsx', true )  
    call SetUnitAbilityLevel( u, 'AIat',2)
    call TimerStart(tm,0.1,true,function checkhp)
    call DestroyTrigger( GetTriggeringTrigger() )
    //call TriggerSleepAction( 2 )
    //call UnitAddAbility( u, 'AIsx' )    
    call SetUnitAbilityLevel( u, 'AIsx',2)
    set tm=null
    set u=null
endfunction

//===========================================================================
function InitTrig_learnaddas takes nothing returns nothing
    set gg_trg_learnaddas = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_learnaddas, Condition( function Trig_learnaddas_Conditions ) )
    call TriggerAddAction( gg_trg_learnaddas, function Trig_learnaddas_Actions )
endfunction
