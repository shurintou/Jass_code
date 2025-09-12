
//===========================================================================
// Trigger: nebuilding
//===========================================================================
function Trig_nebuilding_Conditions takes nothing returns boolean
    local unit u=GetConstructedStructure()
    local integer i= GetUnitTypeId(u)
    if i== 'eate' then
        set i=GetConvertedPlayerId(GetTriggerPlayer())
        set udg_PX[i]=GetUnitX(u)
        set udg_PY[i]=GetUnitY(u)
        if udg_Heronumber[i] <3 then
            call TriggerRegisterUnitEvent( gg_trg_HeroAddItem, u, EVENT_UNIT_TRAIN_FINISH )
            call TriggerRegisterUnitEvent( gg_trg_neoriginhero, u, EVENT_UNIT_TRAIN_FINISH )
        endif
    elseif i== 'eaow' then
        call TriggerRegisterUnitEvent( gg_trg_jiaoying, u, EVENT_UNIT_TRAIN_FINISH )
    elseif i== 'eaom' then
        call TriggerRegisterUnitEvent( gg_trg_ac, u, EVENT_UNIT_TRAIN_FINISH )
    elseif i== 'eaoe' then
        call TriggerRegisterUnitEvent( gg_trg_bianxiong, u, EVENT_UNIT_TRAIN_FINISH )
    endif
    
    set u=null
    return false
endfunction



//===========================================================================
function InitTrig_nebuilding takes nothing returns nothing
    set gg_trg_nebuilding = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_nebuilding, Condition( function Trig_nebuilding_Conditions ) )
endfunction
