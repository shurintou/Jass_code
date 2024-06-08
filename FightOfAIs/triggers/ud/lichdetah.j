
//===========================================================================
// Trigger: lichdetah
//
// 
//    
//===========================================================================
function Trig_lichdetah_Conditions takes nothing returns boolean
    local unit u=GetTriggerUnit()
    local unit m=CreateUnit(getcorrectplayer(u),'u000',0,0,0)
    call UnitApplyTimedLife( m, 'BTLF', 15.00 )
    call UnitAddAbility(m,'A00U')
    call SetUnitAbilityLevel(m,'A00U',R2I((GetHeroLevel(u)+5)/10))
    call IssuePointOrderById( m, 852221, GetUnitX(u),GetUnitY(u) )
    
    set u=null
    set m=null
    return false
endfunction



//===========================================================================
function InitTrig_lichdetah takes nothing returns nothing
    set gg_trg_lichdetah = CreateTrigger(  )
    call DisableTrigger( gg_trg_lichdetah)
    call TriggerAddCondition( gg_trg_lichdetah, Condition( function Trig_lichdetah_Conditions ) )
    
endfunction
