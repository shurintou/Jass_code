
//===========================================================================
// Trigger: CKS
//===========================================================================
function Unitforwudi takes nothing returns boolean
    local unit t=GetFilterUnit()
    if IsUnitType(t, UNIT_TYPE_STRUCTURE) == false and IsUnitEnemy(t, udg_P) == true and GetUnitAbilityLevel(t, 'Aloc') == 0 and GetUnitAbilityLevel(t, 'Avul') == 0 and GetUnitState(t, UNIT_STATE_LIFE)>0 and IsUnitType(t, UNIT_TYPE_ETHEREAL) == false and IsUnitType(t, UNIT_TYPE_SLEEPING) == false  then
        call UnitDamageTarget( udg_U, t, GetRandomReal(12*udg_i,16*udg_i), true, true, ATTACK_TYPE_HERO, DAMAGE_TYPE_NORMAL, WEAPON_TYPE_WHOKNOWS )
        set t=null
        return true
    endif
    set t=null
    return false
endfunction

function movewudi takes nothing returns nothing
    local timer tm=GetExpiredTimer()
    local integer m=GetHandleId(tm)
    local unit u=LoadUnitHandle(udg_hash, m, 1)
    local integer n=LoadInteger(udg_hash, m, 2)
    local unit t
    local boolexpr b
    local group g
    local integer l
    
    
    if n>0 then
        set udg_P=GetOwningPlayer(u)
        set udg_U=u
        set udg_i=GetHeroLevel(u)
        set g=CreateGroup()
        set b=Condition(function Unitforwudi)
        call GroupEnumUnitsInRange(g,GetUnitX(u),GetUnitY(u),500,b)
        if CountUnitsInGroup(g)>0 then
            set t=GroupPickRandomUnit(g)
            call SetUnitX(u,GetUnitX(t)+GetRandomReal(-50,50))
            call SetUnitY(u,GetUnitY(t)+GetRandomReal(-50,50))
            call SetUnitFlyHeight(  u, GetRandomReal(50,250), 750.00 )
            call IssueTargetOrderById( u, 851983, t )
            call UnitDamageTarget( u, t, GetRandomReal(12*udg_i,24*udg_i), true, true, ATTACK_TYPE_HERO, DAMAGE_TYPE_NORMAL, WEAPON_TYPE_WHOKNOWS )
            call SaveInteger(udg_hash,m,2,n-1)
        else
            call SaveInteger(udg_hash,m,2,0)
        endif
        call GroupClear(g)
        call DestroyGroup(g)
        call DestroyBoolExpr(b)
    else
        call DestroyEffect( LoadEffectHandle(udg_hash, m, 3) )
        call DestroyEffect( LoadEffectHandle(udg_hash, m, 6) )
        if GetOwningPlayer(u)==Player(0) then
            call SelectUnitForPlayerSingle( u, Player(0) )
        endif
        set n=R2I((GetHeroLevel(u)-4)/6)
        call UnitAddAbility(u,'A058')
        call UnitAddAbility(u,'A05A')
        call SetUnitAbilityLevel(u,'A058',n)
        call SetUnitAbilityLevel(u,'A05A',n)
        call SetUnitAbilityLevel(u,'A04Y',n)
        call FlushChildHashtable( udg_hash, m )
        call DestroyTimer(tm)
        call UnitRemoveAbility(u,'Avul')
        call SetUnitFlyHeight(  u, 0, 750.00 )
        call SetUnitVertexColor( u, 255, 255, 255, 255 )
        call SetUnitMoveSpeed( u, GetUnitDefaultMoveSpeed(u) )
    endif
    
    
    set u=null
    set t=null
    set g=null
    set b=null
    set tm=null
endfunction

function CKfog takes nothing returns nothing
    local timer tm=GetExpiredTimer()
    local integer i=GetHandleId(tm)
    local unit u=LoadUnitHandle(udg_hash, i, 1)
    local integer n=LoadInteger(udg_hash, i, 2)
    if n>0 then
        call SaveInteger(udg_hash,i,2,n-1)
        call IssuePointOrderById( u, 852592, LoadReal(udg_hash, i, 3), LoadReal(udg_hash, i, 4) )
    else
        call RemoveUnit(u)
        call DestroyEffect( LoadEffectHandle(udg_hash, i, 6) )
        call DestroyEffect( LoadEffectHandle(udg_hash, i, 7) )
        call DestroyEffect( LoadEffectHandle(udg_hash, i, 8) )
        call FlushChildHashtable( udg_hash, i )
        call DestroyTimer(tm)
    endif
    set u=null
    set tm=null
endfunction

function CKB takes nothing returns nothing
    local timer tm=GetExpiredTimer()
    local integer i=GetHandleId(tm)
    local unit u=LoadUnitHandle(udg_hash, i, 1)
    local integer n=LoadInteger(udg_hash, i, 2)
    if n<10 then
        call SetUnitVertexColor( u, 255, 255, 255, 0+25*n )
        call SaveInteger(udg_hash,i,2,n+1)
    else
        call SetUnitVertexColor( u, 255, 255, 255, 255 )
        call FlushChildHashtable( udg_hash, i )
        call DestroyTimer(tm)
    endif
    set u=null
    set tm=null
endfunction

