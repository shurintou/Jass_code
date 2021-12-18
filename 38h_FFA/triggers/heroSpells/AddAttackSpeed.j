
//===========================================================================
// Trigger: AddAttackSpeed
//===========================================================================
function Trig_AddAttackSpeed_Conditions takes nothing returns boolean
    local unit t=GetEventTargetUnit()
    local unit u=GetTriggerUnit()
    local integer level=0
    local integer i=GetHandleId(u)
    if LoadUnitHandle(udg_Hash1,i,2)==t then
    set level=GetUnitAbilityLevel(u, 'A02X')
    call SetUnitAbilityLevel(u, 'A02X', level+(GetUnitAbilityLevel(u, 'ANic')))
    else
    set level=GetUnitAbilityLevel(u, 'A02X')
    call SetUnitAbilityLevel(u, 'A02X',R2I(level/2))
    endif
    call SaveUnitHandle(udg_Hash1,i,2,t)
    
    set t=null
    set u=null

    return false
endfunction


//===========================================================================
function InitTrig_AddAttackSpeed takes nothing returns nothing
    set gg_trg_AddAttackSpeed = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_AddAttackSpeed, Condition( function Trig_AddAttackSpeed_Conditions ) )
endfunction
