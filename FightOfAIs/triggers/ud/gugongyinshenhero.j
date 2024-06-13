
//===========================================================================
// Trigger: gugongyinshenhero
//===========================================================================
function gugongaoe takes nothing returns boolean
    local unit t=GetFilterUnit()
    if IsUnitType(t, UNIT_TYPE_STRUCTURE) == false and IsUnitEnemy(t, udg_P) == true and GetUnitAbilityLevel(t, 'Aloc') == 0 and GetUnitState(t, UNIT_STATE_LIFE)>0 and IsUnitType(t, UNIT_TYPE_MAGIC_IMMUNE)==false and GetUnitAbilityLevel(t, 'Avul') == 0 and IsUnitType(t, UNIT_TYPE_MECHANICAL) == false then
        call UnitDamageTarget( udg_U, t, udg_Re, true, false,  ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
        call DestroyEffect( AddSpecialEffectTarget("war3mapImported\\AnimateDeadTarget.mdx", t, "chest") )
    endif
    set t=null
    return false
endfunction



function yinshenhero takes nothing returns nothing
    local unit t=GetEnumUnit()
    call UnitAddAbility( t, 'A04X' )
    call DestroyEffect( AddSpecialEffectTarget("Abilities\\Spells\\Human\\Invisibility\\InvisibilityTarget.mdl", t, "chest") )
    set t=null
endfunction

function qudiaoyinshenhero takes nothing returns nothing
    call UnitRemoveAbility( GetEnumUnit(), 'A04X' )
endfunction

function baochiyinshenhero takes nothing returns nothing
    local timer tm=GetExpiredTimer()
    local integer i=GetHandleId(tm)
    
    call ForGroup(LoadGroupHandle(udg_hash,i,1),function qudiaoyinshenhero)
    call FlushChildHashtable( udg_hash,i)
    call DestroyTimer( tm )
    
    set tm=null
endfunction

function Trig_gugongyinshenhero_Conditions takes nothing returns boolean
    local unit u=GetTriggerUnit()
    local timer tm
    local integer i
    local integer l= GetSpellAbilityId()
    local boolexpr b
    local unit t
    if l == 'A02U' then
        set tm=CreateTimer()
        set i=GetHandleId(tm)
        if IsUnitAlly(u,Player(5))==true then
            call SaveGroupHandle(udg_hash,i,1,udg_BlueTeamHero)
            call ForGroup(udg_BlueTeamHero,function yinshenhero)
        else
            call SaveGroupHandle(udg_hash,i,1,udg_RedTeamHero)
            call ForGroup(udg_RedTeamHero,function yinshenhero)
        endif
        call TimerStart(tm,(4*(1+GetUnitAbilityLevel(u,'B01T')))+GetHeroLevel(u)/5,false,function baochiyinshenhero)
    elseif l=='A06O' then
        set t=GetSpellTargetUnit()
        if CheckLinken(t)==true then
            call DestroyEffect( AddSpecialEffectTarget("war3mapImported\\NecroticBlast.mdx", t, "origin") )
            set udg_P=GetTriggerPlayer()
            set udg_U=u
            set i=GetHeroLevel(u)
            set l=GetConvertedPlayerId(udg_P)
            set udg_Re=250+(150*udg_Chaoxi[l])+(5*i)
            if udg_Chaoxi[l]>0 then
                set udg_Chaoxi[l]=udg_Chaoxi[l]-1
            endif
            set b=Condition(function gugongaoe)
            call GroupEnumUnitsInRange(udg_NullGroup,GetUnitX(t),GetUnitY(t),200+(10*i),b)
            call DestroyBoolExpr(b)
        endif
    endif
    set t=null
    set u=null
    set tm=null
    set b=null
    return false
endfunction



//===========================================================================
function InitTrig_gugongyinshenhero takes nothing returns nothing
    set gg_trg_gugongyinshenhero = CreateTrigger(  )
    call DisableTrigger( gg_trg_gugongyinshenhero )
    call TriggerAddCondition( gg_trg_gugongyinshenhero, Condition( function Trig_gugongyinshenhero_Conditions ) )
endfunction
