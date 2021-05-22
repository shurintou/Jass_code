
//===========================================================================
// Trigger: addshuxing
//===========================================================================
function Trig_addshuxing_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A0C6' and GetUnitTypeId(GetSpellTargetUnit())!='Hdgo'
endfunction

function Trig_addshuxing_Actions takes nothing returns nothing
local unit u=GetTriggerUnit()
local integer level=GetUnitAbilityLevel(u, 'A0C6')
local integer t=0
local integer i=1
local integer l=0
local unit m=GetSpellTargetUnit()
local integer g=0

loop
exitwhen i>level or t==1
set l=GetHeroInt(u, false)
if l<1 then
set t=1
else
call SetHeroInt( u, l-1, true )
set i=i+1
set g=GetRandomInt(1,3)
    if g==1 then
    call SetHeroInt( m, GetHeroInt(m, false)+1, true )
    call DestroyEffect( AddSpecialEffectTarget("Abilities\\Spells\\Items\\AIim\\AIimTarget.mdl", m, "origin") )
    else
    if g==2 then
    call SetHeroAgi( m, GetHeroAgi(m, false)+1, true )
    call DestroyEffect( AddSpecialEffectTarget("Abilities\\Spells\\Items\\AIam\\AIamTarget.mdl", m, "origin") )
    else
    call SetHeroStr( m, GetHeroStr(m, false)+1, true )
    call DestroyEffect( AddSpecialEffectTarget("Abilities\\Spells\\Items\\AIsm\\AIsmTarget.mdl", m, "origin") )
    endif 
    endif
endif
endloop

set u=null
set m=null
endfunction

//===========================================================================
function InitTrig_addshuxing takes nothing returns nothing
    set gg_trg_addshuxing = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_addshuxing, Condition( function Trig_addshuxing_Conditions ) )
    call TriggerAddAction( gg_trg_addshuxing, function Trig_addshuxing_Actions )
endfunction