function Trig_CKS_Conditions takes nothing returns boolean
    local timer tm
    local integer i
    local unit u=GetTriggerUnit()
    local integer l=GetSpellAbilityId()
    local unit t
    local integer lv=GetHeroLevel(u)
    local real x
    local real y
    local unit m
    local integer g=GetConvertedPlayerId(GetTriggerPlayer())
    
    if l == 'A04Y'  then
        set tm=CreateTimer()
        set i=GetHandleId(tm)
        set t=GetSpellTargetUnit()
        call SetUnitX(u,GetUnitX(t)+GetRandomReal(-50,50))
        call SetUnitY(u,GetUnitY(t)+GetRandomReal(-50,50))
        call UnitAddAbility( u, 'Amrf' )
        call UnitRemoveAbility( u, 'Amrf' )
        call SetUnitFlyHeight(  u, GetRandomReal(50,250), 750.00 )
        call IssueTargetOrderById( u, 851983, t )
        call UnitDamageTarget( u, t, GetRandomReal(lv*20,lv*30), true, true, ATTACK_TYPE_HERO, DAMAGE_TYPE_NORMAL, WEAPON_TYPE_WHOKNOWS )
        call SaveUnitHandle(udg_hash,i,1,u)
        call SaveInteger(udg_hash,i,2,6+R2I(lv/5)+(2*GetUnitAbilityLevel(u,'B01T')))
        
        
        if GetOwningPlayer(u)==Player(0) then
            call SelectUnitRemoveForPlayer( u, Player(0) )
        else
            set udg_SpellTimer[g]=R2I((6+(lv/5))/4)
        endif
        call UnitAddAbility(u,'Avul')
        call UnitRemoveAbility(u,'A058')
        call UnitRemoveAbility(u,'A05A')
        call SaveEffectHandle( udg_hash, i, 3, AddSpecialEffectTarget("war3mapImported\\222.mdx", u, "origin"))
        call SaveEffectHandle( udg_hash, i, 6, AddSpecialEffectTarget("war3mapImported\\CKda.mdx", u, "chest"))
        call SetUnitVertexColor( u, 255, 255, 255, 125 )
        call SetUnitMoveSpeed( u, 5 )
        set udg_UGharm[g]=udg_UGharm[g]+500+(20*lv)
        call TimerStart(tm,0.5,true,function movewudi)
    elseif l=='A058' then
        set tm=CreateTimer()
        set i=GetHandleId(tm)
        set x=GetSpellTargetX()
        set y=GetSpellTargetY()
        set t=CreateUnit(getcorrectplayer(u) ,'u000',x,y,0)
        call UnitAddAbility(t,'ACsi')
        call SetUnitAbilityLevel(t,'ACsi',R2I((lv-4)/6))
        call SaveUnitHandle(udg_hash,i,1,t)
        call SaveInteger(udg_hash,i,2,5)
        call SaveReal(udg_hash,i,3,x)
        call SaveReal(udg_hash,i,4,y)
        call SaveEffectHandle( udg_hash, i, 6,AddSpecialEffect("Abilities\\Spells\\Human\\CloudOfFog\\CloudOfFog.mdl", x+GetRandomReal(-150,150), y+GetRandomReal(-150,150)))
        call SaveEffectHandle( udg_hash, i, 7,AddSpecialEffect("Abilities\\Spells\\Human\\CloudOfFog\\CloudOfFog.mdl", x+GetRandomReal(-150,150), y+GetRandomReal(-150,150)))
        call SaveEffectHandle( udg_hash, i, 8,AddSpecialEffect("Abilities\\Spells\\Human\\CloudOfFog\\CloudOfFog.mdl", x+GetRandomReal(-150,150), y+GetRandomReal(-150,150)))
        call TimerStart(tm,1,true,function CKfog)
        set udg_UGharm[g]=udg_UGharm[g]+250+(10*lv)
    elseif l=='A05A' then
        set t=GetSpellTargetUnit()
        if CheckLinken(t)==true then
            set tm=CreateTimer()
            set i=GetHandleId(tm)
            set m=CreateUnit(getcorrectplayer(u) ,'u000',GetUnitX(u),GetUnitY(u),GetUnitFacing(u))
            call UnitAddAbility(m,'A09P')
            call IssueTargetOrderById(m, 852095, t)
            call UnitApplyTimedLife( m, 'BTLF', 1.00 )
            call UnitDamageTarget( u, t, GetHeroAgi(u, true)*4, true, true, ATTACK_TYPE_HERO,DAMAGE_TYPE_NORMAL, WEAPON_TYPE_WHOKNOWS )
            call SaveUnitHandle(udg_hash,i,1,u)
            call SaveInteger(udg_hash,i,2,1)
            call SetUnitVertexColor( u, 255, 255, 255, 0 )
            call SetUnitX(u,GetUnitX(t)+GetRandomReal(-25,25))
            call SetUnitY(u,GetUnitY(t)+GetRandomReal(-25,25))
            call IssueTargetOrderById( u, 851983, t )
            call DestroyEffect( AddSpecialEffectTarget("war3mapImported\\[AKE]war3AKE.com - 4290201822266721885371863.mdx", t, "chest") )
            call TimerStart(tm,0.1,true,function CKB)
            set udg_UGharm[g]=udg_UGharm[g]+125+(5*lv)
        endif
    endif
    
    set m=null
    set tm=null
    set u=null
    set t=null
    return false
endfunction



//===========================================================================
function InitTrig_CKS takes nothing returns nothing
    set gg_trg_CKS = CreateTrigger(  )
    call DisableTrigger( gg_trg_CKS )
    call TriggerAddCondition( gg_trg_CKS, Condition( function Trig_CKS_Conditions ) )
endfunction
