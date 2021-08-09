
//===========================================================================
// Trigger: zengjiamofazuidazhi
//
// gg_trg_chaofuhegg_trg_zengjiamofazuidazhi
//===========================================================================
function Trig_zengjiamofazuidazhi_Conditions takes nothing returns boolean
    local integer n=GetConvertedPlayerId(GetTriggerPlayer())
    local integer i=GetSpellAbilityId()
if i==udg_Ability1[n] or i==udg_Ability2[n] or i=='A0CB' or i=='A0CX' then
return true
else
return false
endif
return false
endfunction

function Trig_zengjiamofazuidazhi_Actions takes nothing returns nothing
    local unit u=GetTriggerUnit()
    call UnitAddAbility( u, 'A0CU' )
    call SetUnitAbilityLevel( u, 'A0CU', 2 )
    call UnitRemoveAbility( u, 'A0CU' )
    set u=null
endfunction

//===========================================================================
function InitTrig_zengjiamofazuidazhi takes nothing returns nothing
    set gg_trg_zengjiamofazuidazhi = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_zengjiamofazuidazhi, Condition( function Trig_zengjiamofazuidazhi_Conditions ) )
    call TriggerAddAction( gg_trg_zengjiamofazuidazhi, function Trig_zengjiamofazuidazhi_Actions )
endfunction
