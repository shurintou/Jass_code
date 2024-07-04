
//===========================================================================
// Trigger: XiaoheiS
//===========================================================================
function adjustangle takes real r returns real
    if r>360 then
        set r=r-360
    else
        if r<0 then
            set r=r+360
        endif
    endif
    return r
endfunction

function saoshe takes nothing returns nothing
    local timer tm=GetExpiredTimer()
    local integer i=GetHandleId(tm)
    local integer g=0
    local real x
    local real y
    local real da
    local unit m
    local unit u=LoadUnitHandle(udg_hash,i,1)
    local real f
    local integer n=LoadInteger(udg_hash,i,2)
    local real pi
    
    if n>0 and GetUnitState(u, UNIT_STATE_LIFE)>0 then
        set x=GetUnitX(u)
        set y=GetUnitY(u)
        set f=GetUnitFacing(u)
        set m=LoadUnitHandle(udg_hash,i,3)
        call SetUnitX(m,x)
        call SetUnitY(m,y)
        loop
            exitwhen g>11
            set pi=adjustangle(f-60+10*g)
            call SetUnitFacing( m, pi )
            set da=pi*3.1415926/180
            call IssuePointOrderById( m, 852218,  x+(100*Cos(da)), y+(100*Sin(da)) )
            set g=g+1
        endloop
        call SaveInteger(udg_hash,i,2,n-1)
    else
        call FlushChildHashtable( udg_hash,i)
        call DestroyTimer( tm )
    endif
    
    set tm=null
    set m=null
    set u=null
endfunction

function Trig_XiaoheiS_Conditions takes nothing returns boolean
    local timer tm
    local integer i
    local unit u
    local unit m
    if  GetSpellAbilityId() == 'A03Q'  then
        set u=GetTriggerUnit()
        set m=CreateUnit(getcorrectplayer(u),'u000',GetUnitX(u),GetUnitY(u),0)
        call UnitAddAbility(m,'A03P')
        call SetUnitAbilityLevel(m,'A03P',1+GetUnitAbilityLevel(u,'B01T'))
        call UnitApplyTimedLife( m, 'BTLF', 5 )
        set tm=CreateTimer()
        set i=GetHandleId(tm)
        call SaveUnitHandle(udg_hash,i,1,u)
        call SaveInteger(udg_hash,i,2,R2I(GetHeroLevel(u)/6))
        call SaveUnitHandle(udg_hash,i,3,m)
        call TimerStart(tm,0.8,true,function saoshe)
    endif
    set u=null
    set m=null
    set tm=null
    return false
endfunction



//===========================================================================
function InitTrig_XiaoheiS takes nothing returns nothing
    set gg_trg_XiaoheiS = CreateTrigger(  )
    call DisableTrigger( gg_trg_XiaoheiS )
    call TriggerAddCondition( gg_trg_XiaoheiS, Condition( function Trig_XiaoheiS_Conditions ) )
endfunction
