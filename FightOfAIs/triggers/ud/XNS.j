
//===========================================================================
// Trigger: XNS
//===========================================================================
//////////////////////////////////////////1111111111111111111111111111111111111///////////////////////////////////////////////
function xuenvzhiliao takes nothing returns nothing
    local timer tm=GetExpiredTimer()
    local integer i=GetHandleId(tm)
    local unit u=LoadUnitHandle(udg_hash, i, 2)
    local integer n=LoadInteger(udg_hash, i, 3)
    local real r=GetUnitState(u, UNIT_STATE_LIFE)
    local real w
    if n>0 and r>0  then
        call SaveInteger(udg_hash,i,3,n-1)
        set w=LoadReal(udg_hash,i,4)
        call SetUnitState( u, UNIT_STATE_LIFE,w+r)
        call SetUnitState( u, UNIT_STATE_MANA,w+GetUnitState(u, UNIT_STATE_MANA))
    else
        call SetPlayerAbilityAvailable( LoadPlayerHandle(udg_hash,i,12), 'A05R', true )
        call UnitRemoveAbility(u,'A05Q')
        call DestroyEffect( LoadEffectHandle(udg_hash, i, 9) )
        call DestroyEffect( LoadEffectHandle(udg_hash, i, 10) )
        call FlushChildHashtable( udg_hash, i )
        call DestroyTimer(tm)
    endif
    set tm=null
    set u=null
endfunction



