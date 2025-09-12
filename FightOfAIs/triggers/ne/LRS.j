
//===========================================================================
// Trigger: LRS
//===========================================================================
function langrenkongju takes nothing returns nothing
    local timer tm=GetExpiredTimer()
    local integer i=GetHandleId(tm)
    local integer g=LoadInteger(udg_hash,i,3)
    local unit u
    local unit t=LoadUnitHandle(udg_hash,i,2)
    local real r=GetUnitState(t, UNIT_STATE_LIFE)
    local real l
    if r>0 and g>0 then
        set u=LoadUnitHandle(udg_hash,i,1)
        set l=LoadReal(udg_hash,i,4)+(0.01*(GetUnitState(t, UNIT_STATE_MAX_LIFE)-r))
        set r=GetUnitState(u, UNIT_STATE_LIFE)
        call UnitDamageTarget( u, t, l, true, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
        call SaveInteger(udg_hash,i,3,g-1)
        if GetUnitAbilityLevel(t,'A05Y')>0 then
            call SetUnitState( u, UNIT_STATE_LIFE,r+(2*l))
            call IssuePointOrderById( t, 851986, GetUnitX(t)+GetRandomReal(-200,200), GetUnitY(t)+GetRandomReal(-200,200) )
        else
            call SetUnitState( u, UNIT_STATE_LIFE,r+l)
        endif
    else
        call DestroyEffect(LoadEffectHandle(udg_hash,i,5))
        call UnitRemoveAbility(t,'A05Y')
        call FlushChildHashtable( udg_hash, i )
        call DestroyTimer(tm)
    endif
    set t=null
    set tm=null
    set u=null
endfunction


function  langrenr takes nothing returns boolean
    local unit t=GetFilterUnit()
    local real l
    if IsUnitEnemy(t, udg_P) == true and IsUnitType(t, UNIT_TYPE_MAGIC_IMMUNE)==false and GetUnitAbilityLevel(t, 'Aloc') == 0 and GetUnitState(t, UNIT_STATE_LIFE)>0 and IsUnitPaused(t)==false then
        set l=udg_Re*GetUnitState(t, UNIT_STATE_LIFE)
        call UnitDamageTarget( udg_U, t, l, true, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
        call SetUnitState( udg_U, UNIT_STATE_LIFE,GetUnitState(udg_U, UNIT_STATE_LIFE)+l)
        call DestroyEffect( AddSpecialEffectTarget("war3mapImported\\lr1.mdx", t, "origin") )
        set t=null
        return false
    endif
    set t=null
    return false
endfunction


function Trig_LRS_Conditions takes nothing returns boolean
    local timer tm
    local integer i
    local unit u=GetTriggerUnit()
    local unit t
    local integer l=GetSpellAbilityId()
    local boolexpr b
    if  l == 'A05W'  then
        set t=GetSpellTargetUnit()
        if CheckLinken(t)==true then
            set l=GetHeroLevel(u)
            set tm=CreateTimer()
            set i=GetHandleId(tm)
            call UnitDamageTarget(u, t, 200+(10*l), true, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
            call SaveEffectHandle(udg_hash,i,5,AddSpecialEffectTarget("war3mapImported\\lr4.mdx", t, "chest"))
            if GetUnitAbilityLevel(u,'A05T')>0 then
                call UnitAddAbility(t,'A05Y')
                call DestroyEffect( AddSpecialEffectTarget("war3mapImported\\lr1.mdx", t, "origin") )
                call SaveReal(udg_hash,i,4,0.003*GetUnitState(t, UNIT_STATE_MAX_LIFE) )
            else
                call SaveReal(udg_hash,i,4,0.0015*GetUnitState(t, UNIT_STATE_MAX_LIFE) )
            endif
            call SaveUnitHandle(udg_hash,i,1,u)
            call SaveUnitHandle(udg_hash,i,2,t)
            call SaveInteger(udg_hash,i,3,25+R2I(l/2))
            call TimerStart(tm,0.2,true,function langrenkongju)
        endif
    elseif l=='A05Z' then
        set udg_P=GetOwningPlayer(u)
        set udg_U=u
        if GetUnitAbilityLevel(u,'A05T')>0 then
            set udg_Re=0.2
            call DestroyEffect( AddSpecialEffectTarget("war3mapImported\\lr3.mdx", u, "origin") )
        else
            set udg_Re=0.1
        endif
        set b=Condition(function  langrenr)
        call GroupEnumUnitsInRange(udg_NullGroup,GetUnitX(u),GetUnitY(u),350+5*GetHeroLevel(u),b)
        call DestroyBoolExpr(b)
    endif
    set u=null
    set tm=null
    set t=null
    set b=null
    return false
endfunction



//===========================================================================
function InitTrig_LRS takes nothing returns nothing
    set gg_trg_LRS = CreateTrigger(  )
    call DisableTrigger( gg_trg_LRS )
    call TriggerAddCondition( gg_trg_LRS, Condition( function Trig_LRS_Conditions ) )
endfunction
