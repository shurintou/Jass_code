
//===========================================================================
// Trigger: JumoA
//===========================================================================
function Trig_JumoA_Conditions takes nothing returns boolean
    local unit t=GetEventTargetUnit()
    local unit u=GetTriggerUnit()
    local integer i=R2I((GetHeroLevel(u)-3)/7)
    local integer n=GetConvertedPlayerId(GetTriggerPlayer())
    local integer ir
    
    if GetUnitAbilityLevel(u,'A07R')<4 then
        set udg_Chaoxi[n]=udg_Chaoxi[n]-1
        if udg_Chaoxi[n]<=0 then
            if udg_SpellTarget[n]==t then
                call SetUnitAbilityLevel(u,'A07H',GetUnitAbilityLevel(u,'A07H')+i)
                set ir=GetUnitAbilityLevel(u,'A07H')*12
                call SetUnitVertexColor(u , 118+(ir), 267-(ir), 142-(ir), 255 )
                if GetUnitAbilityLevel(u,'A07H')==11 then
                    call SetUnitVertexColor(u , 255, 0, 0, 255 )
                    call SetUnitAbilityLevel(u,'A07R',3+i)
                    call UnitAddAbility(u,'A07S')
                    set udg_Chaoxi[n]=6+(2*i)
                endif
            else
                call SetUnitAbilityLevel(u,'A07H',R2I(GetUnitAbilityLevel(u,'A07H')/1.5)-1)
                set ir=GetUnitAbilityLevel(u,'A07H')*12
                call SetUnitVertexColor(u , 118+(ir), 267-(ir), 142-(ir), 255 )
                set udg_SpellTarget[n]=t
            endif
        endif
        call SetUnitState( u, UNIT_STATE_LIFE,GetUnitState(u, UNIT_STATE_LIFE)+(GetUnitState(u, UNIT_STATE_MAX_LIFE)*0.0002*ir))
    else
        set udg_Chaoxi[n]=udg_Chaoxi[n]-1
        if udg_Chaoxi[n]<=0 then
            set udg_Chaoxi[n]=10+(3*i)
            call SetUnitAbilityLevel(u,'A07R',i)
            call UnitRemoveAbility(u,'A07S')
            call SetUnitAbilityLevel(u,'A07H',1)
            call SetUnitVertexColor(u , 130, 255, 130, 255 )
        endif
        call UnitDamageTarget( u, t,(i*50)+50, true, false, ATTACK_TYPE_HERO, DAMAGE_TYPE_ENHANCED, WEAPON_TYPE_WHOKNOWS )
        call SetUnitState( u, UNIT_STATE_LIFE,GetUnitState(u, UNIT_STATE_LIFE)+(GetUnitState(u, UNIT_STATE_MAX_LIFE)*0.06))
    endif
    
    call SetUnitAbilityLevel( u, 'A07P', i )
    call SetUnitAbilityLevel( u, 'AO7O', i )
    call IssueImmediateOrderById(u, 852183 )
    call IssueImmediateOrderById(u, 852184 )
    set u=null
    set t=null
    return false
endfunction



//===========================================================================
function InitTrig_JumoA takes nothing returns nothing
    set gg_trg_JumoA = CreateTrigger(  )
    call DisableTrigger( gg_trg_JumoA )
    call TriggerAddCondition( gg_trg_JumoA, Condition( function Trig_JumoA_Conditions ) )
endfunction
