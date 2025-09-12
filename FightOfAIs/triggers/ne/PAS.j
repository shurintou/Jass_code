
//===========================================================================
// Trigger: PAS
//===========================================================================
function refumeronghuashuangkang takes nothing returns nothing
    local unit t=GetEnumUnit()
    call UnitRemoveAbility(t,'A09I')
    call UnitRemoveAbility(t,'A09H')
    call UnitRemoveAbility(t,'A09O')
    set t=null
endfunction

function ronghuashuangkangend takes nothing returns nothing
    local timer tm=GetExpiredTimer()
    local integer i=GetHandleId(tm)
    local group g=LoadGroupHandle(udg_hash,i,2)
    call ForGroup(g,function refumeronghuashuangkang)
    call GroupClear(g)
    call DestroyGroup(g)
    call FlushChildHashtable( udg_hash, i )
    call DestroyTimer(tm)
    set tm=null
    set g=null
endfunction


function ronghuashuangkang takes nothing returns boolean
    local unit t=GetFilterUnit()
    if IsUnitType(t, UNIT_TYPE_STRUCTURE) == false and IsUnitType(t, UNIT_TYPE_MAGIC_IMMUNE)==false and IsUnitEnemy(t, udg_P) == true and GetUnitAbilityLevel(t, 'Aloc') == 0 and GetUnitState(t, UNIT_STATE_LIFE)>0 and GetUnitAbilityLevel(t, 'Avul') == 0 then
        call UnitAddAbility(t,'A09I')
        call UnitAddAbility(t,'A09H')
        call UnitAddAbility(t,'A09O')
        call SetUnitAbilityLevel(t,'A09O',udg_n)
        call UnitDamageTarget( udg_U, t, udg_Re, true, true, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
        set t=null
        return true
    endif
    set t=null
    return false
endfunction


function removepadaeffect takes nothing returns nothing
    local timer tm=GetExpiredTimer()
    local integer i=GetHandleId(tm)
    call DestroyEffect(LoadEffectHandle(udg_hash,i,1))
    call FlushChildHashtable( udg_hash, i )
    call DestroyTimer(tm)
    set tm=null
endfunction

function Trig_PAS_Conditions takes nothing returns boolean
    local timer tm
    local integer i=0
    local unit u=GetTriggerUnit()
    local integer l=GetSpellAbilityId()
    local group g
    local boolexpr b
    local real x
    local real y
    local unit m
    
    if l == 'A09E'  then
        set tm=CreateTimer()
        set i=GetHandleId(tm)
        set g=CreateGroup()
        set udg_P=GetOwningPlayer(u)
        set udg_n=GetUnitAbilityLevel(u,l)
        set udg_Re=100+(75*udg_n)
        set udg_U=u
        set b=Condition(function  ronghuashuangkang)
        call GroupEnumUnitsInRange(g,GetSpellTargetX(),GetSpellTargetY(),400,b)
        call DestroyBoolExpr(b)
        call SaveGroupHandle(udg_hash,i,2,g)
        call TimerStart(tm,10,false,function ronghuashuangkangend)
    elseif l=='A09G' then
        set x=GetSpellTargetX()
        set y=GetSpellTargetY()
        set m=CreateUnit(getcorrectplayer(u),'u000',x,y,0)
        set tm=CreateTimer()
        set i=GetHandleId(tm)
        call SaveEffectHandle(udg_hash,i,1,AddSpecialEffect("war3mapImported\\PADA.mdx", x, y))
        call UnitAddAbility( m, 'A09D' )
        call UnitApplyTimedLife( m, 'BTLF', 40.00 )
        call SetUnitAbilityLevel(m,'A09D',R2I((GetHeroLevel(u)-3)/7)+GetUnitAbilityLevel(u,'B01T'))
        call IssueImmediateOrderById( m, 852184 )
        call TimerStart(tm,32,false,function removepadaeffect)
    endif
    set m=null
    set u=null
    set tm=null
    set g=null
    set b=null
    return false
endfunction



//===========================================================================
function InitTrig_PAS takes nothing returns nothing
    set gg_trg_PAS = CreateTrigger(  )
    call DisableTrigger( gg_trg_PAS )
    call TriggerAddCondition( gg_trg_PAS, Condition( function Trig_PAS_Conditions ) )
endfunction
