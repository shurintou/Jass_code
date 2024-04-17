
//===========================================================================
// Trigger: zhujidi
//===========================================================================
function Trig_zhujidi_Conditions takes nothing returns boolean
    local unit u
    local integer i=GetConvertedPlayerId(GetTriggerPlayer())
    local integer g=GetHandleId(gg_trg_zhujidi)
    if GetUnitTypeId(GetTrainedUnit())=='hpea' and LoadInteger(udg_hash,g,i)==0 then
        set u=GetTriggerUnit()
        call IssueImmediateOrderById( u, 851976 )
        call IssueImmediateOrderById( u, 'hkee' )
        call TriggerRegisterUnitEvent( gg_trg_jianzhushengji, u, EVENT_UNIT_UPGRADE_FINISH )
        call SaveInteger(udg_hash,g,i,1)
    endif
    
    if LoadInteger(udg_hash,g,udg_RacePlayerNum[1]) ==1 and udg_RacePlayerNum[2]==1 then
        call FlushChildHashtable( udg_hash,g)
        call DestroyTrigger( gg_trg_zhujidi )
    endif
    set u=null
    return false
endfunction



//===========================================================================
function InitTrig_zhujidi takes nothing returns nothing
    set gg_trg_zhujidi = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_zhujidi, Condition( function Trig_zhujidi_Conditions ) )
endfunction
