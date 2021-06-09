
//===========================================================================
// Trigger: zhuanyi
//===========================================================================
function Trig_zhuanyi_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 'A097' 
endfunction

function Trig_zhuanyi_Actions takes nothing returns nothing
    local unit u=GetTriggerUnit()
    local location l=GetUnitLoc(u)
    local location g=GetSpellTargetLoc()
    local real e=GetLocationZ(g)
    local real r=GetLocationZ(l)
    if r<295 and e<295 then
    call KillUnit(CreateUnit(GetTriggerPlayer(),'edot',GetUnitX(u),GetUnitY(u),GetUnitFacing(u)))
    call SetUnitX( u, GetLocationX(g))
    call SetUnitY( u, GetLocationY(g))
    call SetUnitAnimation( u, "birth" )
    else
    //call PlaySoundBJ( gg_snd_Error )
    call IssueImmediateOrderById( u, 851972 )
    call RemoveItem( UnitAddItemById(u, 'I03Q'))
    //call SetUnitState( u, UNIT_STATE_MANA, GetUnitState(u, UNIT_STATE_MANA)+10 )
    //call DisplayTextToPlayer( GetTriggerPlayer(), 0, 0, "|cfffeba0e形态流动必须在水中进行|r" )
    endif 
    call RemoveLocation(l)
    call RemoveLocation(g)
    set g=null
    set l=null
    set u=null
endfunction

//===========================================================================
function InitTrig_zhuanyi takes nothing returns nothing
    set gg_trg_zhuanyi = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_zhuanyi, Condition( function Trig_zhuanyi_Conditions ) )
    call TriggerAddAction( gg_trg_zhuanyi, function Trig_zhuanyi_Actions )
endfunction
