
//===========================================================================
// Trigger: medivengongji
//===========================================================================
function Trig_medivengongji_Conditions takes nothing returns boolean
    local unit u=GetTriggerUnit()
    local unit t= GetEventTargetUnit()
    local real r=GetUnitState(u, UNIT_STATE_MANA)
    call SetUnitState( u, UNIT_STATE_MANA,0.97*r)
    call SetUnitState( t, UNIT_STATE_LIFE,GetUnitState(t, UNIT_STATE_LIFE)-0.03*r)
    
    if  IsUnitType(t, UNIT_TYPE_HERO) == true  then
        call IssueTargetOrderById( u, 852095, t )
        if GetUnitDefaultFlyHeight(u) < 10 then
            call IssueImmediateOrderById( u, 852180 )
        endif
    else
        call IssuePointOrderById( u, 852224, GetUnitX(t), GetUnitY(t) )
        call IssuePointOrderById( u, 852652, GetUnitX(t), GetUnitY(t) )
    endif
    
    set u=null
    set t=null
    return false
endfunction



//===========================================================================
function InitTrig_medivengongji takes nothing returns nothing
    set gg_trg_medivengongji = CreateTrigger(  )
    call DisableTrigger( gg_trg_medivengongji )
    call TriggerAddCondition( gg_trg_medivengongji, Condition( function Trig_medivengongji_Conditions ) )
endfunction
