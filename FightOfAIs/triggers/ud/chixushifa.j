
//===========================================================================
// Trigger: chixushifa
//===========================================================================
function Trig_chixushifa_Conditions takes nothing returns boolean
    local unit u=GetTriggerUnit()
    local unit m
    local integer l=GetSpellAbilityId()
    local unit t
    
    if  l=='A05K' then
        set m=CreateUnit(getcorrectplayer(u),'u000',0,0,0)
        call UnitApplyTimedLife( m, 'BTLF', 10.00 )
        call UnitAddAbility(m,'A05J')
        call SetUnitAbilityLevel(m,'A05J',R2I((GetHeroLevel(u)-3)/7))
        call IssuePointOrderById( m, 852089, GetSpellTargetX(),GetSpellTargetY() )
    elseif l=='AIh1' then
        call UnitResetCooldown(u)
    elseif l=='A09Q' then
        set t=GetSpellTargetUnit()
        if CheckLinken(t)==true then
            set m=CreateUnit(getcorrectplayer(u),'u000',GetUnitX(u),GetUnitY(u),0)
            call UnitApplyTimedLife( m, 'BTLF', 2.00 )
            call UnitAddAbility(m,'ANfd')
            call SetUnitAbilityLevel(m,'ANfd',R2I((GetHeroLevel(u)-3)/7)+(2*GetUnitAbilityLevel(u,'B01T')))
            call IssueTargetOrderById( m, 852230, t )
        endif
    endif
    set t=null
    set u=null
    set m=null
    return false
endfunction



//===========================================================================
function InitTrig_chixushifa takes nothing returns nothing
    set gg_trg_chixushifa = CreateTrigger(  )
    call DisableTrigger( gg_trg_chixushifa)
    call TriggerAddCondition( gg_trg_chixushifa, Condition( function Trig_chixushifa_Conditions ) )
    
endfunction
