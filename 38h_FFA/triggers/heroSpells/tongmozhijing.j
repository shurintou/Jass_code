
//===========================================================================
// Trigger: tongmozhijing
//
// HarmGroup takes unit u,real r,real h returns nothing//单位，距离，伤害
//===========================================================================
function qweqewrrrr takes unit u returns nothing
local integer level=GetUnitAbilityLevel(u, 'A0CI')
local integer str=GetHeroStr(u, true)
call HarmGroup(u,200+50*level,level*str)
call DestroyEffect( AddSpecialEffectTarget("Abilities\\Spells\\Orc\\EtherealForm\\SpiritWalkerChange.mdl", u, "origin") )
call DestroyEffect( AddSpecialEffectTarget("war3mapImported\\ForestBolt.mdx",u , "origin") )
endfunction 




function Trig_tongmozhijing_Actions takes nothing returns nothing
local unit u=GetTriggerUnit()
local integer g=GetSpellAbilityId()
local integer level=GetUnitAbilityLevel(u, 'A0CI')

if g=='A0CJ' then//3
call SetUnitX(u,GetSpellTargetX())
call SetUnitY(u,GetSpellTargetY())
call qweqewrrrr(u)
call UnitRemoveAbility( u, 'A0CJ' )
call UnitAddAbility( u, 'A0CK' )
call SetUnitAbilityLevel( u, 'A0CK', level )
else
if g=='A0CK' then//2
call SetUnitX(u,GetSpellTargetX())
call SetUnitY(u,GetSpellTargetY())
call qweqewrrrr(u)
call UnitRemoveAbility( u, 'A0CK' )
call UnitAddAbility( u, 'A0CL' )
call SetUnitAbilityLevel( u, 'A0CL', level )
else
if g=='A0CL' then//1
call SetUnitX(u,GetSpellTargetX())
call SetUnitY(u,GetSpellTargetY())
call qweqewrrrr(u)
call UnitRemoveAbility( u, 'A0CL' )
endif
endif
endif

set u=null
endfunction

//===========================================================================
function InitTrig_tongmozhijing takes nothing returns nothing
    set gg_trg_tongmozhijing = CreateTrigger(  )
    call TriggerAddAction( gg_trg_tongmozhijing, function Trig_tongmozhijing_Actions )
endfunction
