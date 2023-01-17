
//===========================================================================
// Trigger: JingQi
//
// call SetUnitAbilityLevel( null, 'A041', GetUnitAbilityLevel(GetTriggerUnit(), 'A041') )
// call UnitApplyTimedLife( null, 'BTLF', 60 )
// call SetPlayerAbilityAvailable( Player(0), 'A041', false )
// call SetUnitState( null, UNIT_STATE_LIFE, GetUnitState(GetTriggerUnit(), UNIT_STATE_LIFE) )
// call SetUnitState( null, UNIT_STATE_MANA, GetUnitState(GetTriggerUnit(), UNIT_STATE_MANA) )
//===========================================================================
function Trig_JingQi_Conditions takes nothing returns boolean
    local integer i=GetSpellAbilityId()
    
    return i != 'ANba' and i!='AEim' and i!='A01J' 
endfunction

function Trig_JingQi_Actions takes nothing returns nothing
local unit u=GetTriggerUnit()
local integer level=GetUnitAbilityLevel(u, 'A0AZ')
local integer ri=GetRandomInt(1,100)
local integer i
local integer m
local integer n

if ri<5+5*level then
set i=GetSpellAbilityId()
set m=GetHandleId(u)
set n=GetConvertedPlayerId(GetTriggerPlayer())
   if i==LoadInteger(udg_Hash3,m,332) or i==LoadInteger(udg_Hash3,m,333) or i==LoadInteger(udg_Hash3,m,336) or i==udg_Ability1[n] or i==udg_Ability2[n] then
   call SetUnitState( u, UNIT_STATE_MANA, GetUnitState(u, UNIT_STATE_MANA)+0.15*GetUnitState(u, UNIT_STATE_MAX_MANA) )
   call DestroyEffect( AddSpecialEffectTarget("Abilities\\Spells\\Undead\\ReplenishMana\\ReplenishManaCasterOverhead.mdl", u, "overhead") )
   endif

endif

set u=null
endfunction

//===========================================================================
function InitTrig_JingQi takes nothing returns nothing
    set gg_trg_JingQi = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_JingQi, Condition( function Trig_JingQi_Conditions ) )
    call TriggerAddAction( gg_trg_JingQi, function Trig_JingQi_Actions )
endfunction
