
//===========================================================================
// Trigger: huixueV
//===========================================================================
function huixueVact takes nothing returns nothing
    local timer tm=GetExpiredTimer()
    local integer i=GetHandleId(tm)
    local integer n=LoadInteger(udg_hash,i,2)
    local unit u=LoadUnitHandle(udg_hash,i,1)
    local real r=GetUnitState(u, UNIT_STATE_LIFE)
    
    if n>0 and r>0 then
        call SaveInteger(udg_hash,i,2,n-1)
        if r/GetUnitState(u, UNIT_STATE_MAX_LIFE)<0.4 then
            call SetUnitState( u, UNIT_STATE_LIFE, r+LoadInteger(udg_hash,i,3)*2 )
        else
            call SetUnitState( u, UNIT_STATE_LIFE, r+LoadInteger(udg_hash,i,3) )
        endif
    else
        call DestroyEffect( LoadEffectHandle(udg_hash,i,44))
        call FlushChildHashtable( udg_hash, i )
        call DestroyTimer(tm)
    endif
    set tm=null
    set u=null
endfunction

function Trig_huixueV_Conditions takes nothing returns boolean
    local timer tm
    local unit u
    local unit t=GetSpellTargetUnit()
    local integer i
    local integer l=GetSpellAbilityId()
    local real r
    if  l == 'A02M'  then
        set tm=CreateTimer()
        set i=GetHandleId(tm)
        call SaveUnitHandle(udg_hash,i,1,t)
        call SaveInteger(udg_hash,i,2,30)
        call SaveEffectHandle(udg_hash,i,44,AddSpecialEffectTarget("Abilities\\Spells\\Items\\ScrollOfRejuvenation\\ScrollManaHealth.mdl", t, "chest"))
        if GetUnitPointValue(t) == 50 then
            call SaveInteger(udg_hash,i,3,GetHeroStr(t, true))
        else
            if GetUnitPointValue(t) == 51 then
                call SaveInteger(udg_hash,i,3,GetHeroAgi(t, true))
            else
                call SaveInteger(udg_hash,i,3,GetHeroInt(t, true))
            endif
        endif
        call TimerStart(tm,0.75,true,function huixueVact)
    elseif  l == 'A02N'  then
        if CheckLinken(t)==true then
            set u=GetTriggerUnit()
            set r=GetUnitAbilityLevel(u,'B01T')+(GetHeroLevel(u)/10)
            call UnitDamageTarget( t, u, GetUnitState(u, UNIT_STATE_LIFE)*0.1*(6-r), true, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
            call UnitDamageTarget( u, t, GetUnitState(t, UNIT_STATE_LIFE)*0.1*(4+r), true, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
            call DestroyEffect( AddSpecialEffectTarget("Abilities\\Spells\\Human\\MarkOfChaos\\MarkOfChaosDone.mdl", u, "chest") )
            call DestroyEffect( AddSpecialEffectTarget("Abilities\\Spells\\Human\\MarkOfChaos\\MarkOfChaosDone.mdl", t, "chest") )
        endif
    endif
    
    set tm=null
    set t=null
    set u=null
    return false
endfunction



//===========================================================================
function InitTrig_huixueV takes nothing returns nothing
    set gg_trg_huixueV = CreateTrigger(  )
    call DisableTrigger( gg_trg_huixueV )
    call TriggerAddCondition( gg_trg_huixueV, Condition( function Trig_huixueV_Conditions ) )
endfunction
