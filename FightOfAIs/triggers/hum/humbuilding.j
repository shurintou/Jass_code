
//===========================================================================
// Trigger: humbuilding
//
// 
//     
//===========================================================================
function Trig_humbuilding_Conditions takes nothing returns boolean
    local unit u=GetConstructedStructure()
    local integer i= GetUnitTypeId(u)
    if i== 'harm' then
        call TriggerRegisterUnitEvent( gg_trg_tanke, u, EVENT_UNIT_TRAIN_FINISH )
    elseif i == 'htow' then
        call IssueImmediateOrderById( u, 'hkee' )
        call TriggerRegisterUnitEvent( gg_trg_jianzhushengji, u, EVENT_UNIT_UPGRADE_FINISH )
    elseif i== 'halt' then
        set i=GetConvertedPlayerId(GetTriggerPlayer())
        set udg_PX[i]=GetUnitX(u)
        set udg_PY[i]=GetUnitY(u)
        if udg_Heronumber[i] <3 then
            call TriggerRegisterUnitEvent(  gg_trg_humoriginhero, u, EVENT_UNIT_TRAIN_FINISH )
            call TriggerRegisterUnitEvent( gg_trg_HeroAddItem, u, EVENT_UNIT_TRAIN_FINISH )
        endif
    elseif i=='hars' then
        call TriggerRegisterUnitEvent( gg_trg_mages, u, EVENT_UNIT_TRAIN_FINISH )
    endif
    
    set u=null
    return false
endfunction



//===========================================================================
function InitTrig_humbuilding takes nothing returns nothing
    set gg_trg_humbuilding = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_humbuilding, Condition( function Trig_humbuilding_Conditions ) )
endfunction
