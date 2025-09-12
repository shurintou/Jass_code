
//===========================================================================
// Trigger: XINGSpell
//===========================================================================
function shurentiaojian takes nothing returns boolean
    local unit t=GetFilterUnit()
    if IsUnitType(t, UNIT_TYPE_STRUCTURE) == false and IsUnitEnemy(t, udg_P) == true and GetUnitAbilityLevel(t, 'Aloc') == 0 and GetUnitState(t, UNIT_STATE_LIFE)>0 then
        call UnitAddAbility(t,'A037')
        call IssuePointOrderById( t, 851986, GetUnitX(t)+GetRandomReal(-200,200), GetUnitY(t)+GetRandomReal(-200,200) )
        
        call UnitDamageTarget( udg_U, t, udg_Re, true, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
        
        
        set t=null
        return true
    endif
    set t=null
    return false
endfunction

function timerchixukongju takes nothing returns nothing
    local unit t=GetEnumUnit()
    call IssuePointOrderById( t, 851986, GetUnitX(t)+GetRandomReal(-200,200), GetUnitY(t)+GetRandomReal(-200,200) )
    
    call UnitDamageTarget( udg_U, t, udg_Re, true, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
    
    set t=null
endfunction

function shanchukongjubuff takes nothing returns nothing
    local unit u=GetEnumUnit()
    call UnitRemoveAbility(u,'A037')
    set u=null
endfunction

function buduankongju takes nothing returns nothing
    local timer tm=GetExpiredTimer()
    local integer i=GetHandleId(tm)
    local unit u=LoadUnitHandle(udg_hash,i,1)
    local integer n=LoadInteger(udg_hash,i,2)
    local group g=LoadGroupHandle(udg_hash,i,3)
    
    if GetUnitState(u, UNIT_STATE_LIFE)>0 and n>0 then
        set udg_U=u
        set udg_Re=GetHeroStr(u, true)/5
        call ForGroup(g,function timerchixukongju)
        call SaveInteger(udg_hash,i,2,n-1)
    else
        
        call ForGroup(g,function shanchukongjubuff)
        call GroupClear( g )
        call DestroyGroup( g )
        call FlushChildHashtable( udg_hash,i)
        call DestroyTimer( tm )
    endif
    
    set u=null
    set g=null
    set tm=null
endfunction

function mengduohuixue takes nothing returns nothing
    local timer tm=GetExpiredTimer()
    local integer i=GetHandleId(tm)
    local unit u=LoadUnitHandle(udg_hash,i,1)
    local integer n=LoadInteger(udg_hash,i,2)
    local real r=GetUnitState(u, UNIT_STATE_LIFE)
    
    if r>0 and n>0 then
        call SetUnitState( u, UNIT_STATE_LIFE, r+LoadReal(udg_hash,i,3) )
        call DestroyEffect( AddSpecialEffectTarget("war3mapImported\\NatureExplosion.mdx", u, "origin") )
        call SaveInteger(udg_hash,i,2,n-1)
    else
        call FlushChildHashtable( udg_hash,i)
        call DestroyTimer( tm )
    endif
    set u=null
    set tm=null
endfunction

function Trig_XINGSpell_Conditions takes nothing returns boolean
    local group g
    local unit u
    local boolexpr b
    local timer tm
    local integer i
    local integer l=GetSpellAbilityId()
    if  l == 'A036'  then
        set u=GetTriggerUnit()
        
        set g=CreateGroup()
        set udg_P=GetOwningPlayer(u)
        set udg_U=u
        set udg_Re=GetHeroStr(u, true)/5
        set b=Condition(function shurentiaojian)
        call GroupEnumUnitsInRange(g,GetUnitX(u),GetUnitY(u),800,b)
        set tm=CreateTimer()
        set i=GetHandleId(tm)
        call SaveUnitHandle(udg_hash,i,1,u)
        call SaveInteger(udg_hash,i,2,(8*GetUnitAbilityLevel(u,'B01T'))+R2I(GetHeroLevel(u)/2))
        call SaveGroupHandle(udg_hash,i,3,g)
        call DestroyBoolExpr(b)
        call TimerStart(tm,0.2,true,function buduankongju)
    elseif l=='A05D' then
        set u=GetTriggerUnit()
        set tm=CreateTimer()
        set i=GetHandleId(tm)
        call SetUnitAbilityLevel(u,'A05D',R2I((GetHeroLevel(u)-3)/7))
        call SaveUnitHandle(udg_hash,i,1,u)
        call SaveInteger(udg_hash,i,2,20)
        call SaveReal(udg_hash,i,3,0.02*GetUnitState(u, UNIT_STATE_MAX_LIFE))
        call SetUnitState( u, UNIT_STATE_LIFE, 0.8*GetUnitState(u, UNIT_STATE_LIFE) )
        call TimerStart(tm,0.5,true,function mengduohuixue)
    elseif l=='AIh1' then
        call UnitResetCooldown(GetTriggerUnit())
    endif
    
    set g=null
    set u=null
    set b=null
    set tm=null
    return false
endfunction



//===========================================================================
function InitTrig_XINGSpell takes nothing returns nothing
    set gg_trg_XINGSpell = CreateTrigger(  )
    call DisableTrigger( gg_trg_XINGSpell )
    call TriggerAddCondition( gg_trg_XINGSpell, Condition( function Trig_XINGSpell_Conditions ) )
endfunction
