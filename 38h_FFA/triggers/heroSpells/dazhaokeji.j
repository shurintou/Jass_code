
//===========================================================================
// Trigger: dazhaokeji
//
// gg_trg_dazhaokejigg_trg_learnrrrrrr
//===========================================================================
function Trig_dazhaokeji_Conditions takes nothing returns boolean
    return GetLearnedSkill() == 'A0BR' 
endfunction

function Trig_dazhaokeji_Actions takes nothing returns nothing
    local integer i= GetUnitAbilityLevel(GetTriggerUnit(), 'A0BR')
    local player p=GetTriggerPlayer()
    local integer n=GetHandleId(gg_trg_zhaohuanxiong)
    call SetPlayerTechResearchedSwap( 'Rema',i, p ) 
    if i==1 then
    call SetPlayerAbilityAvailable( p, 'A0BS', true )
    endif
    call SetUnitAbilityLevel( LoadUnitHandle(udg_Hash1,n,1), 'A0BS', i )
    if i==3 then
    call DestroyTrigger( GetTriggeringTrigger() )
    endif
    set p=null
endfunction

//===========================================================================
function InitTrig_dazhaokeji takes nothing returns nothing
    set gg_trg_dazhaokeji = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_dazhaokeji, Condition( function Trig_dazhaokeji_Conditions ) )
    call TriggerAddAction( gg_trg_dazhaokeji, function Trig_dazhaokeji_Actions )
endfunction
