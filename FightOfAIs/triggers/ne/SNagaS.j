
//===========================================================================
// Trigger: SNagaS
//
// 
//===========================================================================
function  smallnaga1 takes nothing returns boolean
    local unit t=GetFilterUnit()
    if IsUnitEnemy(t, udg_P) == true and GetUnitAbilityLevel(t, 'Aloc') == 0 and GetUnitState(t, UNIT_STATE_LIFE)>0 and IsUnitType(t, UNIT_TYPE_STRUCTURE) == false then
        call UnitAddAbility(udg_U,'ACmi')
        call UnitDamageTarget( udg_U, t, udg_n, true, true,ATTACK_TYPE_HERO, DAMAGE_TYPE_NORMAL, WEAPON_TYPE_WHOKNOWS )
        call UnitRemoveAbility(udg_U,'ACmi')
        call DestroyEffect( AddSpecialEffectTarget("war3mapImported\\smallnaga6.mdx", t, "chest") )
        call UnitRemoveAbility( t, 'BHab' )
        call UnitRemoveAbility( t, 'Binf' )
        call UnitRemoveAbility( t, 'Binv' )
        call UnitRemoveAbility( t, 'B005' )
        call UnitRemoveAbility( t, 'BOac' )
        call UnitRemoveAbility( t, 'BOvd' )
        call UnitRemoveAbility( t, 'BOwk' )
        call UnitRemoveAbility( t, 'BOae' )
        call UnitRemoveAbility( t, 'BOmi' )
        call UnitRemoveAbility( t, 'Bblo' )
        call UnitRemoveAbility( t, 'Bspl' )
        call UnitRemoveAbility( t, 'Bbsk' )
        call UnitRemoveAbility( t, 'Blsh' )
        call UnitRemoveAbility( t, 'BUav' )
        call UnitRemoveAbility( t, 'BUau' )
        call UnitRemoveAbility( t, 'BUfa' )
        call UnitRemoveAbility( t, 'Bams' )
        call UnitRemoveAbility( t, 'Bam2' )
        call UnitRemoveAbility( t, 'BUhf' )
        call UnitRemoveAbility( t, 'BEar' )
        call UnitRemoveAbility( t, 'BEah' )
        call UnitRemoveAbility( t, 'Broa' )
        call UnitRemoveAbility( t, 'Brej' )
        call UnitRemoveAbility( t, 'BIrg' )
        call UnitRemoveAbility( t, 'BIil' )
        call UnitRemoveAbility( t, 'BNbr' )
        call UnitRemoveAbility( t, 'Bfzy' )
        call UnitRemoveAbility( t, 'B01K' )
        call UnitRemoveAbility( t, 'B01J' )
        call UnitRemoveAbility( t, 'B01B' )
        call UnitRemoveAbility( t, 'B01D' )
        call UnitRemoveAbility( t, 'B01A' )
        call UnitRemoveAbility( t, 'B002' )
        call UnitRemoveAbility( t, 'B011' )
        call UnitRemoveAbility( t, 'B01G' )
        call UnitRemoveAbility( t, 'B003' )
        call UnitRemoveAbility( t, 'B01M' )
        call UnitRemoveAbility( t, 'B010' )
        call UnitRemoveAbility( t, 'Bdef' )
    endif
    set t=null
    return false
endfunction

function  smallnaga2 takes nothing returns boolean
    local unit t=GetFilterUnit()
    local unit m
    if IsUnitEnemy(t, udg_P) == true and GetUnitAbilityLevel(t, 'Aloc') == 0 and GetUnitState(t, UNIT_STATE_LIFE)>0 and IsUnitType(t, UNIT_TYPE_STRUCTURE) == false then
        call UnitAddAbility(udg_U,'ACmi')
        call UnitDamageTarget( udg_U, t, udg_Re, true, true,ATTACK_TYPE_HERO, DAMAGE_TYPE_NORMAL, WEAPON_TYPE_WHOKNOWS )
        call UnitRemoveAbility(udg_U,'ACmi')
        set m=CreateUnit(udg_P ,'u000',GetUnitX(t),GetUnitY(t),0)
        call UnitApplyTimedLife( m, 'BTLF', 0.50 )
        call UnitAddAbility(m,'A06G')
        call SetUnitAbilityLevel(m,'A06G',udg_n)
        call IssueTargetOrderById( m, 852106, t )
    endif
    set t=null
    set m=null
    return false
endfunction

