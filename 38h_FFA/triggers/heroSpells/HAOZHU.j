
//===========================================================================
// Trigger: HAOZHU
//===========================================================================
function Trig_HAOZHU_Conditions takes nothing returns boolean
    local unit u=GetTriggerUnit()
    local integer i=GetUnitLevel(u)
    if  i == 3  then
    call SetUnitAbilityLevel( u,'Arsq',2)
    else
    if  i==6 then 
    call SetUnitAbilityLevel( u,'Arsq',3)
    else
    if  i>=9 then
    call SetUnitAbilityLevel( u,'Arsq',4)
    call DestroyTrigger( GetTriggeringTrigger() )
    endif
    endif
    endif
    set u=null
    return false
endfunction



//===========================================================================
function InitTrig_HAOZHU takes nothing returns nothing
    set gg_trg_HAOZHU = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_HAOZHU, Condition( function Trig_HAOZHU_Conditions ) )
    
endfunction
