
//===========================================================================
// Trigger: orcbuilding
//===========================================================================
function Trig_orcbuilding_Conditions takes nothing returns boolean
    local unit u=GetConstructedStructure()
    local integer i= GetUnitTypeId(u)
    if i == 'obar' then
        call TriggerRegisterUnitEvent( gg_trg_lietou, u, EVENT_UNIT_TRAIN_FINISH )
    elseif i== 'osld' then
        call TriggerRegisterUnitEvent( gg_trg_linghun, u, EVENT_UNIT_TRAIN_FINISH )
    elseif i == 'obea' then
        call TriggerRegisterUnitEvent( gg_trg_langqi, u, EVENT_UNIT_TRAIN_FINISH )
    elseif i== 'oalt' then
        set i=GetConvertedPlayerId(GetTriggerPlayer())
        set udg_PX[i]=GetUnitX(u)
        set udg_PY[i]=GetUnitY(u)
        if udg_Heronumber[i] <2 then
            call TriggerRegisterUnitEvent( gg_trg_HeroAddItem, u, EVENT_UNIT_TRAIN_FINISH )
            call TriggerRegisterUnitEvent( gg_trg_orcoriginhero, u, EVENT_UNIT_TRAIN_FINISH )
        endif
    elseif i=='ogre' then
        call IssueImmediateOrderById( u, 'ostr' )
        call TriggerRegisterUnitEvent( gg_trg_jianzhushengji, u, EVENT_UNIT_UPGRADE_FINISH )
    endif
    
    set u=null
    return false
endfunction



//===========================================================================
function InitTrig_orcbuilding takes nothing returns nothing
    set gg_trg_orcbuilding = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_orcbuilding, Condition( function Trig_orcbuilding_Conditions ) )
endfunction
