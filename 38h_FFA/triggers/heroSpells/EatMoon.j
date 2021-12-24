
//===========================================================================
// Trigger: EatMoon
//
// call UnitAddAbility( null, 'A041' )
// call SetUnitAbilityLevel( null, 'A041', GetUnitAbilityLevel(GetTriggerUnit(), 'A041') )
// call SetPlayerAbilityAvailable( Player(0), 'A041', false )
// call UnitApplyTimedLife( null, 'BTLF', 60 )
//===========================================================================
function Trig_EatMoon_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A049' 
endfunction


function UnitIsNotEMoon takes nothing returns boolean 
return IsUnitIdType(GetUnitTypeId(GetFilterUnit()), UNIT_TYPE_STRUCTURE) == false and GetUnitState(GetFilterUnit(), UNIT_STATE_LIFE) > 0.00 ==true and IsUnitEnemy(GetFilterUnit(), GetOwningPlayer(udg_lsu)) == true and GetUnitAbilityLevel(GetFilterUnit(),'Aloc') == 0 and IsUnitType(GetFilterUnit(), UNIT_TYPE_GIANT) == false and IsUnitVisible(GetFilterUnit(), GetOwningPlayer(udg_lsu))==true 
endfunction 

function eatmoonact takes nothing returns nothing
    local timer tm=GetExpiredTimer()
    local integer m=GetHandleId(tm)
    local unit u=LoadUnitHandle(udg_Hash1, m, 1)
    local integer i=LoadInteger(udg_Hash1, m, 2)
    local unit target
    local group g
    local boolexpr b
    local unit um
    
    
    if i>0 and GetUnitState(u, UNIT_STATE_LIFE)>0 then
    ////////////////////////////////////
    set g=CreateGroup()
    set b=Condition(function UnitIsNotStr)
    set udg_lsu=u
    call GroupEnumUnitsInRange(g,GetUnitX(u),GetUnitY(u),700,b) 
    set target=GroupPickRandomUnit(g)
    set um=CreateUnit(GetOwningPlayer(u),'n001',GetUnitX(target),GetUnitY(target),0)
    call UnitAddAbility( um, 'A04A' )
    call SetUnitAbilityLevel( um, 'A04A', GetUnitAbilityLevel(u, 'A048') )
    call IssueTargetOrderById( um, 852095, target )
    call UnitApplyTimedLife( um, 'BTLF', 5 )
    call SaveInteger(udg_Hash1,m,2,i-1)
    call GroupClear(g)
    call DestroyGroup(g)
    call DestroyBoolExpr(b)
    else
    set i=LoadInteger(udg_Hash1, m, 3)
    call EnableWeatherEffect( udg_weather[i], false )
    call RemoveWeatherEffect( udg_weather[i] )
    set udg_weather[i]=null
    call FlushChildHashtable( udg_Hash1, m )
    call PauseTimer(tm)
    call DestroyTimer(tm)
    endif
    

    set u=null
    set target=null
    set g=null
    set b=null
    set um=null
    set tm=null
endfunction


function Trig_EatMoon_Actions takes nothing returns nothing
    local unit u=GetTriggerUnit()
    local timer tm=CreateTimer()
    local integer i=GetHandleId(tm)
    local integer n=1
    local integer g=0
    

    loop
    exitwhen g==5
    if udg_weather[n]==null then
    set udg_weather[n]=AddWeatherEffect(GetPlayableMapRect(), 'LRma')
    call EnableWeatherEffect( udg_weather[n], true )
    set g=5
    else
    set n=n+1
    endif
    endloop
    call SaveInteger(udg_Hash1,i,3,n)
    call SaveUnitHandle(udg_Hash1,i,1,u)
    call SaveInteger(udg_Hash1,i,2,1+3*GetUnitAbilityLevel(u, 'A049'))
    call TimerStart(tm,0.6,true,function eatmoonact)
    
    
    set tm=null
    set u=null
endfunction

//===========================================================================
function InitTrig_EatMoon takes nothing returns nothing
    set gg_trg_EatMoon = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_EatMoon, Condition( function Trig_EatMoon_Conditions ) )
    call TriggerAddAction( gg_trg_EatMoon, function Trig_EatMoon_Actions )
endfunction
