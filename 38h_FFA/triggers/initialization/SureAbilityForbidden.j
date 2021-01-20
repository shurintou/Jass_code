
//===========================================================================
// Trigger: SureAbilityForbidden
//===========================================================================
function Trig_SureAbilityForbidden_Actions takes nothing returns nothing
call SaveInteger(udg_Hash2,971,158,3)
call RemoveItemFromStock(  gg_unit_nmrf_0134,'I03A' )
//call RemoveItemFromStock(  gg_unit_nmrf_0134,'I01O' )
call DisplayTimedTextToForce( udg_OnlinePlayer, 30,"本场比赛采用|c00fffc01技能限制模式|r，|cffff0303每种技能每个阵营只能学习一次,同时禁掉一些物品|r")
call DestroyTrigger( gg_trg_NoCD )
    call DestroyTrigger( gg_trg_view )
    call DestroyTrigger( gg_trg_kill )
    call DestroyTrigger( gg_trg_wtf )
    call DestroyTrigger( gg_trg_level )
    call DestroyTrigger( gg_trg_checkhpgroup )
    call DestroyTrigger( gg_trg_multiborad )
    call DestroyTrigger( gg_trg_test )
call DestroyTrigger( GetTriggeringTrigger() )
endfunction

//===========================================================================
function InitTrig_SureAbilityForbidden takes nothing returns nothing
    set gg_trg_SureAbilityForbidden = CreateTrigger(  )
    
    call TriggerAddAction( gg_trg_SureAbilityForbidden, function Trig_SureAbilityForbidden_Actions )
endfunction
