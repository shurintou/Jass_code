
//===========================================================================
// Trigger: MonkeyS
//===========================================================================
function makeillusion takes unit u,unit t returns nothing
    local unit m=CreateUnit(getcorrectplayer(u),'u000',0,0,0)
    //local unit m=CreateUnit(GetOwningPlayer(u),'u000',0,0,0)
    call UnitAddAbility(m,'AIil')
    call SetUnitAbilityLevel(m,'AIil',R2I((GetHeroLevel(u)-5)/5))
    call IssueTargetOrderById( m, 852274,t )
    call UnitApplyTimedLife( m, 'BTLF', 1.50 )
    call SetUnitState( u, UNIT_STATE_LIFE, 0.8*GetUnitState(u, UNIT_STATE_LIFE) + 0.2*GetUnitState(u, UNIT_STATE_MAX_LIFE)  )
    set m=null
endfunction

function huanxiangtoenemey takes nothing returns nothing
    local timer tm=GetExpiredTimer()
    local integer i=GetHandleId(tm)
    local unit t=LoadUnitHandle(udg_hash,i,2)
    local unit u
    
    if GetUnitState(t, UNIT_STATE_LIFE)>0 then
        set u=LoadUnitHandle(udg_hash,i,1)
        call makeillusion(u,t)
    endif
    call FlushChildHashtable( udg_hash, i )
    call PauseTimer(tm)
    call DestroyTimer(tm)
    
    set tm=null
    set u=null
    set t=null
endfunction

function huanxiangfangchangmao takes nothing returns boolean
    local unit t=GetFilterUnit()
    local unit m
    if IsUnitIllusion(t) and IsUnitEnemy(t,udg_P)==false and GetUnitTypeId(t)=='O00J' then
        set m=CreateUnit(udg_P,'o00I',GetUnitX(t), GetUnitY(t),0)
        call SetUnitScale( m, 1, 1, 1 )
        call SetUnitAbilityLevel(m,'A0AC',udg_n)
        call UnitApplyTimedLife( m, 'BTLF', 1.50 )
        call IssueTargetOrderById( m,852095, udg_U)
        call SetUnitFacingTimed(t, bj_RADTODEG * Atan2(GetUnitY(udg_U) - GetUnitY(t),GetUnitX(udg_U) - GetUnitX(t) ), 0.2)
        call SetUnitAnimationByIndex( t, 2 )
    endif
    set t=null
    set m=null
    return false
endfunction

function huanxianghuixue takes nothing returns boolean
    local unit t=GetFilterUnit()
    local unit m
    local real r
    if IsUnitIllusion(t) and IsUnitAlly(t, udg_P) then
        set r = GetUnitState(t, UNIT_STATE_LIFE)
        set m=CreateUnit(udg_P,'u000',GetUnitX(t),GetUnitY(t),0)
        call UnitAddAbility(m,'A0AD')
        call UnitApplyTimedLife( m, 'BTLF', 1.50 )
        call SetUnitState( udg_U, UNIT_STATE_LIFE, GetUnitState(udg_U, UNIT_STATE_LIFE) + r*0.1)
        call SetUnitState( t, UNIT_STATE_LIFE, r*0.9)
        call IssuePointOrderById( m, 852664, GetUnitX(udg_U), GetUnitY(udg_U) )
    endif
    set t=null
    set m=null
    return false
endfunction


function huanxiangxuanze takes nothing returns boolean
    local unit t=GetFilterUnit()
    local unit m
    if IsUnitIllusion(t) then
        if IsUnitEnemy(t, udg_P) then
            call SetUnitOwner( t, GetOwningPlayer(udg_U), true )
            call SetUnitState( udg_U, UNIT_STATE_LIFE, GetUnitState(udg_U, UNIT_STATE_LIFE) + 0.1*GetUnitState(udg_U, UNIT_STATE_MAX_LIFE)  )
            call DestroyEffect( AddSpecialEffectTarget("Abilities\\Spells\\Undead\\Darksummoning\\DarkSummonTarget.mdl", t, "origin") )
        endif
        set m= CreateUnit(udg_P,'u000',0,0,0)
        call UnitAddAbility(m,'A0AE')
        call SetUnitAbilityLevel(m,'A0AE',udg_n)
        call UnitApplyTimedLife( m, 'BTLF', 2.50 )
        call IssuePointOrderById( m, 852089, GetUnitX(t), GetUnitY(t) )
    endif
    set m=null
    set t=null
    return false
endfunction


function Trig_MonkeyS_Conditions takes nothing returns boolean
    local unit u=GetTriggerUnit()
    local integer l=GetSpellAbilityId()
    local boolexpr b
    local integer level=R2I((GetHeroLevel(u)-5)/5)
    local unit t
    local timer tm
    local integer i=0
    local real x
    local real y
    
    
    if l == 'A0A5'  then
        set t=GetSpellTargetUnit()
        if CheckLinken(t)==true then
            set tm=CreateTimer()
            set i=GetHandleId(tm)
            set x= GetUnitX(t) - GetUnitX(u)
            set y= GetUnitY(t) - GetUnitY(u)
            call SaveUnitHandle(udg_hash,i,1,u)
            call SaveUnitHandle(udg_hash,i,2,t)
            call TimerStart(tm ,SquareRoot(x*x+y*y)/1000 ,false,function huanxiangtoenemey)
            set udg_P=getcorrectplayer(u)
            set udg_U=t
            set udg_n=level
            set b=Condition(function huanxiangfangchangmao)
            call GroupEnumUnitsInRange(udg_NullGroup,GetUnitX(u),GetUnitY(u),800+(50*level),b)
            call DestroyBoolExpr(b)
        endif
    elseif l== 'A09V' then
        set udg_P=getcorrectplayer(u)
        call makeillusion(u,u)
        set b=Condition(function huanxianghuixue)
        set udg_U=u
        call GroupEnumUnitsInRange(udg_NullGroup,GetUnitX(u),GetUnitY(u),800+(50*level),b)
        call DestroyBoolExpr(b)
    elseif l=='A0AB' then
        set udg_P=getcorrectplayer(u)
        set udg_U=u
        set udg_n=R2I((GetHeroLevel(u)-4)/7) + GetUnitAbilityLevel(u,'B01T')
        set b=Condition(function huanxiangxuanze)
        call GroupEnumUnitsInRange(udg_NullGroup,GetUnitX(u),GetUnitY(u),800+(50*udg_n),b)
        call DestroyBoolExpr(b)
    elseif l=='A016' then
        call SetUnitState( u, UNIT_STATE_LIFE, 0.8*GetUnitState(u, UNIT_STATE_LIFE) + 0.2*GetUnitState(u, UNIT_STATE_MAX_LIFE)  )
    endif
    
    set tm=null
    set u=null
    set t=null
    set b=null
    return false
endfunction


//===========================================================================
function InitTrig_MonkeyS takes nothing returns nothing
    set gg_trg_MonkeyS = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_MonkeyS, Condition( function Trig_MonkeyS_Conditions ) )
    
endfunction
