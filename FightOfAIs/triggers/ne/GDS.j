
//===========================================================================
// Trigger: GDS
//===========================================================================
function  greendragons takes nothing returns nothing
    local unit t=GetEnumUnit()
    call IssuePointOrderById( t, 852218, udg_X, udg_Y )
    call UnitApplyTimedLife( t, 'BTLF', 1 )
    set t=null
endfunction


function greenattack takes nothing returns nothing
    local timer tm=GetExpiredTimer()
    local integer i=GetHandleId(tm)
    local integer g=LoadInteger(udg_hash,i,4)
    local unit u=LoadUnitHandle(udg_hash,i,1)
    local unit t=LoadUnitHandle(udg_hash,i,3)
    local integer y
    local texttag a
    if g>1 then
        call UnitDamageTarget( u, t,LoadReal(udg_hash,i,17), true, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
        call SaveInteger(udg_hash,i,4,g-1)
        call SaveReal(udg_hash,i,7,GetUnitX(t))
        call SaveReal(udg_hash,i,8,GetUnitY(t))
    else
        set y=GetConvertedPlayerId(GetOwningPlayer(u))
        set udg_n=y
        if GetUnitState(t, UNIT_STATE_LIFE)>0 then
            set udg_X=GetUnitX(t)
            set udg_Y=GetUnitY(t)
        else
            set udg_X=LoadReal(udg_hash,i,7)
            set udg_Y=LoadReal(udg_hash,i,8)
        endif
        if GetUnitState(t, UNIT_STATE_LIFE)>0 then
            call UnitDamageTarget( u, t,udg_Chaoxi[y]*GetUnitState(t, UNIT_STATE_MAX_LIFE)*0.05, true, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
            if  IsUnitVisible(t, Player(0))==true then
                set a=CreateTextTag()
                call SetTextTagText(a, "X"+I2S(udg_Chaoxi[y]), 0.04)
                call SetTextTagPosUnit(a,t,0)
                call SetTextTagColor(a,102,205,0,255)
                call SetTextTagVelocity( a, 0.00, 0.04 )
                call SetTextTagFadepoint( a, 0.50 )
                call SetTextTagLifespan(a, 1 )
                call SetTextTagPermanent( a, false )
            endif
        endif
        call ForGroup(udg_DianGroup[y],function greendragons)
        call GroupClear(udg_DianGroup[y])
        set udg_SpellTarget[y]=null
        call FlushChildHashtable( udg_hash, i )
        call DestroyTimer(tm)
    endif
    set t=null
    set tm=null
    set a=null
    set u=null
endfunction

function Trig_GDS_Conditions takes nothing returns boolean
    local timer tm
    local integer i
    local unit u=GetTriggerUnit()
    local unit t
    local integer l=GetSpellAbilityId()
    local unit m
    local integer h=GetConvertedPlayerId(GetTriggerPlayer())
    local integer e=GetHeroLevel(u)
    
    if l=='A07G' then
        set t=GetSpellTargetUnit()
        if CheckLinken(t)==true then
            set tm=CreateTimer()
            call DestroyEffect( AddSpecialEffectTarget("war3mapImported\\greendragon1.mdx", t, "origin") )
            set udg_SpellTarget[h]=t
            set i=GetHandleId(tm)
            call SaveUnitHandle(udg_hash,i,1,u)
            call SaveUnitHandle(udg_hash,i,3,t)
            call SaveReal(udg_hash,i,17,25+(1.75*e))
            call SaveInteger(udg_hash,i,4,8)
            call SaveReal(udg_hash,i,7,GetUnitX(t))
            call SaveReal(udg_hash,i,8,GetUnitY(t))
            call UnitDamageTarget( u, t,e*udg_Chaoxi[h], true, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
            call TimerStart(tm,0.5,true,function greenattack)
            set udg_Chaoxi[h]=1
        endif
    elseif  l=='A07J' then
        set udg_X=GetUnitX(u)
        set udg_Y=GetUnitY(u)
        call ForGroup(udg_DianGroup[h],function greendragons)
        call GroupClear(udg_DianGroup[h])
        call SetUnitState( u, UNIT_STATE_LIFE, GetUnitState(u, UNIT_STATE_LIFE)+(udg_UGharm[h]*GetUnitState(u, UNIT_STATE_MAX_LIFE)))
        set udg_UGharm[h]=0.01
    endif
    set i=R2I((e-5)/5)
    set l=GetUnitAbilityLevel(u,'B01T')
    
    
    if GetUnitState(u, UNIT_STATE_LIFE)/GetUnitState(u, UNIT_STATE_MAX_LIFE)>0.5 then
        set m=CreateUnit(getcorrectplayer(u) ,'u007',GetUnitX(u)+GetRandomReal(-100,100),GetUnitY(u)+GetRandomReal(-100,100),GetRandomReal(0,360))
        call SetUnitAbilityLevel(m,'A07F',i+l)
    else
        set m=CreateUnit(getenemyplayer(u) ,'u007',GetUnitX(u)+GetRandomReal(-100,100),GetUnitY(u)+GetRandomReal(-100,100),GetRandomReal(0,360))
        call UnitRemoveAbility(m,'A07F')
        call UnitAddAbility(m,'A07M')
        call SetUnitAbilityLevel(m,'A07M',i+l)
    endif
    call IssuePointOrderById( m, 852218, GetUnitX(u), GetUnitY(u) )
    call UnitApplyTimedLife( m, 'BTLF', 8 )
    call GroupAddUnit( udg_DianGroup[h], m )
    set tm=null
    set t=null
    set u=null
    set m=null
    
    return false
endfunction



//===========================================================================
function InitTrig_GDS takes nothing returns nothing
    set gg_trg_GDS = CreateTrigger(  )
    call DisableTrigger( gg_trg_GDS )
    call TriggerAddCondition( gg_trg_GDS, Condition( function Trig_GDS_Conditions ) )
endfunction
