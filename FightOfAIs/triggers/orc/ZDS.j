
//===========================================================================
// Trigger: ZDS
//===========================================================================
function zhadanren takes nothing returns boolean
    local unit t=GetFilterUnit()
    if IsUnitType(t, UNIT_TYPE_STRUCTURE) == false and IsUnitEnemy(t, udg_P) == true and GetUnitAbilityLevel(t, 'Aloc') == 0 and GetUnitState(t, UNIT_STATE_LIFE)>0 then
        call UnitDamageTarget( udg_U, t, udg_Re, true, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
        call DestroyEffect( AddSpecialEffectTarget("war3mapImported\\zd4.mdx", t, "origin") )
    endif
    set t=null
    return false
endfunction

function FlareAct takes nothing returns nothing
    local timer tm=GetExpiredTimer()
    local integer i=GetHandleId(tm)
    local unit u=LoadUnitHandle(udg_hash,i,1)
    local boolexpr b
    local unit m
    local real x=LoadReal(udg_hash,i,3)
    local real y=LoadReal(udg_hash,i,4)
    local real r=LoadReal(udg_hash,i,2)
    
    set udg_U=u
    set udg_Re=100+(GetHeroLevel(u)*10)+(r/20)
    set udg_P=GetOwningPlayer(u)
    set m=CreateUnit(getcorrectplayer(u),'u000',x,y,0)
    set b=Condition(function zhadanren)
    call UnitAddAbility(m,'A062')
    call UnitApplyTimedLife( m, 'BTLF', 15.00 )
    call SetUnitAbilityLevel(m,'A062',4)
    call IssueImmediateOrderById(m, 852183 )
    call GroupEnumUnitsInRange(udg_NullGroup,x,y,450+(r/50),b)
    call DestroyBoolExpr(b)
    call DestroyEffect(LoadEffectHandle(udg_hash,i,10))
    call FlushChildHashtable( udg_hash, i )
    call DestroyTimer(tm)
    
    set m=null
    set b=null
    set tm=null
    set u=null
endfunction

function dingshizhadan takes nothing returns boolean
    local unit t=GetFilterUnit()
    if IsUnitType(t, UNIT_TYPE_STRUCTURE) == false and IsUnitEnemy(t, udg_P) == true and GetUnitAbilityLevel(t, 'Aloc') == 0 and GetUnitState(t, UNIT_STATE_LIFE)>0 then
        call UnitDamageTarget( udg_U, t, udg_Re, true, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
        call DestroyEffect( AddSpecialEffectTarget("war3mapImported\\zd2.mdx", t, "chest") )
    endif
    set t=null
    return false
endfunction


function zhadanjineng takes nothing returns nothing
    local timer tm=GetExpiredTimer()
    local integer i=GetHandleId(tm)
    local unit u=LoadUnitHandle(udg_hash,i,1)
    local boolexpr b
    local real x=LoadReal(udg_hash,i,3)
    local real y=LoadReal(udg_hash,i,4)
    local unit m
    
    set udg_U=u
    set udg_Re=300+(GetHeroLevel(u)*15)
    set udg_P=GetOwningPlayer(u)
    set m=CreateUnit(getcorrectplayer(u),'u000',x,y,0)
    set b=Condition(function dingshizhadan)
    call UnitAddAbility(m,'A062')
    call UnitApplyTimedLife( m, 'BTLF', 15.00 )
    call SetUnitAbilityLevel(m,'A062',2)
    call IssueImmediateOrderById(m, 852183 )
    call GroupEnumUnitsInRange(udg_NullGroup,x,y,300,b)
    call DestroyBoolExpr(b)
    call FlushChildHashtable( udg_hash, i )
    call DestroyTimer(tm)
    
    set b=null
    set m=null
    set tm=null
    set u=null
endfunction

function yuanzidan takes nothing returns boolean
    local unit t=GetFilterUnit()
    if IsUnitType(t, UNIT_TYPE_STRUCTURE) == false and IsUnitEnemy(t, udg_P) == true and GetUnitAbilityLevel(t, 'Aloc') == 0 and GetUnitState(t, UNIT_STATE_LIFE)>0 then
        call UnitDamageTarget( udg_U, t, udg_n+(udg_Re*GetUnitState(t, UNIT_STATE_MAX_LIFE)), true, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
        call DestroyEffect( AddSpecialEffectTarget("war3mapImported\\zd5.mdx", t, "origin") )
    endif
    set t=null
    return false
endfunction

function Trig_ZDS_Conditions takes nothing returns boolean
    local timer tm
    local integer i
    local unit u=GetTriggerUnit()
    local integer l=GetSpellAbilityId()
    local unit t
    local unit m
    local real x
    local real y
    local real dx
    local real dy
    local real r
    local boolexpr b
    if l=='A066' then
        call SetUnitAbilityLevel(u,'A066',R2I((GetHeroLevel(u)-5)/5))
        set tm=CreateTimer()
        set i=GetHandleId(tm)
        set x=GetUnitX(u)
        set y=GetUnitY(u)
        set dx=GetSpellTargetX()
        set dy=GetSpellTargetY()
        set m=CreateUnit(getcorrectplayer(u),'h004',x,y,0)
        call IssuePointOrderById( m, 851984, dx, dy )
        call UnitApplyTimedLife( m, 'BTLF', 1.2 )
        set x=dx-x
        set y=dy-y
        set r=SquareRoot(x * x + y * y)
        call SaveUnitHandle(udg_hash,i,1,u)
        call SaveReal(udg_hash,i,2,r)
        call SaveReal(udg_hash,i,3,dx)
        call SaveReal(udg_hash,i,4,dy)
        call SaveEffectHandle(udg_hash,i,10,AddSpecialEffect("war3mapImported\\zdr9.mdx", dx, dy))
        call TimerStart(tm,r/1100,false,function FlareAct)
    elseif l=='A061' then
        call SetUnitAbilityLevel(u,'A061',R2I((GetHeroLevel(u)-5)/5))
        set tm=CreateTimer()
        set i=GetHandleId(tm)
        call SaveUnitHandle(udg_hash,i,1,u)
        call SaveReal(udg_hash,i,3,GetSpellTargetX())
        call SaveReal(udg_hash,i,4,GetSpellTargetY())
        call TimerStart(tm,5-GetUnitAbilityLevel(u,'A061'),false,function zhadanjineng)
    elseif l=='A064' then
        set i=GetHeroLevel(u)
        set l=10*GetUnitAbilityLevel(u,'B01T')
        call SetUnitAbilityLevel(u,'A064',R2I((i-3)/7))
        set x=GetSpellTargetX()
        set y=GetSpellTargetY()
        set udg_U=u
        set udg_Re=0.01*(i+l)
        set udg_n=200+((i+l)*30)
        set udg_P=GetOwningPlayer(u)
        set m=CreateUnit(getcorrectplayer(u),'u000',x,y,0)
        set b=Condition(function yuanzidan)
        call UnitAddAbility(m,'A062')
        call UnitApplyTimedLife( m, 'BTLF', 15.00 )
        call IssueImmediateOrderById(m, 852183 )
        call GroupEnumUnitsInRange(udg_NullGroup,x,y,500+(i+l)*10,b)
        call DestroyBoolExpr(b)
    elseif l=='AIh1' then
        call UnitResetCooldown(u)
    endif
    
    set tm=null
    set u=null
    set b=null
    set t=null
    set m=null
    return false
endfunction



//===========================================================================
function InitTrig_ZDS takes nothing returns nothing
    set gg_trg_ZDS = CreateTrigger(  )
    call DisableTrigger( gg_trg_ZDS )
    call TriggerAddCondition( gg_trg_ZDS, Condition( function Trig_ZDS_Conditions ) )
endfunction
