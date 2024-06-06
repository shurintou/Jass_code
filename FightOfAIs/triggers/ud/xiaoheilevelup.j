
//===========================================================================
// Trigger: xiaoheilevelup
//===========================================================================
function Trig_xiaoheilevelup_Conditions takes nothing returns boolean
    local unit u=GetTriggerUnit()
    local integer i=GetHeroLevel(u)
    if   i== 15 then
        call SetUnitAbilityLevel( u, 'A002', 2 )
        call SetUnitAbilityLevel( u, 'A02E', 2 )
        call DestroyEffect( AddSpecialEffectTarget("Abilities\\Spells\\Items\\AIam\\AIamTarget.mdl", u, "origin") )
    elseif  i==19 then
        call SetUnitAbilityLevel( u, 'A008', 2 )
    elseif   i==21 then
        call SetUnitAbilityLevel( u, 'A002', 3 )
        call SetUnitAbilityLevel( u, 'A02E', 3 )
        call DestroyEffect( AddSpecialEffectTarget("Abilities\\Spells\\Items\\AIam\\AIamTarget.mdl", u, "origin") )
    elseif  i==23 then
        call SetUnitAbilityLevel( u, 'A008', 3 )
    elseif  i==24 then
        call SetUnitAbilityLevel( u, 'A002', 4 )
        call SetUnitAbilityLevel( u, 'A02E', 4 )
        call DestroyEffect( AddSpecialEffectTarget("Abilities\\Spells\\Items\\AIam\\AIamTarget.mdl", u, "origin") )
    endif
    
    set u=null
    return false
endfunction



//===========================================================================
function InitTrig_xiaoheilevelup takes nothing returns nothing
    set gg_trg_xiaoheilevelup = CreateTrigger(  )
    call DisableTrigger( gg_trg_xiaoheilevelup )
    call TriggerAddCondition( gg_trg_xiaoheilevelup, Condition( function Trig_xiaoheilevelup_Conditions ) )
    
endfunction
