
//===========================================================================
// Trigger: panda
//===========================================================================
function Trig_panda_Conditions takes nothing returns boolean
    local unit t=GetEventTargetUnit()
    local unit u=GetTriggerUnit()
    local integer i=R2I((GetHeroLevel(u)-5)/5)+GetUnitAbilityLevel(u,'B01T')
    call SetUnitAbilityLevel( u, 'ANbf', i )
    call SetUnitAbilityLevel( u, 'ANdh', i )
    call SetUnitAbilityLevel( u, 'ANdb', i )
    call SetUnitAbilityLevel( u, 'ANef', i )
    if  GetUnitAbilityLevel(t, 'BNdh') >0  then
        call IssuePointOrderById( u, 852580, GetUnitX(t), GetUnitY(t) )
    else
        call IssueTargetOrderById( u, 852585, t )
    endif
    set u=null
    set t=null
    return false
endfunction



//===========================================================================
function InitTrig_panda takes nothing returns nothing
    set gg_trg_panda = CreateTrigger(  )
    call DisableTrigger( gg_trg_panda)
    call TriggerAddCondition( gg_trg_panda, Condition( function Trig_panda_Conditions ) )
    
endfunction
