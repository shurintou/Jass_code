
//===========================================================================
// Trigger: DOS
//===========================================================================
function addDamageReduction takes unit u, integer level returns nothing
    if level > 3 then
        call UnitAddAbility(u,'A0AU')
    else
        call UnitRemoveAbility(u,'A0AU')
    endif
    call SetUnitAbilityLevel(u,'A0AK',level )
endfunction

function selecthpminusdoomunit takes nothing returns boolean
    local unit t=GetFilterUnit()
    if IsUnitType(t, UNIT_TYPE_STRUCTURE) == false and IsUnitEnemy(t, udg_P) == true and GetUnitAbilityLevel(t, 'Aloc') == 0 and GetUnitState(t, UNIT_STATE_LIFE)>0 and GetUnitAbilityLevel(t, 'Avul') == 0 then
        call UnitAddAbility(t,'A0AO')
        call UnitAddAbility(t,'A0AM')
        call SetUnitAbilityLevel(t,'A0AM',udg_n)
        call UnitRemoveAbility(t,'A0AM')
        call UnitDamageTarget( udg_U, t, udg_Re, true, true, ATTACK_TYPE_HERO, DAMAGE_TYPE_DEATH, WEAPON_TYPE_WHOKNOWS )
        call DestroyEffect( AddSpecialEffect("war3mapImported\\Desecrate_JFI.mdx", GetUnitX(t),GetUnitY(t)) )
        set t=null
        return true
    endif
    set t=null
    return false
endfunction

function selecthpplusdoomunit takes nothing returns nothing
    local unit t=GetEnumUnit()
    call UnitRemoveAbility(t,'A0AO')
    call UnitAddAbility(t,'A0AL')
    call SetUnitAbilityLevel(t,'A0AL',udg_n)
    call UnitRemoveAbility(t,'A0AL')
    set t=null
endfunction


function timerselecthpplusdoomunit takes nothing returns nothing
    local timer tm=GetExpiredTimer()
    local integer i=GetHandleId(tm)
    local group g=LoadGroupHandle(udg_hash,i,2)
    local unit u=LoadUnitHandle(udg_hash, i, 1)
    call addDamageReduction(u,GetUnitAbilityLevel(u, 'A0AK') - 1 )
    set udg_n=LoadInteger(udg_hash, i, 3)+2
    call ForGroup(g,function selecthpplusdoomunit)
    call GroupClear(g)
    call DestroyGroup(g)
    call FlushChildHashtable( udg_hash, i )
    call DestroyTimer(tm)
    set tm=null
    set g=null
    set u=null
endfunction

function timerrainoffire takes nothing returns nothing
    local timer tm=GetExpiredTimer()
    local integer i=GetHandleId(tm)
    local integer n=LoadInteger(udg_hash, i, 2)
    local unit u=LoadUnitHandle(udg_hash, i, 1)
    local unit m
    local integer j
    local integer k
    local player p = GetOwningPlayer(u)
    local real x
    local real y
    
    if n>0 and GetUnitState(u, UNIT_STATE_LIFE)>0 then
        set j = GetConvertedPlayerId(p)
        set k = R2I(udg_Chaoxi[j]/10)
        set x = GetUnitX(u)
        set y = GetUnitY(u)
        if k > 1 then
            call SaveInteger(udg_hash, i, 2, n-1+k)
        else
            call SaveInteger(udg_hash, i, 2, n-1)
        endif
        set udg_Chaoxi[j] =  ModuloInteger(udg_Chaoxi[j], 10)
        call SetUnitState( u, UNIT_STATE_LIFE, GetUnitState(u, UNIT_STATE_LIFE) + 0.01 * GetUnitState(u, UNIT_STATE_MAX_LIFE))
        set m=CreateUnit(p,'u000',x, y,0)
        call UnitApplyTimedLife( m, 'BTLF', 1.50 )
        call UnitAddAbility(m,'A0AS')
        call SetUnitAbilityLevel(m,'A0AS',GetUnitAbilityLevel(u, 'A0AR'))
        call IssuePointOrderById( m, 852238, x+GetRandomReal(-100,100), y+GetRandomReal(-100,100) )
    else
        call SetPlayerAbilityAvailable( p, 'A0AR', true)
        call addDamageReduction(u,GetUnitAbilityLevel(u, 'A0AK') - 1 )
        call FlushChildHashtable( udg_hash, i )
        call DestroyTimer(tm)
    endif
    set tm=null
    set u=null
    set m=null
    set p=null
endfunction

