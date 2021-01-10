
//===========================================================================
// Trigger: QuxiaoYang
//
// Awan
//===========================================================================
function Trig_QuxiaoYang_Conditions takes nothing returns boolean
    local unit u=GetTriggerUnit()
    if  GetOwningPlayer(u) == Player(PLAYER_NEUTRAL_PASSIVE) and GetUnitAbilityLevel(u, 'Awan')>0 then
    set u=null
    return true
    else
    if GetUnitTypeId(u)=='n007' then
    set u=null
    return true
    endif
    endif
set u=null
return false
endfunction

function Trig_QuxiaoYang_Actions takes nothing returns nothing
call SelectUnitRemove( GetTriggerUnit() )
endfunction

//===========================================================================
function InitTrig_QuxiaoYang takes nothing returns nothing
    set gg_trg_QuxiaoYang = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_QuxiaoYang, Condition( function Trig_QuxiaoYang_Conditions ) )
    call TriggerAddAction( gg_trg_QuxiaoYang, function Trig_QuxiaoYang_Actions )
endfunction
