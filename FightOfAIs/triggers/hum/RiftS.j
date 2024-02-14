
//===========================================================================
// Trigger: RiftS
//===========================================================================
function lianxudaodan takes nothing returns nothing
    local timer tm=GetExpiredTimer()
    local integer i=GetHandleId(tm)
    local integer n=LoadInteger(udg_hash,i,4)
    local unit m
    local unit t
    local unit u=LoadUnitHandle(udg_hash,i,1)
    local integer g
    if n>0 and GetUnitState(u, UNIT_STATE_LIFE)>0 then
        set t=LoadUnitHandle(udg_hash,i,3)
        set m=LoadUnitHandle(udg_hash,i,2)
        set g=GetUnitAbilityLevel(m,'A02B')
        if g<6 then
            call SetUnitAbilityLevel( m, 'A02B', g+1 )
        endif
        call IssueImmediateOrderById( u, 851972 )
        call SetUnitAnimationByIndex(u, 7 )
        call SetUnitX(m,GetUnitX(u))
        call SetUnitY(m,GetUnitY(u))
        call IssuePointOrderById( m, 852560, GetUnitX(t), GetUnitY(t) )
        call SaveInteger(udg_hash,i,4,n-1)
    else
        call FlushChildHashtable( udg_hash,i)
        call DestroyTimer( tm )
    endif
    set tm=null
    set u=null
    set m=null
    set t=null
endfunction

function Trig_RiftS_Conditions takes nothing returns boolean
    local timer tm
    local integer i
    local unit u=GetTriggerUnit()
    local unit m
    local unit t
    local integer l=GetSpellAbilityId()
    
    if  l == 'A03R' then
        set m=CreateUnit(getcorrectplayer(u),'u000',0,0,0)
        call UnitApplyTimedLife( m, 'BTLF', 15.00 )
        call UnitAddAbility(m,'A03S')
        call SetUnitAbilityLevel(m,'A03S',R2I((GetHeroLevel(u)-3)/7))
        call IssuePointOrderById( m, 852089, GetSpellTargetX(),GetSpellTargetY() )
    elseif  l == 'A02D'  then
        set t=GetSpellTargetUnit()
        if CheckLinken(t)==true then
            call DestroyEffect( AddSpecialEffectTarget("Abilities\\Spells\\Items\\AItb\\AItbTarget.mdl", u, "overhead") )
            set tm=CreateTimer()
            set i=GetHandleId(tm)
            set m=CreateUnit(getcorrectplayer(u),'u000',GetUnitX(u),GetUnitY(u),0)
            call SaveUnitHandle(udg_hash,i,1,u)
            call SaveUnitHandle(udg_hash,i,2,m)
            call SaveUnitHandle(udg_hash,i,3,t)
            if GetUnitAbilityLevel(u,'B01T')>0 then
                call SaveInteger(udg_hash,i,4,5+R2I(GetHeroLevel(u)/6))
            else
                call SaveInteger(udg_hash,i,4,4+R2I(GetHeroLevel(u)/10))
            endif
            call UnitApplyTimedLife( m, 'BTLF', 11.00 )
            call UnitAddAbility(m,'A02B')
            call SetUnitAnimationByIndex(u, 7 )
            call IssuePointOrderById( m, 852560, GetUnitX(t), GetUnitY(t) )
            call TimerStart(tm,0.9,true,function lianxudaodan)
        endif
    endif
    
    set tm=null
    set t=null
    set u=null
    set m=null
    return false
endfunction



//===========================================================================
function InitTrig_RiftS takes nothing returns nothing
    set gg_trg_RiftS = CreateTrigger(  )
    call DisableTrigger( gg_trg_RiftS )
    call TriggerAddCondition( gg_trg_RiftS, Condition( function Trig_RiftS_Conditions ) )
    
endfunction
