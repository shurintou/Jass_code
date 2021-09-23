
//===========================================================================
// Trigger: lvlupwithability
//
// 
//                    ////////////////////////////////       小魔棒问题   ////////////////////////////////////////
//===========================================================================
function Trig_lvlupwithability_Actions takes nothing returns nothing
local unit u=GetTriggerUnit()
local integer level=GetUnitLevel(u)

if level==3 then
call SetUnitAbilityLevel( u, 'Aste', 2 )
call SetUnitAbilityLevel( u, 'A0C8', 2 )
else
if level==4 then
call SetUnitAbilityLevel( u, 'Aste', 3 )
call SetUnitAbilityLevel( u, 'A0C8', 3 )
else
if level==5 then
call SetUnitAbilityLevel( u, 'Aste', 4 )
call SetUnitAbilityLevel( u, 'A0C8', 4 )
else
if level==6 then
call SetPlayerTechResearchedSwap( 'Rhst', 1, GetTriggerPlayer() )
else
if level==7 then
call SetUnitAbilityLevel( u, 'ACif', 2 )
call SetUnitAbilityLevel( u, 'A0C9', 2 )
else
if level==8 then
call SetUnitAbilityLevel( u, 'ACif', 3 )
call SetUnitAbilityLevel( u, 'A0C9', 3 )
else
if level==9 then
call SetUnitAbilityLevel( u, 'ACif', 4 )
call SetUnitAbilityLevel( u, 'A0C9', 4 )
else
if level==10 then
call SetPlayerTechResearchedSwap( 'Rhpt', 1, GetTriggerPlayer() )
else
if level==11 then
call SetUnitAbilityLevel( u, 'A0C6', 2 )
call SetUnitAbilityLevel( u, 'AOre', 2 )
else
if level==12 then
call SetUnitAbilityLevel( u, 'A0C6', 3 )
call SetUnitAbilityLevel( u, 'AOre', 3 )
else
if level==13 then
call SetUnitAbilityLevel( u, 'A0C6', 4 )
call SetUnitAbilityLevel( u, 'AOre', 4 )
else
if level==14 then
call SetPlayerTechResearchedSwap( 'Rhrt', 1, GetTriggerPlayer() )
call DestroyTrigger( GetTriggeringTrigger() )
endif
endif
endif
endif
endif
endif
endif
endif
endif
endif
endif
endif

set u=null
endfunction

//===========================================================================
function InitTrig_lvlupwithability takes nothing returns nothing
    set gg_trg_lvlupwithability = CreateTrigger(  )
    call TriggerAddAction( gg_trg_lvlupwithability, function Trig_lvlupwithability_Actions )
endfunction
