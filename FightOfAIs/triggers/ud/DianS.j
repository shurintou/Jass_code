
//===========================================================================
// Trigger: DianS
//===========================================================================
function shandian1 takes nothing returns nothing
    local timer tm=GetExpiredTimer()
    local integer i=GetHandleId(tm)
    local integer n=LoadInteger(udg_hash,i,0)
    local unit u=LoadUnitHandle(udg_hash,i,1)
    local unit m=LoadUnitHandle(udg_hash,i,2)
    
    if GetUnitState(u, UNIT_STATE_LIFE)>0 and n>0 then
        call SetUnitX(m,GetUnitX(u))
        call SetUnitY(m,GetUnitY(u))
        call IssueTargetOrderById(m, 852587,u )
        call SaveInteger(udg_hash,i,0,n-1)
    else
        call DestroyEffect(LoadEffectHandle(udg_hash,i,4)  )
        call KillUnit(m)
        call FlushChildHashtable( udg_hash, i )
        call DestroyTimer(tm)
    endif
    
    set m=null
    set tm=null
    set u=null
endfunction



function diandiandian takes nothing returns nothing
    local unit t=GetEnumUnit()
    local unit m
    local real x
    local real y
    if GetUnitState(t, UNIT_STATE_LIFE)>0 then
        call RemoveUnit(t)
        set x=udg_X+GetRandomReal(-600,600)
        set y=udg_Y+GetRandomReal(-600,600)
        set m=CreateUnit(udg_P,'u00A',x,y,0)
        call DestroyEffect( AddSpecialEffect("war3mapImported\\Mjolnir.mdx", x, y) )
        call SetUnitAbilityLevel(m,'ACdr',udg_n)
        call IssueImmediateOrderById( m, 852096 )
        call UnitApplyTimedLife( m, 'BTLF', 9 )
        call IssueTargetOrderById( m, 852487, udg_U )
    endif
    set m=null
    set t=null
endfunction

function Trig_DianS_Conditions takes nothing returns boolean
    local integer i=GetSpellAbilityId()
    local unit u=GetTriggerUnit()
    local real x
    local real y
    local unit m
    local timer tm
    local player p
    local unit t
    local integer l
    
    
    if  i == 'A046' then
        set x=GetSpellTargetX()
        set y=GetSpellTargetY()
        set m=CreateUnit(getcorrectplayer(u),'u00A',x,y,270)
        call SetUnitAbilityLevel(m,'A043',R2I((GetHeroLevel(u)-3)/7))
        call DestroyEffect( AddSpecialEffect("war3mapImported\\Mjolnir.mdx", x, y) )
        call UnitApplyTimedLife( m, 'BTLF', 30 )
        call IssueImmediateOrderById( m, 852096 )
        call GroupAddUnit( udg_DianGroup[GetConvertedPlayerId(GetTriggerPlayer())], m )
    elseif  i=='A047' then
        set t=GetSpellTargetUnit()
        if CheckLinken(t)==true then
            set tm=CreateTimer()
            set x=GetUnitX(t)
            set y=GetUnitY(t)
            set p=getcorrectplayer(u)
            set i=GetHandleId(tm)
            set m=CreateUnit(p,'u00A',x,y,270)
            call SetUnitAbilityLevel(m,'A048',R2I((GetHeroLevel(u)-3)/7))
            call GroupAddUnit( udg_DianGroup[GetConvertedPlayerId(GetTriggerPlayer())], m )
            call UnitApplyTimedLife( m, 'BTLF', 30 )
            set m=CreateUnit(p,'u00B',x,y,0)
            call IssueTargetOrderById( m, 852587,t )
            call SaveUnitHandle(udg_hash,i,1,t)
            call SaveUnitHandle(udg_hash,i,2,m)
            call SaveEffectHandle(udg_hash,i,4,AddSpecialEffectTarget("war3mapImported\\OutlandStorm.mdx", t, "overhead"))
            call SaveInteger(udg_hash,i,0,4+R2I(GetHeroLevel(u)/10))
            call TimerStart(tm,2,true,function shandian1 )
        endif
    elseif  i=='A044' then
        set udg_U=GetSpellTargetUnit()
        if CheckLinken(udg_U)==true then
            set udg_X=GetUnitX(udg_U)
            set udg_Y=GetUnitY(udg_U)
            set udg_P=getcorrectplayer(u)
            set udg_n=R2I(GetHeroLevel(u)/10)
            set i=GetConvertedPlayerId(GetTriggerPlayer())
            call ForGroup(udg_DianGroup[i],function diandiandian)
            call GroupClear(udg_DianGroup[i])
            set i=0
            set l=R2I(GetHeroLevel(u)/5)-1+(2*GetUnitAbilityLevel(u,'B01T'))
            set p=getcorrectplayer(u)
            loop
                exitwhen i>l
                set x=udg_X+GetRandomReal(-600,600)
                set y=udg_Y+GetRandomReal(-600,600)
                set m=CreateUnit(p,'u00A',x,y,0)
                call UnitAddAbility(m,'Atru')
                call DestroyEffect( AddSpecialEffect("war3mapImported\\Mjolnir.mdx", x, y) )
                call SetUnitAbilityLevel(m,'ACdr',udg_n)
                call IssueImmediateOrderById( m, 852096 )
                call UnitApplyTimedLife( m, 'BTLF', 9 )
                call IssueTargetOrderById( m, 852487, udg_U )
                set i=i+1
            endloop
        endif
    elseif i=='AIh1' then
        call UnitResetCooldown(u)
    endif
    
    
    set t=null
    set u=null
    set m=null
    set tm=null
    set p=null
    return false
endfunction



//===========================================================================
function InitTrig_DianS takes nothing returns nothing
    set gg_trg_DianS = CreateTrigger(  )
    call DisableTrigger( gg_trg_DianS )
    call TriggerAddCondition( gg_trg_DianS, Condition( function Trig_DianS_Conditions ) )
endfunction