function timerremovetargethp takes nothing returns nothing
    local timer tm=GetExpiredTimer()
    local integer i=GetHandleId(tm)
    local integer n=LoadInteger(udg_hash, i, 3)
    local unit t=LoadUnitHandle(udg_hash, i, 1)
    local unit u=LoadUnitHandle(udg_hash, i, 2)
    call DestroyEffect( LoadEffectHandle(udg_hash,i,4) )
    call DestroyEffect( LoadEffectHandle(udg_hash,i,5) )
    call UnitRemoveAbility(u,'A0AN')
    call UnitRemoveAbility(t,'A0AN')
    call UnitAddAbility(t,'A0AM')
    call SetUnitAbilityLevel(t,'A0AM',5+n)
    call UnitRemoveAbility(t,'A0AM')
    call UnitAddAbility(u,'A0AL')
    call SetUnitAbilityLevel(u,'A0AL',5+n)
    call UnitRemoveAbility(u,'A0AL')
    call addDamageReduction(t,GetUnitAbilityLevel(t, 'A0AK') - n )
    set tm=null
    set t=null
    set u=null
endfunction


function Trig_DOS_Conditions takes nothing returns boolean
    local timer tm
    local integer i
    local unit u=GetTriggerUnit()
    local unit t
    local integer l=GetSpellAbilityId()
    local group g
    local boolexpr b
    local real x
    local real y
    local integer n
    
    if l == 'A0AJ'  then
        set t=GetSpellTargetUnit()
        if CheckLinken(t)==true then
            set tm=CreateTimer()
            set i=GetHandleId(tm)
            set n=GetUnitAbilityLevel(u, 'A0AJ')
            call UnitAddAbility(t,'A0AN')
            call SetUnitAbilityLevel(t,'A0AN',n)
            call UnitAddAbility(t,'A0AM')
            call SetUnitAbilityLevel(t,'A0AM',5+n)
            call UnitRemoveAbility(t,'A0AM')
            call UnitAddAbility(u,'A0AN')
            call SetUnitAbilityLevel(u,'A0AN',4+n)
            call UnitAddAbility(u,'A0AL')
            call SetUnitAbilityLevel(u,'A0AL',5+n)
            call UnitRemoveAbility(u,'A0AL')
            call SaveUnitHandle(udg_hash,i,1,u)
            call SaveUnitHandle(udg_hash,i,2,t)
            call SaveInteger(udg_hash,i,3,n)
            call SaveEffectHandle(udg_hash,i,4, AddSpecialEffectTarget("war3mapImported\\HellCurse.mdx", t, "origin") )
            call SaveEffectHandle(udg_hash,i,5, AddSpecialEffectTarget("war3mapImported\\DemonicAdornment.mdx", u, "head") )
            call addDamageReduction(u, GetUnitAbilityLevel(u,'A0AK') + n )
            call TimerStart(tm,10,false,function timerremovetargethp)
        endif
    elseif l=='A0AI' then
        set tm=CreateTimer()
        set i=GetHandleId(tm)
        set l=GetUnitAbilityLevel(u,'A0AI')
        set g=CreateGroup()
        set udg_P=GetOwningPlayer(u)
        set udg_U=u
        set udg_Re=250+(l*50)
        set udg_n= 2+l
        set b=Condition(function selecthpminusdoomunit)
        call GroupEnumUnitsInRange(g,GetUnitX(u),GetUnitY(u),udg_Re,b)
        call DestroyBoolExpr(b)
        call SaveUnitHandle(udg_hash,i,1,u)
        call SaveGroupHandle(udg_hash,i,2,g)
        call SaveInteger(udg_hash,i,3,l)
        call addDamageReduction(u,GetUnitAbilityLevel(u, 'A0AK') + 1 )
        call TimerStart(tm,7,false,function timerselecthpplusdoomunit)
    elseif l=='A0AR' then
        set tm=CreateTimer()
        set i=GetHandleId(tm)
        call SaveInteger(udg_hash,i,2,10)
        call SaveUnitHandle(udg_hash,i,1,u)
        call SetPlayerAbilityAvailable( GetTriggerPlayer(), 'A0AR', false )
        call addDamageReduction(u,GetUnitAbilityLevel(u, 'A0AK') + 1 )
        call TimerStart(tm,0.5,true,function timerrainoffire)
    elseif l=='AIh1' then
        call UnitResetCooldown(u)
    endif
    //Desecrate_JFI.mdx used  spell 1 target
    //AnnihilationTarget.mdx used   spell 1 self
    //Fountain of Souls_opt.mdx spell 2 channel self
    //Rain of Fire Vol. II.mdx spell 2 point
    //war3mapImported\AnnihilationBlast.mdx  dazhao target
    //Hemorrhage.mdx spell 1 debuff blood drop
    //HellCurse.mdx dazhao debuff
    //DemonicAdornment.mdx spell 3 buff
    set tm=null
    set u=null
    set g=null
    set b=null
    set t=null
    return false
endfunction



//===========================================================================
function InitTrig_DOS takes nothing returns nothing
    set gg_trg_DOS = CreateTrigger(  )
    call DisableTrigger( gg_trg_DOS )
    call TriggerAddCondition( gg_trg_DOS, Condition( function Trig_DOS_Conditions ) )
endfunction
