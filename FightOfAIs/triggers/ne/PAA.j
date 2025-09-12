
//===========================================================================
// Trigger: PAA
//===========================================================================
function Trig_PAA_Conditions takes nothing returns boolean
    local unit t=GetEventTargetUnit()
    local unit u=GetTriggerUnit()
    local integer i=R2I((GetHeroLevel(u)-3)/7)
    local real x=GetUnitX(t)
    local real y=GetUnitY(t)
    call SetUnitAbilityLevel(u,'A09E',i)
    call SetUnitAbilityLevel(u,'A09F',i)
    call SetUnitAbilityLevel(u,'A09G',i)
    if IsUnitType(t, UNIT_TYPE_STRUCTURE) == false then
        call IssuePointOrderById( u, 852089, x,y )
        call IssuePointOrderById( u, 852664, x, y )
    endif
    call UnitDamageTarget( u, t, ((i*0.01)+0.01+(GetHeroInt(u,true)/10000))*GetUnitState(t, UNIT_STATE_MAX_LIFE), true, true, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
    set u=null
    set t=null
    return false
endfunction



//===========================================================================
function InitTrig_PAA takes nothing returns nothing
    set gg_trg_PAA = CreateTrigger(  )
    call DisableTrigger( gg_trg_PAA )
    call TriggerAddCondition( gg_trg_PAA, Condition( function Trig_PAA_Conditions ) )
endfunction