function smallnagada takes nothing returns boolean
    local unit t=GetFilterUnit()
    local real a1
    
    if IsUnitEnemy(t, udg_P) == true and GetUnitAbilityLevel(t, 'Aloc') == 0 and GetUnitState(t, UNIT_STATE_LIFE)>0 and IsUnitType(t, UNIT_TYPE_STRUCTURE) == false then
        call UnitAddAbility(udg_U,'ACmi')
        call UnitDamageTarget( udg_U, t, 300, true, true, ATTACK_TYPE_HERO, DAMAGE_TYPE_NORMAL, WEAPON_TYPE_WHOKNOWS )
        call UnitRemoveAbility(udg_U,'ACmi')
        set a1=Atan((udg_Y-GetUnitY(t))/(udg_X-GetUnitX(t)))*180/3.1415926
        if a1<0 then
            set a1=a1+360
        endif
        if  RAbsBJ(a1-GetUnitFacing(t))<90 then
            call DestroyEffect( AddSpecialEffectTarget("war3mapImported\\smallnaga1.mdx", t, "origin") )
            call SetUnitVertexColor(t , 50, 50, 50, 255 )
            call PauseUnit( t, true )
            call SetUnitTimeScale( t, 0.00 )
            call UnitAddAbility(t,'A06J')
            call UnitAddAbility(udg_U,'ACmi')
            call UnitDamageTarget( udg_U, t, udg_n, true, true, ATTACK_TYPE_HERO, DAMAGE_TYPE_NORMAL, WEAPON_TYPE_WHOKNOWS )
            call UnitRemoveAbility(udg_U,'ACmi')
            if IsUnitType(t, UNIT_TYPE_HERO) == false and GetOwningPlayer(t) != Player(PLAYER_NEUTRAL_AGGRESSIVE) then
                if  GetUnitTypeId(t)!='nwwd' then
                    call SetUnitExploded( t, true )
                    call UnitApplyTimedLife( t, 'BTLF', 0.01 )
                endif
            endif
            set t=null
            return true
        endif
    endif
    set t=null
    return false
endfunction

function nagarefumetime takes nothing returns nothing
    local unit t=GetEnumUnit()
    local integer i=GetUnitTypeId(t)
    
    if i=='O00A' then
        call SetUnitVertexColor(t , 255, 225, 100, 255 )
    elseif i=='O009' then
        call SetUnitVertexColor(t , 200, 120, 255, 255 )
    else
        call SetUnitVertexColor(t , 255, 255, 255, 255 )
    endif
    call UnitRemoveAbility(t,'A06J')
    call PauseUnit( t, false )
    call SetUnitTimeScale( t, 1.00 )
    set t=null
endfunction


function smallnagarefumeunit takes nothing returns nothing
    local timer tm=GetExpiredTimer()
    local integer i=GetHandleId(tm)
    local group g=LoadGroupHandle(udg_hash,i,2)
    call ForGroup(g,function nagarefumetime)
    call SetPlayerAbilityAvailable( LoadPlayerHandle(udg_hash,i,5), 'A06I', true )
    call GroupClear(g)
    call DestroyGroup(g)
    call FlushChildHashtable( udg_hash, i )
    call DestroyTimer(tm)
    set tm=null
    set g=null
endfunction

function Trig_SNagaS_Conditions takes nothing returns boolean
    local timer tm
    local integer i
    local unit u=GetTriggerUnit()
    local unit t
    local integer l=GetSpellAbilityId()
    local boolexpr b
    local group g
    local integer level=GetHeroLevel(u)
    local real x
    local real y
    
    if  l == 'A06I'  then
        set tm=CreateTimer()
        set i=GetHandleId(tm)
        set g=CreateGroup()
        set level=GetUnitAbilityLevel(u,'A06I')+(2*GetUnitAbilityLevel(u,'B01T'))
        set udg_P=GetOwningPlayer(u)
        call SetPlayerAbilityAvailable( udg_P, 'A06I', false )
        set udg_U=u
        set udg_X=GetUnitX(u)
        set udg_Y=GetUnitY(u)
        set udg_n=300+15*level
        set b=Condition(function smallnagada)
        call GroupEnumUnitsInRange(g,udg_X,udg_Y,550+(50*level),b)
        call DestroyBoolExpr(b)
        call SaveGroupHandle(udg_hash,i,2,g)
        call SavePlayerHandle(udg_hash,i,5,udg_P)
        call TimerStart(tm,2+level,false,function smallnagarefumeunit)
    elseif l=='A06E' then
        set udg_P=GetOwningPlayer(u)
        set udg_U=u
        set udg_n=(GetHeroAgi(u,true)*4)+(15*level)
        set b=Condition(function  smallnaga1)
        call GroupEnumUnitsInRange(udg_NullGroup,GetUnitX(u),GetUnitY(u),450+10*level,b)
        call DestroyBoolExpr(b)
    elseif l=='A06F' then
        set t=GetSpellTargetUnit()
        set x=GetUnitX(t)
        set y=GetUnitY(t)
        set udg_P=getcorrectplayer(u)
        set udg_n=R2I((level-3)/7)
        set udg_U=u
        set udg_Re=(GetHeroAgi(u,true)*4)+(10*level)
        set b=Condition(function  smallnaga2)
        call GroupEnumUnitsInRange(udg_NullGroup,x,y,350+5*level,b)
        call DestroyBoolExpr(b)
    elseif l=='AIh1' then
        call UnitResetCooldown(u)
    endif
    set u=null
    set tm=null
    set g=null
    set t=null
    set b=null
    return false
endfunction



//===========================================================================
function InitTrig_SNagaS takes nothing returns nothing
    set gg_trg_SNagaS = CreateTrigger(  )
    call DisableTrigger( gg_trg_SNagaS )
    call TriggerAddCondition( gg_trg_SNagaS, Condition( function Trig_SNagaS_Conditions ) )
endfunction
