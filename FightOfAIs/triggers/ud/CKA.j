
//===========================================================================
// Trigger: CKA
//===========================================================================
function Trig_CKA_Conditions takes nothing returns boolean
    local unit u=GetTriggerUnit()
    local unit t=GetEventTargetUnit()
    local real r
    local real h
    local integer i
    local real mr=GetUnitState(u, UNIT_STATE_MAX_LIFE)
    local real g=GetHeroLevel(u)/10
    local real hr = 0
    if IsUnitType(t, UNIT_TYPE_STRUCTURE) == false and GetOwningPlayer(t) != Player(PLAYER_NEUTRAL_AGGRESSIVE) then
        set i=GetConvertedPlayerId(GetTriggerPlayer())
        
        set r=GetUnitState(t, UNIT_STATE_LIFE)*g*0.06
        call UnitDamageTarget( u, t, r , true, true, ATTACK_TYPE_HERO, DAMAGE_TYPE_NORMAL, WEAPON_TYPE_WHOKNOWS )
        
        set h=GetUnitState(t, UNIT_STATE_MAX_LIFE)-mr
        if h>0 then
            call DestroyEffect( AddSpecialEffectTarget("war3mapImported\\22.mdx", t, "chest") )
            call UnitDamageTarget( u, t, h*g*0.06 , true, true, ATTACK_TYPE_HERO, DAMAGE_TYPE_NORMAL, WEAPON_TYPE_WHOKNOWS )
        endif
        
        if GetUnitAbilityLevel(u,'A059')>0 then
        else
            call UnitAddAbility(u,'A059')
        endif
        
        
        set udg_UGharm[i]=udg_UGharm[i]+r
        if udg_UGharm[i]>mr then
            set hr = (udg_UGharm[i]-mr)*0.6
            set udg_UGharm[i]= udg_UGharm[i] - hr
            call UnitDamageTarget( u, t, hr , true, true, ATTACK_TYPE_HERO, DAMAGE_TYPE_NORMAL, WEAPON_TYPE_WHOKNOWS )
        endif
        
        call IssuePointOrderById( u, 852232, GetUnitX(t), GetUnitY(t) )
        call IssueTargetOrderById( u, 852095, t )
        
        if  IsUnitType(t, UNIT_TYPE_HERO) == true  then
            call IssueTargetOrderById(u, 852662, t)
        endif
        call DestroyEffect( AddSpecialEffectTarget("war3mapImported\\[AKE]war3AKE.com - 4290201822266721885371863.mdx", t, "chest") )
    endif
    set u=null
    set t=null
    return false
endfunction



//===========================================================================
function InitTrig_CKA takes nothing returns nothing
    set gg_trg_CKA = CreateTrigger(  )
    call DisableTrigger( gg_trg_CKA )
    call TriggerAddCondition( gg_trg_CKA, Condition( function Trig_CKA_Conditions ) )
endfunction
