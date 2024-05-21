
//===========================================================================
// Trigger: DAS
//===========================================================================
function coldfoot takes nothing returns nothing
    local timer tm=GetExpiredTimer()
    local integer i=GetHandleId(tm)
    local unit u
    local unit t
    local integer n=LoadInteger(udg_hash, i, 3)
    local real x
    local real y
    local real dx
    local real dy
    local unit m
    call DestroyEffect(LoadEffectHandle(udg_hash, i, 20))
    if n>0 then
        set t=LoadUnitHandle(udg_hash, i, 2)
        set x=GetUnitX(t)
        set y=GetUnitY(t)
        set dx=x-LoadReal(udg_hash, i, 7)
        set dy=y-LoadReal(udg_hash, i, 8)
        if GetUnitState(t, UNIT_STATE_LIFE)>0 and (dx*dx+dy*dy)<490000 then
            set u=LoadUnitHandle(udg_hash, i, 1)
            call SaveInteger(udg_hash, i, 3,n-1)
            call SaveEffectHandle(udg_hash,i,20,AddSpecialEffectTarget("war3mapImported\\DA2chixu.mdx", t, "origin"))
            call UnitDamageTarget( u, t, 60+(3*GetHeroLevel(u)), true, true, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
        else
            call FlushChildHashtable( udg_hash, i )
            call DestroyTimer(tm)
        endif
    else
        set t=LoadUnitHandle(udg_hash, i, 2)
        set x=GetUnitX(t)
        set y=GetUnitY(t)
        set dx=x-LoadReal(udg_hash, i, 7)
        set dy=y-LoadReal(udg_hash, i, 8)
        if GetUnitState(t, UNIT_STATE_LIFE)>0 and (dx*dx+dy*dy)<490000 then
            set u=LoadUnitHandle(udg_hash, i, 1)
            set m=CreateUnit(getcorrectplayer(u) ,'u000',x,y,0)
            call UnitAddAbility(m,'A08D')
            call SetUnitAbilityLevel(m,'A08D',R2I((GetHeroLevel(u)-5)/5))
            call IssueTargetOrderById(m, 852480, t)
            call UnitApplyTimedLife( m, 'BTLF', 6.00 )
            call UnitDamageTarget( u, t, 0.05*GetUnitState(t, UNIT_STATE_MAX_LIFE), true, true, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
        endif
        call FlushChildHashtable( udg_hash, i )
        call DestroyTimer(tm)
    endif
    set tm=null
    set u=null
    set t=null
    set m=null
endfunction

function darkangleda takes nothing returns boolean
    local unit t=GetFilterUnit()
    if IsUnitType(t, UNIT_TYPE_STRUCTURE) == false and IsUnitType(t, UNIT_TYPE_MAGIC_IMMUNE)==false and IsUnitEnemy(t, udg_P) == true and GetUnitAbilityLevel(t, 'Aloc') == 0 and GetUnitState(t, UNIT_STATE_LIFE)>0 and GetUnitAbilityLevel(t, 'Avul') == 0 then
        call UnitAddAbility(t,'A08E')
        call UnitDamageTarget( udg_U, t, udg_Re, true, true, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
        set t=null
        return true
    endif
    set t=null
    return false
endfunction

function dadacontinue takes nothing returns nothing
    local unit t=GetEnumUnit()
    if GetUnitState(t, UNIT_STATE_LIFE)/GetUnitState(t, UNIT_STATE_MAX_LIFE)<0.15 then
        call DestroyEffect( AddSpecialEffectTarget("war3mapImported\\DAdabomb.mdx", t, "chest") )
        call UnitRemoveAbility(t,'A08E')
        call GroupRemoveUnit( udg_Group, t )
        if  IsUnitType(t, UNIT_TYPE_HERO) == true then
            call AddHeroXP( udg_U, 4*GetHeroLevel(t), true )
            call SetUnitState( udg_U, UNIT_STATE_LIFE,GetUnitState(udg_U, UNIT_STATE_LIFE)+(GetUnitState(t, UNIT_STATE_MAX_LIFE)*0.15))
        else
            call SetUnitState( udg_U, UNIT_STATE_LIFE,GetUnitState(udg_U, UNIT_STATE_LIFE)+(GetUnitState(t, UNIT_STATE_MAX_LIFE)*0.05))
            call AddHeroXP( udg_U, GetUnitLevel(t), true )
        endif
        call DestroyEffect( AddSpecialEffect("Abilities\\\\Spells\\\\Items\\\\AIso\\\\AIsoTarget.mdl", GetUnitX(t), GetUnitY(t)) )
        call KillUnit(t)
    else
        call UnitDamageTarget( udg_U, t, udg_Re, true, true, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
    endif
    set t=null
endfunction

function dadaend takes nothing returns nothing
    call UnitRemoveAbility(GetEnumUnit(),'A08E')
endfunction


function darkangledaact takes nothing returns nothing
    local timer tm=GetExpiredTimer()
    local integer i=GetHandleId(tm)
    local unit u=LoadUnitHandle(udg_hash, i, 1)
    local integer n=LoadInteger(udg_hash, i, 3)
    local group g=LoadGroupHandle(udg_hash,i,2)
    if n>0 then
        call SaveInteger(udg_hash, i, 3,n-1)
        set udg_U=u
        set udg_Re=GetHeroLevel(u)*2.5
        set udg_Group=g
        call ForGroup(g,function dadacontinue)
    else
        call ForGroup(g,function dadaend)
        call GroupClear(g)
        call DestroyGroup(g)
        call FlushChildHashtable( udg_hash, i )
        call DestroyTimer(tm)
    endif
    set u=null
    set tm=null
    set g=null
endfunction

function Trig_DAS_Conditions takes nothing returns boolean
    local timer tm
    local integer i
    local unit u=GetTriggerUnit()
    local unit t
    local integer l=GetSpellAbilityId()
    local group g
    local boolexpr b
    local real x
    local real y
    local unit m
    
    if l == 'A089'  then
        set t=GetSpellTargetUnit()
        if CheckLinken(t)==true then
            set tm=CreateTimer()
            set i=GetHandleId(tm)
            set x=GetUnitX(t)
            set y=GetUnitY(t)
            call SaveUnitHandle(udg_hash,i,1,u)
            call SaveUnitHandle(udg_hash,i,2,t)
            call SaveInteger(udg_hash,i,3,5-R2I((GetHeroLevel(u)-2)/8))
            call SaveReal(udg_hash,i,7,x)
            call SaveReal(udg_hash,i,8,y)
            call SaveEffectHandle(udg_hash,i,20,AddSpecialEffectTarget("war3mapImported\\DA2chixu.mdx", t, "origin"))
            call TimerStart(tm,1,true,function coldfoot)
        endif
    elseif l=='A08A' then
        set tm=CreateTimer()
        set i=GetHandleId(tm)
        set l=GetHeroLevel(u)+(10*GetUnitAbilityLevel(u,'B01T'))
        set g=CreateGroup()
        set udg_P=GetOwningPlayer(u)
        set udg_U=u
        set udg_Re=100+(l*10)
        set b=Condition(function  darkangleda)
        call GroupEnumUnitsInRange(g,GetSpellTargetX(),GetSpellTargetY(),380+2*l,b)
        call DestroyBoolExpr(b)
        call SaveUnitHandle(udg_hash,i,1,u)
        call SaveGroupHandle(udg_hash,i,2,g)
        call SaveInteger(udg_hash,i,3,7+R2I(l/8))
        call TimerStart(tm,1,true,function darkangledaact)
    elseif l=='A088' then
        set x=GetSpellTargetX()
        set y=GetSpellTargetY()
        set m=CreateUnit(getcorrectplayer(u) ,'u000',x,y,0)
        call UnitAddAbility(m,'A08C')
        call UnitAddAbility(m,'A08H')
        call SetUnitAbilityLevel(m,'A08H',R2I((GetHeroLevel(u)-4)/6))
        call IssuePointOrderById(m, 852089, x,y )
        call UnitApplyTimedLife( m, 'BTLF',2 )
    elseif l=='AIh1' then
        call UnitResetCooldown(u)
    endif
    
    set u=null
    set tm=null
    set g=null
    set t=null
    set m=null
    set b=null
    return false
endfunction



//===========================================================================
function InitTrig_DAS takes nothing returns nothing
    set gg_trg_DAS = CreateTrigger(  )
    call DisableTrigger( gg_trg_DAS )
    call TriggerAddCondition( gg_trg_DAS, Condition( function Trig_DAS_Conditions ) )
endfunction
