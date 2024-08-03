
//===========================================================================
// Trigger: FTS
//===========================================================================
function rushwavegogogo takes nothing returns nothing
    local timer tm=GetExpiredTimer()
    local integer i=GetHandleId(tm)
    local unit t=LoadUnitHandle(udg_hash,i,2)
    local unit u=LoadUnitHandle(udg_hash,i,1)
    local integer n=LoadInteger(udg_hash,i,3)
    local real x
    local real y
    
    if n<21 and GetUnitState(u, UNIT_STATE_LIFE)>0 then
        set x=GetUnitX(u)+(LoadReal(udg_hash,i,6))
        set y=GetUnitY(u)+(LoadReal(udg_hash,i,7))
        call SetUnitX(u,x)
        call SetUnitY(u,y)
        call SetUnitX(t,x)
        call SetUnitY(t,y)
        call IssueImmediateOrderById( t, 852127 )
        call SaveInteger(udg_hash,i,3,n+1)
    else
        call PauseUnit( u, false )
        call RemoveUnit(t)
        call DestroyEffect(LoadEffectHandle(udg_hash,i,10))
        call FlushChildHashtable( udg_hash,i)
        call DestroyTimer( tm )
    endif
    
    set tm=null
    set u=null
    set t=null
endfunction

function highfirefatiao takes nothing returns nothing
    local timer tm=GetExpiredTimer()
    local integer i=GetHandleId(tm)
    local unit t=LoadUnitHandle(udg_hash,i,2)
    local unit u=LoadUnitHandle(udg_hash,i,1)
    local integer n=LoadInteger(udg_hash,i,3)
    if n>0 and GetUnitState(u, UNIT_STATE_LIFE)>0 then
        call SetUnitX(t,GetUnitX(u))
        call SetUnitY(t,GetUnitY(u))
        call SaveInteger(udg_hash,i,3,n-1)
    else
        call RemoveUnit(t)
        call FlushChildHashtable( udg_hash,i)
        call DestroyTimer( tm )
    endif
    set tm=null
    set t=null
    set u=null
endfunction

function wallofprotection takes nothing returns nothing
    local timer tm=GetExpiredTimer()
    local integer i=GetHandleId(tm)
    local unit u=LoadUnitHandle(udg_hash,i,1)
    call SetPlayerAbilityAvailable( GetOwningPlayer(u), 'A067', true )
    set udg_Chaoxi[LoadInteger(udg_hash,i,3)]=0
    call UnitRemoveAbility(u,'A06D')
    call FlushChildHashtable( udg_hash,i)
    call DestroyTimer( tm )
    set tm=null
    set u=null
endfunction


function fatiaodazhaodaodan takes nothing returns nothing
    local timer tm=GetExpiredTimer()
    local integer i=GetHandleId(tm)
    local unit t=LoadUnitHandle(udg_hash,i,2)
    local unit u=LoadUnitHandle(udg_hash,i,1)
    local unit m
    local integer n=LoadInteger(udg_hash,i,4)
    local real x
    local real y
    local player p
    local integer l
    
    if n>0 then
        set l=LoadInteger(udg_hash,i,3)
        set p=getcorrectplayer(u)
        call SaveInteger(udg_hash,i,4,n-1)
        if GetUnitState(t, UNIT_STATE_LIFE)>0 then
            set x=GetUnitX(t)
            set y=GetUnitY(t)
            call SaveReal(udg_hash,i,9,x)
            call SaveReal(udg_hash,i,10,y)
        else
            set x=LoadReal(udg_hash,i,9)
            set y=LoadReal(udg_hash,i,10)
        endif
        
        set m=CreateUnit(p,'o00E',x,y,0)
        call SetUnitAbilityLevel(m,'A05U',l)
        call IssuePointOrderById(m, 852664, x, y )
        call UnitApplyTimedLife( m, 'BTLF', 3.00 )
        
        if GetRandomInt(0,LoadInteger(udg_hash,i,5))>2 then
            set m=CreateUnit(p,'o00E',x,y,0)
            call SetUnitAbilityLevel(m,'A06B',l)
            call IssuePointOrderById(m, 852652, x, y )
            call UnitApplyTimedLife( m, 'BTLF', 3.00 )
        endif
    else
        call FlushChildHashtable( udg_hash,i)
        call DestroyTimer( tm )
    endif
    
    set p=null
    set u=null
    set t=null
    set m=null
    set tm=null
