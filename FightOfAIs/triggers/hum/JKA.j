
//===========================================================================
// Trigger: JKA
//===========================================================================
function Trig_JKA_Conditions takes nothing returns boolean
    local unit u=GetTriggerUnit()
    local unit t=GetEventTargetUnit()
    local integer i=GetConvertedPlayerId(GetTriggerPlayer())
    local unit m
    local integer g=R2I((GetHeroLevel(u)-5)/5)
    local real r=GetUnitState(t, UNIT_STATE_MAX_LIFE)*(0.05+(0.03*GetUnitAbilityLevel(u,'B01T')))
    if GetUnitAbilityLevel(t ,'A083')>0 and udg_Chaoxi[i]>0 then
        set udg_Chaoxi[i]=udg_Chaoxi[i]-1
        call UnitDamageTarget( u, t, r, true, false, ATTACK_TYPE_CHAOS, DAMAGE_TYPE_UNIVERSAL, WEAPON_TYPE_WHOKNOWS )
        set m=CreateUnit(getcorrectplayer(u) ,'u00D',GetUnitX(t),GetUnitY(t),0)
        call UnitApplyTimedLife( m, 'BTLF', 4.00+g )
    else
        if IsUnitType(t, UNIT_TYPE_STRUCTURE) == false then
            call UnitDamageTarget( u, t, r, true, true, ATTACK_TYPE_HERO, DAMAGE_TYPE_NORMAL, WEAPON_TYPE_WHOKNOWS )
            call SetUnitState( u, UNIT_STATE_LIFE,GetUnitState(u, UNIT_STATE_LIFE)+(r*0.5))
            call IssueImmediateOrderById( u, 852183 )
            call IssueImmediateOrderById(u, 852184 )
        endif
    endif
    
    call SetUnitAbilityLevel(u,'A080',g)
    call SetUnitAbilityLevel(u,'A082',g)
    if IsUnitIllusion(t)==false and IsUnitType(t, UNIT_TYPE_HERO) == true then
        call IssueTargetOrderById(u, 852095,t)
    endif
    set t=null
    set u=null
    set m=null
    return false
endfunction



//===========================================================================
function InitTrig_JKA takes nothing returns nothing
    set gg_trg_JKA = CreateTrigger(  )
    call DisableTrigger( gg_trg_JKA )
    call TriggerAddCondition( gg_trg_JKA, Condition( function Trig_JKA_Conditions ) )
endfunction