function xuenvchaofeng takes nothing returns boolean
    local unit t=GetFilterUnit()
    local unit m
    
    if IsUnitType(t, UNIT_TYPE_STRUCTURE) == false and IsUnitEnemy(t, udg_P) == true and GetUnitAbilityLevel(t, 'Aloc') == 0 and GetUnitState(t, UNIT_STATE_LIFE)>0 and IsUnitType(t, UNIT_TYPE_MAGIC_IMMUNE)==false and GetUnitAbilityLevel(t, 'Avul') == 0 and IsUnitType(t, UNIT_TYPE_MECHANICAL) == false then
        set m=CreateUnit(udg_P,'u000',GetUnitX(t),GetUnitY(t),0)
        call UnitAddAbility(m,'A05S')
        call SetUnitAbilityLevel(m,'A05S',udg_n)
        call UnitApplyTimedLife( m, 'BTLF', 1.00 )
        call IssueTargetOrderById( m, 852095, t )
        call DestroyEffect( AddSpecialEffectTarget("war3mapImported\\iceberg.mdx", t, "origin") )
        call UnitDamageTarget( udg_U, t, udg_Re, true, false,  ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
    endif
    
    set m=null
    set t=null
    return false
endfunction
//////////////////////////////////11111111111111111111////////////////////////////////////

//////////////////////////////////22222222222222222222////////////////////////////////////
function xuenvbingqiu takes nothing returns boolean
    local unit t=GetFilterUnit()
    if IsUnitType(t, UNIT_TYPE_STRUCTURE) == false and IsUnitEnemy(t, udg_P) == true and GetUnitAbilityLevel(t, 'Aloc') == 0 and GetUnitState(t, UNIT_STATE_LIFE)>0 and  IsUnitType(t, UNIT_TYPE_MAGIC_IMMUNE)==false and GetUnitAbilityLevel(t, 'Avul') == 0 and IsUnitType(t, UNIT_TYPE_MECHANICAL) == false then
        set t=null
        return true
    endif
    set t=null
    return false
endfunction


function xuenvxueqiutimer takes nothing returns nothing
    local timer tm=GetExpiredTimer()
    local integer i=GetHandleId(tm)
    local unit m=LoadUnitHandle(udg_hash, i, 0)
    local unit u
    local unit t
    local integer n=LoadInteger(udg_hash, i, 3)
    local group g=LoadGroupHandle(udg_hash,i,5)
    local integer e
    if n>0 then
        set u=LoadUnitHandle(udg_hash, i, 1)
        set t=GroupPickRandomUnit(g)
        call SaveInteger(udg_hash,i,3,n-1)
        call SetUnitX(m,GetUnitX(u))
        call SetUnitY(m,GetUnitY(u))
        call IssueTargetOrderById( m, 852095, t )
        set e=LoadInteger(udg_hash,i,4)
        if e>4 then
            set m=LoadUnitHandle(udg_hash, i, 2)
            call SetUnitX(m,GetUnitX(t))
            call SetUnitY(m,GetUnitY(t))
            call IssueTargetOrderById( m, 852095, t )
            call DestroyEffect( AddSpecialEffectTarget("war3mapImported\\IceSlam.mdx", t, "origin") )
            call UnitDamageTarget( u, t, 100+0.005*GetHeroLevel(u)*GetUnitState(t, UNIT_STATE_MAX_LIFE), true, false,  ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
            call SaveInteger(udg_hash,i,4,0)
        else
            call SaveInteger(udg_hash,i,4,e+1)
        endif
    else
        call RemoveUnit(m)
        call RemoveUnit(LoadUnitHandle(udg_hash, i, 2))
        call GroupClear( g )
        call DestroyGroup( g )
        call FlushChildHashtable( udg_hash,i)
        call DestroyTimer( tm )
    endif
    set t=null
    set g=null
    set m=null
    set u=null
    set tm=null
endfunction
/////////////////////////////////222222222222222222222//////////////////////////////////////

function Trig_XNS_Conditions takes nothing returns boolean
    local timer tm
    local integer i
    local unit u=GetTriggerUnit()
    local integer l=GetSpellAbilityId()
    local unit t
    local integer lv=GetHeroLevel(u)
    local real x
    local real y
    local player p=GetTriggerPlayer()
    local unit m
    local real r
    local group g
    local boolexpr b
    
    if l == 'A05R'  then
        set t=GetSpellTargetUnit()
        if IsUnitAlly(t,p)==true then
            set tm=CreateTimer()
            set i=GetHandleId(tm)
            set m=CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE),'u000',GetUnitX(t),GetUnitY(t),0)
            call UnitAddAbility(m,'A05S')
            call UnitApplyTimedLife( m, 'BTLF', 1.00 )
            call IssueTargetOrderById( m, 852095, t )
            call SaveUnitHandle(udg_hash,i,2,t)
            call SavePlayerHandle(udg_hash,i,12,p)
            call SaveInteger(udg_hash,i,3,15)
            call SaveEffectHandle(udg_hash,i,9,AddSpecialEffectTarget("war3mapImported\\FreezingPrison.mdx", t, "origin"))
            call SaveEffectHandle(udg_hash,i,10,AddSpecialEffectTarget("war3mapImported\\ice cube.mdx", t, "origin") )
            set r=10+GetUnitState(u, UNIT_STATE_MAX_LIFE)*(0.02+lv/1000)
            call SaveReal(udg_hash,i,4,r)
            call UnitAddAbility(t,'A05Q')
            call SetUnitState( u, UNIT_STATE_LIFE,GetUnitState(u, UNIT_STATE_LIFE)+r)
            call SetUnitState( u, UNIT_STATE_MANA,GetUnitState(u, UNIT_STATE_MANA)+r)
            call TimerStart(tm,0.33,true,function xuenvzhiliao)
            call SetPlayerAbilityAvailable( p, 'A05R', false )
        else
            if CheckLinken(t)==true then
                set udg_P=getcorrectplayer(u)
                set udg_Re=150+10*lv
                set udg_U=u
                set udg_n=1+R2I((lv-2)/8)
                set b=Condition(function xuenvchaofeng)
                call GroupEnumUnitsInRange(udg_NullGroup,GetUnitX(t),GetUnitY(t),300+(5*lv),b)
                call DestroyBoolExpr(b)
            endif
        endif
    elseif l=='A05P' then
        set t=GetSpellTargetUnit()
        if CheckLinken(t)==true then
            set p=getcorrectplayer(u)
            set m=CreateUnit(p,'u000',0,0,0)
            call UnitAddAbility(m,'A031')
            call SetUnitAbilityLevel(m,'A031',R2I((lv-2)/8))
            set tm=CreateTimer()
            set i=GetHandleId(tm)
            set udg_P=p
            set g=CreateGroup()
            set b=Condition(function xuenvbingqiu)
            call GroupEnumUnitsInRange(g,GetUnitX(t),GetUnitY(t),300+(10*lv),b)
            call SaveUnitHandle(udg_hash,i,0,m)
            call SaveUnitHandle(udg_hash,i,1,u)
            set m=CreateUnit(p,'u000',0,0,0)
            call UnitAddAbility(m,'A05S')
            call SetUnitAbilityLevel(m,'A05S',R2I((lv-2)/8))
            call SaveUnitHandle(udg_hash,i,2,m)
            call SaveInteger(udg_hash,i,3,15+R2I(lv/2))
            call SaveInteger(udg_hash,i,4,0)
            call SaveGroupHandle(udg_hash,i,5,g)
            call DestroyBoolExpr(b)
            call TimerStart(tm,0.2,true,function xuenvxueqiutimer)
        endif
    elseif l=='A05O' then
        set t=GetSpellTargetUnit()
        if CheckLinken(t)==true then
            set x=GetUnitX(t)
            set y=GetUnitY(t)
            set p=getcorrectplayer(u)
            set l=GetUnitAbilityLevel(u,'B01T')
            call UnitDamageTarget( u, t, 200+(20*lv), true, false,  ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
            set m=CreateUnit(p,'o008',x,y,0)
            call SetUnitAbilityLevel(m,'A00L',R2I((lv-3)/7)+l)
            call IssueTargetOrderById( m, 851983, t)
            call UnitApplyTimedLife( m, 'BTLF', 1.50 )
            set u=CreateUnit(p,'u000',x,y,0)
            call UnitAddAbility(u,'A05N')
            call UnitApplyTimedLife( u, 'BTLF', (2*(1+l))+(lv/10) )
            call DestroyEffect( AddSpecialEffectTarget("war3mapImported\\Shiva'sOmniscience.mdx", t, "origin") )
        endif
    elseif l=='AIh1' then
        call UnitResetCooldown(u)
    endif
    set t=null
    set g=null
    set m=null
    set u=null
    set tm=null
    set b=null
    return false
endfunction


//===========================================================================
function InitTrig_XNS takes nothing returns nothing
    set gg_trg_XNS = CreateTrigger(  )
    call DisableTrigger( gg_trg_XNS )
    call TriggerAddCondition( gg_trg_XNS, Condition( function Trig_XNS_Conditions ) )
endfunction