endfunction

function Trig_FTS_Conditions takes nothing returns boolean
    local timer tm
    local integer i
    local unit u=GetTriggerUnit()
    local integer l=GetSpellAbilityId()
    local unit t
    local real x
    local real y
    local integer ev=GetHeroLevel(u)
    local unit m
    
    if  l == 'A069'  then
        set tm=CreateTimer()
        set i=GetHandleId(tm)
        set x=GetUnitX(u)
        set y=GetUnitY(u)
        call PauseUnit( u, true )
        set udg_SpellTimer[GetConvertedPlayerId(GetTriggerPlayer())]=1
        set t=CreateUnit(getcorrectplayer(u),'u000',x,y,0)
        call UnitAddAbility(t,'A06A')
        call SetUnitAbilityLevel(t,'A06A',R2I((ev-5)/5))
        call UnitApplyTimedLife( t, 'BTLF', 3.00 )
        call IssueImmediateOrderById( t, 852127 )
        call SaveUnitHandle(udg_hash,i,1,u)
        call SaveUnitHandle(udg_hash,i,2,t)
        call SaveInteger(udg_hash,i,3,1)
        set x=Deg2Rad(GetUnitFacing(u))
        call SaveReal(udg_hash,i,6,Cos(x)*40)
        call SaveReal(udg_hash,i,7,Sin(x)*40)
        call SaveEffectHandle(udg_hash,i,10, AddSpecialEffectTarget("war3mapImported\\Effect-04.MDX", u, "chest") )
        call TimerStart(tm,0.05,true,function rushwavegogogo)
    elseif l=='A068' then
        set tm=CreateTimer()
        set i=GetHandleId(tm)
        set t=CreateUnit(GetTriggerPlayer(),'o00C',GetUnitX(u),GetUnitY(u),0)
        call SetUnitAbilityLevel(t,'A06C',R2I((ev-5)/5))
        call SaveUnitHandle(udg_hash,i,1,u)
        call SaveUnitHandle(udg_hash,i,2,t)
        call SaveInteger(udg_hash,i,3,20)
        call TimerStart(tm,0.5,true,function highfirefatiao)
    elseif l=='A067' then
        set tm=CreateTimer()
        set i=GetHandleId(tm)
        set l=GetConvertedPlayerId(GetTriggerPlayer())
        call SaveInteger(udg_hash,i,3,l)
        call SaveUnitHandle(udg_hash,i,1,u)
        set udg_Chaoxi[l]=15+R2I(ev/3)
        call UnitAddAbility(u,'A06D')
        call SetPlayerAbilityAvailable( GetTriggerPlayer(), 'A067', false )
        call TimerStart(tm,10,false,function wallofprotection)
    elseif l=='A04O' then
        set t=GetSpellTargetUnit()
        if CheckLinken(t)==true then
            set tm=CreateTimer()
            set i=GetHandleId(tm)
            set l=GetUnitAbilityLevel(u,'B01T')
            set x=GetUnitX(t)
            set y=GetUnitY(t)
            set ev=R2I((ev-3)/7)
            call SaveInteger(udg_hash,i,3,ev)
            call SaveUnitHandle(udg_hash,i,1,u)
            call SaveUnitHandle(udg_hash,i,2,t)
            call SaveInteger(udg_hash,i,4,8+(5*l)+ev)
            call SaveInteger(udg_hash,i,5,3+l)
            call SaveReal(udg_hash,i,9,x)
            call SaveReal(udg_hash,i,10,y)
            call TimerStart(tm,0.6,true,function fatiaodazhaodaodan)
        endif
    elseif l=='AIh1' then
        call UnitResetCooldown(u)
    endif
    set tm=null
    set u=null
    set t=null
    set m=null
    return false
endfunction



//===========================================================================
function InitTrig_FTS takes nothing returns nothing
    set gg_trg_FTS = CreateTrigger(  )
    call DisableTrigger( gg_trg_FTS )
    call TriggerAddCondition( gg_trg_FTS, Condition( function Trig_FTS_Conditions ) )
endfunction
