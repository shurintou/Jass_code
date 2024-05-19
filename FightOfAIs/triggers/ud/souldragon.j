
//===========================================================================
// Trigger: souldragon
//===========================================================================
function Trig_souldragon_Conditions takes nothing returns boolean
    local unit m
    local unit u=GetTriggerUnit()
    local integer level=GetUnitAbilityLevel(u, 'A00Z')
    local integer g=GetConvertedPlayerId(GetTriggerPlayer())
    local real h=udg_UGharm[g]+GetEventDamage()
    
    
    if h<= (11-level)*100  then
        set udg_UGharm[g]=h
    else
        set m=CreateUnit(getcorrectplayer(u),'u000',GetUnitX(u),GetUnitY(u),0)
        call UnitAddItemToSlotById( m, 'sres', 0 )
        call UnitUseItem( m, UnitItemInSlot(m, 0) )
        call UnitApplyTimedLife( m, 'BTLF', 5.00 )
        call UnitRemoveAbility(u,'A026')
        call UnitAddAbility(u,'A026')
        set udg_UGharm[g]=h-1100+100*level
    endif
    
    
    call IssueImmediateOrderById( u, 852097 )
    
    
    
    
    set u=null
    set m=null
    
    
    
    
    return false
endfunction



//===========================================================================
function InitTrig_souldragon takes nothing returns nothing
    set gg_trg_souldragon = CreateTrigger(  )
    call DisableTrigger( gg_trg_souldragon)
    call TriggerAddCondition( gg_trg_souldragon, Condition( function Trig_souldragon_Conditions ) )
    
endfunction
