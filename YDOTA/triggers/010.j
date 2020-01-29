
//===========================================================================
// Trigger: 未命名触发器 010
//===========================================================================
function Trig_010_Conditions takes nothing returns boolean
    if ( not ( GetTerrainTypeBJ(GetRectCenter(gg_rct_038)) == GetTerrainTypeBJ(GetRectCenter(gg_rct_038)) ) ) then
        return false
    endif
    return true
endfunction

function Trig_010_Actions takes nothing returns nothing
    call DisableTrigger( gg_trg_shili1deyanshen )
    call DisableTrigger( gg_trg_shili2deyanshen )
endfunction

//===========================================================================
function InitTrig_010 takes nothing returns nothing
    set gg_trg_010 = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_010, Condition( function Trig_010_Conditions ) )
    call TriggerAddAction( gg_trg_010, function Trig_010_Actions )
endfunction
