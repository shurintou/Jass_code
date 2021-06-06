
//===========================================================================
// Trigger: LearnAgi
//===========================================================================
function Trig_LearnAgi_Conditions takes nothing returns boolean
    return GetLearnedSkill() == 'A000' 
endfunction

function Trig_LearnAgi_Actions takes nothing returns nothing
    local unit u=GetTriggerUnit()
    local integer i=GetUnitAbilityLevel(u, 'A000' )
    if i==1 then
    call UnitAddAbility( u, 'A05Q' )
    else
    call SetUnitAbilityLevel( u, 'A05Q', i )
    endif
    if i==3 then
    call DestroyTrigger( GetTriggeringTrigger() )
    endif
    set u=null
endfunction

//===========================================================================
function InitTrig_LearnAgi takes nothing returns nothing
    set gg_trg_LearnAgi = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_LearnAgi, Condition( function Trig_LearnAgi_Conditions ) )
    call TriggerAddAction( gg_trg_LearnAgi, function Trig_LearnAgi_Actions )
endfunction
