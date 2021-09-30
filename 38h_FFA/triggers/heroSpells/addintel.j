
//===========================================================================
// Trigger: addintel
//
// gg_trg_addshuxing gg_trg_addintel
//===========================================================================
function Trig_addintel_Conditions takes nothing returns boolean
    return GetUnitLevel(GetTriggerUnit()) >= 10 
endfunction

function Trig_addintel_Actions takes nothing returns nothing
local unit u=GetTriggerUnit()
local integer m=GetHandleId(u)
local integer i=GetSpellAbilityId()
local integer n=GetConvertedPlayerId(GetTriggerPlayer())
local integer g=GetHandleId(gg_trg_addintel)
local integer l=LoadInteger(udg_Hash1,g,1)
local integer level=GetUnitAbilityLevel(u, 'A0C6')

if i==udg_Ability1[n] or i==udg_Ability2[n] or i=='AEtq' or i=='A0C6' or i=='A0C8' or i=='A0C9' or i=='ANmo' then
call SaveInteger(udg_Hash1,g,1,l+1)
endif

if l+1 >=9-level then
call DestroyEffect( AddSpecialEffectTarget("Abilities\\Spells\\Items\\AIim\\AIimTarget.mdl", u, "origin") )
call SetHeroInt( u, GetHeroInt(u, false)+1, true )
call SaveInteger(udg_Hash1,g,1,0)
endif

set u=null
endfunction

//===========================================================================
function InitTrig_addintel takes nothing returns nothing
    set gg_trg_addintel = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_addintel, Condition( function Trig_addintel_Conditions ) )
    call TriggerAddAction( gg_trg_addintel, function Trig_addintel_Actions )
endfunction
