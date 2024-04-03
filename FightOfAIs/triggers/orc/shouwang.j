
//===========================================================================
// Trigger: shouwang
//===========================================================================
function Trig_shouwang_Conditions takes nothing returns boolean
    local unit u=GetTriggerUnit()
    local unit t=GetEventTargetUnit()
    local integer i=R2I((GetHeroLevel(u)-3)/7)
    call SetUnitAbilityLevel( u, 'ANsg', i )
    call SetUnitAbilityLevel( u, 'ANsq', i )
    call SetUnitAbilityLevel( u, 'ANsw', i )
    call SetUnitAbilityLevel( u, 'ANst', i )
    call IssueImmediateOrderById( u, 852594 )
    call IssueImmediateOrderById( u, 852595 )
    call IssueImmediateOrderById( u, 852596 )
    
    set i=R2I((GetUnitState(u, UNIT_STATE_MAX_LIFE)-1500)/100)
    if i>50 then
        call SetUnitAbilityLevel( u, 'A09W', 50 )
    elseif i>0 then
        call SetUnitAbilityLevel( u, 'A09W', i )
    else
        call SetUnitAbilityLevel( u, 'A09W', 1 )
    endif
    call IssuePointOrderById( udg_SpellTarget[GetConvertedPlayerId(GetTriggerPlayer())], 851983, GetUnitX(t), GetUnitY(t) )
    set u=null
    set t=null
    return false
endfunction



//===========================================================================
function InitTrig_shouwang takes nothing returns nothing
    set gg_trg_shouwang = CreateTrigger(  )
    call DisableTrigger( gg_trg_shouwang)
    call TriggerAddCondition( gg_trg_shouwang, Condition( function Trig_shouwang_Conditions ) )
    
endfunction
