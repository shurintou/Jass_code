
//===========================================================================
// Trigger: JKS
//===========================================================================
function jkda takes nothing returns nothing
    local timer tm=GetExpiredTimer()
    local integer i=GetHandleId(tm)
    local unit t=LoadUnitHandle(udg_hash,i,2)
    local unit u=LoadUnitHandle(udg_hash,i,1)
    local integer n=LoadInteger(udg_hash,i,3)
    if n>0 then
        call SaveInteger(udg_hash,i,3,n-1)
        if GetUnitState(t, UNIT_STATE_LIFE)>0 and GetUnitState(u, UNIT_STATE_LIFE)>0 then
        else
            call SetUnitState( u, UNIT_STATE_LIFE,(GetUnitState(u, UNIT_STATE_MAX_LIFE)*0.05*n)+GetUnitState(u, UNIT_STATE_LIFE))
            call UnitRemoveAbility(t,'A083')
            call FlushChildHashtable(udg_hash,i)
            call PauseTimer(tm)
            call DestroyTimer( tm )
        endif
    else
        call UnitRemoveAbility(t,'A083')
        call FlushChildHashtable(udg_hash,i)
        call DestroyTimer( tm )
    endif
    set tm=null
    set t=null
    set u=null
endfunction

function jkxuanact takes nothing returns nothing
    local unit t=GetEnumUnit()
    call UnitDamageTarget( udg_U, t,udg_Re , true, true, ATTACK_TYPE_CHAOS, DAMAGE_TYPE_UNIVERSAL, WEAPON_TYPE_WHOKNOWS )
    call DestroyEffect( AddSpecialEffectTarget("war3mapImported\\jk1effect.mdx", t, "chest") )
    set t=null
endfunction

function jkxuanqu takes nothing returns boolean
    local unit t=GetFilterUnit()
    if IsUnitType(t, UNIT_TYPE_STRUCTURE) == false and IsUnitEnemy(t, udg_P) == true and GetUnitAbilityLevel(t, 'Aloc') == 0 and GetUnitState(t, UNIT_STATE_LIFE)>0 and GetUnitAbilityLevel(t, 'Avul') == 0 then
        set udg_n=udg_n+1
        set t=null
        return true
    endif
    set t=null
    return false
endfunction


function jk2 takes nothing returns nothing
    local timer tm=GetExpiredTimer()
    local integer i=GetHandleId(tm)
    local group g=LoadGroupHandle(udg_hash,i,2)
    local unit u=LoadUnitHandle(udg_hash,i,1)
    local unit m=LoadUnitHandle(udg_hash,i,3)
    local unit t
    
    
    if GetUnitState(u, UNIT_STATE_LIFE)>0 then
        if IsUnitGroupEmptyBJ(g)==false then
            call SetUnitX(m,GetUnitX(u))
            call SetUnitY(m,GetUnitY(u))
            set t=GroupPickRandomUnit(g)
            call SetUnitX(u,GetUnitX(t))
            call SetUnitY(u,GetUnitY(t))
            call SetUnitAnimationByIndex( u, GetRandomInt(11,14) )
            call UnitDamageTarget( u, t,40+(GetHeroLevel(u)*2) , true, true, ATTACK_TYPE_CHAOS, DAMAGE_TYPE_UNIVERSAL, WEAPON_TYPE_WHOKNOWS )
            call DestroyEffect( AddSpecialEffectTarget("war3mapImported\\jk2buff.mdx", t, "chest") )
            call IssueTargetOrderById( m, 852095,t)
            call GroupRemoveUnit(g,t)
        else
            call UnitRemoveAbility(u,'Avul')
            call RemoveUnit(m)
            call SetUnitX(u,LoadReal(udg_hash,i,5))
            call SetUnitY(u,LoadReal(udg_hash,i,6))
            call SetUnitTimeScale( u, 1.00 )
            call PauseUnit( u, false )
            call GroupClear(g)
            call DestroyGroup(g)
            call FlushChildHashtable(udg_hash,i)
            call PauseTimer(tm)
            call DestroyTimer( tm )
        endif
    else
        call UnitRemoveAbility(u,'Avul')
        call RemoveUnit(m)
        call SetUnitX(u,LoadReal(udg_hash,i,5))
        call SetUnitY(u,LoadReal(udg_hash,i,6))
        call SetUnitTimeScale( u, 1.00 )
        call PauseUnit( u, false )
        call GroupClear(g)
        call DestroyGroup(g)
        call FlushChildHashtable(udg_hash,i)
        call DestroyTimer( tm )
    endif
    
    set t=null
    set m=null
    set tm=null
    set g=null
    set u=null
endfunction


function Trig_JKS_Conditions takes nothing returns boolean
    local timer tm
    local integer i
    local unit u=GetTriggerUnit()
    local integer l=GetSpellAbilityId()
    local unit t
    local integer ev=GetHeroLevel(u)
    local group g
    local boolexpr b
    local unit m
    local real x
    local real y
    
    if  l == 'A082'  then
        set t=GetSpellTargetUnit()
        if CheckLinken(t)==true then
            set tm=CreateTimer()
            set udg_Chaoxi[GetConvertedPlayerId(GetTriggerPlayer())]=3+R2I((ev-4)/6)+(3*GetUnitAbilityLevel(u,'B01T'))
            set i=GetHandleId(tm)
            call SaveUnitHandle(udg_hash,i,1,u)
            call SaveUnitHandle(udg_hash,i,2,t)
            call SaveInteger(udg_hash,i,3,15)
            call UnitAddAbility(t,'A083')
            call TimerStart(tm,0.5,true,function jkda)
        endif
    elseif l=='A084' then
        set g=CreateGroup()
        set b=Condition(function jkxuanqu)
        set udg_n=0
        set udg_U=u
        set udg_P=GetTriggerPlayer()
        call GroupEnumUnitsInRange(g,GetUnitX(u),GetUnitY(u),350,b)
        set udg_Re=(udg_n*2)+(10*ev)
        call ForGroup(g,function jkxuanact)
        call DestroyBoolExpr(b)
    elseif l=='A085' then
        set tm=CreateTimer()
        set i=GetHandleId(tm)
        set g=CreateGroup()
        set b=Condition(function jkxuanqu)
        set udg_n=0
        set udg_U=u
        set udg_P=GetTriggerPlayer()
        set m=CreateUnit(getcorrectplayer(u) ,'u000',0,0,0)
        call UnitAddAbility(m,'A086')
        call SetUnitAbilityLevel(m,'A086',R2I((ev-5)/5))
        set x=GetUnitX(u)
        set y=GetUnitY(u)
        call GroupEnumUnitsInRange(g,x,y,350,b)
        set udg_n=0
        call UnitAddAbility(u,'Avul')
        call SetUnitTimeScale( u, 2.00 )
        call PauseUnit( u, true )
        call SaveUnitHandle(udg_hash,i,1,u)
        call SaveUnitHandle(udg_hash,i,3,m)
        call SaveReal(udg_hash,i,5,x)
        call SaveReal(udg_hash,i,6,y)
        call SaveGroupHandle(udg_hash,i,2,g)
        call TimerStart(tm,0.2,true,function jk2)
        call DestroyBoolExpr(b)
    endif
    
    
    set u=null
    set t=null
    set g=null
    set b=null
    set m=null
    set tm=null
    return false
endfunction



//===========================================================================
function InitTrig_JKS takes nothing returns nothing
    set gg_trg_JKS = CreateTrigger(  )
    call DisableTrigger( gg_trg_JKS )
    call TriggerAddCondition( gg_trg_JKS, Condition( function Trig_JKS_Conditions ) )
endfunction
