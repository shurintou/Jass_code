
//===========================================================================
// Trigger: VNQ
//===========================================================================
function asdwqeiuhgqqwe takes nothing returns nothing
    local timer tm=GetExpiredTimer()
    local integer i=GetHandleId(tm)
    local integer n=LoadInteger( udg_hash, i,5)
    local unit u=LoadUnitHandle( udg_hash, i,1)
    
    if n>0 then
        
        call SetUnitState( u, UNIT_STATE_LIFE, GetUnitState(u, UNIT_STATE_MAX_LIFE)*0.1+GetUnitState(u, UNIT_STATE_LIFE) )
        call SetUnitState( u, UNIT_STATE_MANA, GetUnitState(u, UNIT_STATE_MAX_MANA)*0.1+GetUnitState(u, UNIT_STATE_MANA) )
        call SaveInteger(udg_hash,i,5,n-1)
    else
        call DestroyEffect(LoadEffectHandle(udg_hash,i,3))
        call UnitRemoveAbility(u,'Agho' )
        call UnitRemoveAbility(u,'Apiv' )
        call FlushChildHashtable( udg_hash, i )
        call DestroyTimer(tm)
    endif
    
    set tm=null
    set u=null
endfunction



function Trig_VNQ_Conditions takes nothing returns boolean
    local unit u=GetTriggerUnit()
    local unit t
    local integer l=GetSpellAbilityId()
    local timer tm
    local integer i
    
    if  l == 'A01I'  then
        set t=GetSpellTargetUnit()
        if CheckLinken(t)==true then
            call DestroyEffect( AddSpecialEffectTarget("Abilities\\Spells\\NightElf\\Blink\\BlinkCaster.mdl",t, "origin") )
            call DestroyEffect( AddSpecialEffectTarget("Abilities\\Spells\\NightElf\\Blink\\BlinkTarget.mdl",u, "origin") )
            call UnitDamageTarget( u, t, GetUnitState(t, UNIT_STATE_MAX_LIFE)*0.015, true, true, ATTACK_TYPE_CHAOS, DAMAGE_TYPE_UNIVERSAL, WEAPON_TYPE_WHOKNOWS )
            call SetUnitX(t,GetUnitX(u)+GetRandomReal(-100,100))
            call SetUnitY(t,GetUnitY(u)+GetRandomReal(-100,100))
            call IssueTargetOrderById( u, 851985, t )
        endif
    elseif l == 'A01J' then
        set tm=CreateTimer()
        call UnitAddAbility( u, 'Agho' )
        call UnitAddAbility( u, 'Apiv' )
        set i=GetHandleId(tm)
        set l=3*GetUnitAbilityLevel(u,'B01T')
        call SaveUnitHandle( udg_hash, i, 1, u )
        call SaveInteger(udg_hash, i, 5,3+R2I(GetHeroLevel(u)/5)+l)
        call SaveEffectHandle(udg_hash,i,3,AddSpecialEffectTarget("war3mapImported\\MoonBuff.mdx", u, "origin"))
        call TimerStart(tm, 1, true, function asdwqeiuhgqqwe )
    endif
    
    set u=null
    set t=null
    set tm=null
    return false
endfunction



//===========================================================================
function InitTrig_VNQ takes nothing returns nothing
    set gg_trg_VNQ = CreateTrigger(  )
    call DisableTrigger(gg_trg_VNQ)
    call TriggerAddCondition( gg_trg_VNQ, Condition( function Trig_VNQ_Conditions ) )
    
endfunction
