
//===========================================================================
// Trigger: udbuilding
//===========================================================================
function Trig_udbuilding_Conditions takes nothing returns boolean
    local unit u=GetConstructedStructure()
    local integer i= GetUnitTypeId(u)
    if i== 'uaod' then//jitan
        set i=GetConvertedPlayerId(GetTriggerPlayer())
        set udg_PX[i]=GetUnitX(u)
        set udg_PY[i]=GetUnitY(u)
        if udg_Heronumber[i] <3 then
            call TriggerRegisterUnitEvent( gg_trg_udoriginhero, u, EVENT_UNIT_TRAIN_FINISH )
            call TriggerRegisterUnitEvent( gg_trg_HeroAddItem, u, EVENT_UNIT_TRAIN_FINISH )
        endif
    elseif i== 'uslh' then//tuzaichang
        call TriggerRegisterUnitEvent( gg_trg_destroyer, u, EVENT_UNIT_TRAIN_FINISH )
    endif
    
    set u=null
    return false
endfunction



//===========================================================================
function InitTrig_udbuilding takes nothing returns nothing
    set gg_trg_udbuilding = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_udbuilding, Condition( function Trig_udbuilding_Conditions ) )
endfunction
