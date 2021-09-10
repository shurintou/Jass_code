
//===========================================================================
// Trigger: UploadedC
//===========================================================================
function Trig_UploadedC_Conditions takes nothing returns boolean
    return GetLearnedSkill() == 'A09G' 
endfunction

function Trig_UploadedC_Actions takes nothing returns nothing
local unit u=GetTriggerUnit()
local integer i=GetUnitAbilityLevel(u,'A09G' )
call SetUnitAbilityLevel(u,'S000',i)
if i==3 then
call DestroyTrigger( GetTriggeringTrigger() )
endif
set u=null
endfunction

//===========================================================================
function InitTrig_UploadedC takes nothing returns nothing
    set gg_trg_UploadedC = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_UploadedC, Condition( function Trig_UploadedC_Conditions ) )
    call TriggerAddAction( gg_trg_UploadedC, function Trig_UploadedC_Actions )
endfunction
