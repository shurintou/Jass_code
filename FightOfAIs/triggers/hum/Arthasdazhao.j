
//===========================================================================
// Trigger: Arthasdazhao
//===========================================================================
function Trig_Arthasdazhao_Conditions takes nothing returns boolean
    local unit u=GetTriggerUnit()
    if  IsUnitType(GetEventTargetUnit(), UNIT_TYPE_HERO) == true then
        call IssueImmediateOrderById( u, 852183 )
        call SetUnitAbilityLevel(u,'A00I',R2I((GetHeroLevel(u)-3)/7))
    endif
    set u=null
    return false
endfunction



//===========================================================================
function InitTrig_Arthasdazhao takes nothing returns nothing
    set gg_trg_Arthasdazhao = CreateTrigger(  )
    call DisableTrigger(gg_trg_Arthasdazhao)
    call TriggerAddCondition( gg_trg_Arthasdazhao, Condition( function Trig_Arthasdazhao_Conditions ) )
    
endfunction
