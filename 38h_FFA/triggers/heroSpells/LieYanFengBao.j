
//===========================================================================
// Trigger: LieYanFengBao
//===========================================================================
function Trig_LieYanFengBao_Conditions takes nothing returns boolean
   return GetSpellAbilityId() == 'A0AJ' 
endfunction

function Trig_LieYanFengBao_Actions takes nothing returns nothing
    local unit u=GetTriggerUnit()
    local unit m=CreateUnit(GetTriggerPlayer(),'n001',0,0,0)
    call UnitAddAbility( m, 'AHfs' )
    call SetUnitAbilityLevel( m, 'AHfs', GetUnitAbilityLevel(u, 'A0AJ') )
    call UnitApplyTimedLife( m, 'BTLF', 6 )
    call IssuePointOrderById( m, 852488, GetSpellTargetX(), GetSpellTargetY() )
set u=null
set m=null
endfunction

//===========================================================================
function InitTrig_LieYanFengBao takes nothing returns nothing
    set gg_trg_LieYanFengBao = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_LieYanFengBao, Condition( function Trig_LieYanFengBao_Conditions ) )
    call TriggerAddAction( gg_trg_LieYanFengBao, function Trig_LieYanFengBao_Actions )
endfunction
