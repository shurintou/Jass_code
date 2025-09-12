
//===========================================================================
// Trigger: nelaolujifeng
//===========================================================================
function Trig_nelaolujifeng_Conditions takes nothing returns boolean
    local unit u
    local unit m
    local integer l=GetSpellAbilityId()
    
    
    
    if  l == 'ANmo'  then
        set u=GetTriggerUnit()
        set m=CreateUnit(getcorrectplayer(u),'u000',0,0,0)
        call UnitAddAbility( m, 'A00H' )
        call UnitApplyTimedLife( m, 'BTLF', 20.00 )
        call SetUnitAbilityLevel(m,'A00H',R2I((GetHeroLevel(u)-5)/5)+GetUnitAbilityLevel(u,'B01T'))
        call IssuePointOrderById( m, 852591, GetSpellTargetX(), GetSpellTargetY() )
    elseif  l == 'ANto'  then
        set udg_SpellTimer[GetConvertedPlayerId(GetTriggerPlayer())]=8
    elseif l=='AIh1' then
        call UnitResetCooldown(GetTriggerUnit())
    endif
    
    set u=null
    set m=null
    return false
endfunction


//===========================================================================
function InitTrig_nelaolujifeng takes nothing returns nothing
    set gg_trg_nelaolujifeng = CreateTrigger(  )
    call DisableTrigger(gg_trg_nelaolujifeng)
    call TriggerAddCondition( gg_trg_nelaolujifeng, Condition( function Trig_nelaolujifeng_Conditions ) )
    
endfunction
