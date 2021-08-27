
//===========================================================================
// Trigger: ElectricSquare
//===========================================================================
function Trig_ElectricSquare_Actions takes nothing returns nothing
local unit u=GetTriggerUnit()
local integer m=GetHandleId(u)
local integer i=GetSpellAbilityId()
local integer l=GetConvertedPlayerId(GetTriggerPlayer())
local unit n


if i==LoadInteger(udg_Hash3,m,332) or i==LoadInteger(udg_Hash3,m,333) or i==udg_Ability1[l] or i==udg_Ability2[l] or i=='A08G' then
if GetUnitAbilityLevel(u,'A06X') >0 then
set n=CreateUnit(GetTriggerPlayer(),'n001',0,0,0)
call SetUnitScale( n, 1.4, 1.4, 1.4 )
call UnitAddAbility( n, 'AUdd' )
call SetUnitAbilityLevel( n, 'AUdd', GetUnitAbilityLevel(u, 'A06X') )
call UnitApplyTimedLife( n, 'BTLF', 10 )
call IssuePointOrderById( n, 852221, GetUnitX(u), GetUnitY(u) )
endif
endif

set n=null
set u=null
endfunction

//===========================================================================
function InitTrig_ElectricSquare takes nothing returns nothing
    set gg_trg_ElectricSquare = CreateTrigger(  )
    call TriggerAddAction( gg_trg_ElectricSquare, function Trig_ElectricSquare_Actions )
endfunction
