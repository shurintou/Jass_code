
//===========================================================================
// Trigger: bingfengqiu
//===========================================================================
function jilvjilv takes unit u returns integer
    local integer y=1+R2I(GetHeroLevel(u)/22)+GetUnitAbilityLevel(u,'B01T')
    local integer i=GetRandomInt(0,y)
    local integer n=1
    local texttag a
    local real m
    loop
        set m=75+(25*n)
        exitwhen i==0 or GetUnitState(u, UNIT_STATE_MANA)<m
        set n=n+1
        set i=GetRandomInt(0,y)
        call SetUnitState( u, UNIT_STATE_MANA,GetUnitState(u, UNIT_STATE_MANA)-m)
    endloop
    if  IsUnitVisible(u, Player(0))==true then
        set a=CreateTextTag()
        call SetTextTagText(a, "X"+I2S(n), 0.04)
        call SetTextTagPosUnit(a,u,0)
        call SetTextTagColor(a,28,134,238,255)
        call SetTextTagVelocity( a, 0.00, 0.04 )
        call SetTextTagFadepoint( a, 0.50 )
        call SetTextTagLifespan(a, 1 )
        call SetTextTagPermanent( a, false )
    endif
    set a=null
    return n
endfunction

function bingfengbaozha takes nothing returns nothing
    local timer tm=GetExpiredTimer()
    local integer i=GetHandleId(tm)
    local integer n=LoadInteger(udg_hash,i,2)
    local integer g=0
    local real x
    local real y
    local real da
    local real pia
    local unit m=LoadUnitHandle(udg_hash,i,5)
    
    if n>0 then
        set x=LoadReal(udg_hash,i,3)+GetRandomReal(-300,300)
        set y=LoadReal(udg_hash,i,4)+GetRandomReal(-300,300)
        call SetUnitX(m,x)
        call SetUnitY(m,y)
        loop
            exitwhen g>18
            
            set pia=20*g
            call SetUnitFacing(m,pia)
            set da=pia*3.1415926/180
            call IssuePointOrderById( m, 852218, x+(100*Cos(da)), y+(100*Sin(da)) )
            set g=g+1
        endloop
        call SaveInteger(udg_hash,i,2,n-1)
    else
        call RemoveUnit(m)
        call FlushChildHashtable( udg_hash,i)
        call DestroyTimer( tm )
    endif
    
    set tm=null
    set m=null
endfunction

function novajilvjilv takes nothing returns nothing
    local timer tm=GetExpiredTimer()
    local integer i=GetHandleId(tm)
    local integer n=LoadInteger(udg_hash,i,2)
    
    if n>0 then
        call IssueTargetOrderById( LoadUnitHandle(udg_hash,i,1), 852226, LoadUnitHandle(udg_hash,i,3) )
        call SaveInteger(udg_hash,i,2,n-1)
    else
        call FlushChildHashtable( udg_hash,i)
        call DestroyTimer( tm )
    endif
    set tm=null
endfunction

function Trig_bingfengqiu_Conditions takes nothing returns boolean
    local timer tm
    local integer i
    local unit u=GetTriggerUnit()
    local real x
    local real y
    local integer g=0
    local real da
    local real pia
    local unit m
    local player p=getcorrectplayer(u)
    local integer l=GetSpellAbilityId()
    local unit t
    
    if  l == 'A01Y'  then
        set x=GetSpellTargetX()
        set y=GetSpellTargetY()
        set m=CreateUnit(p,'e000',x,y,0)
        loop
            exitwhen g>18
            set pia=20*g
            call SetUnitFacing(m,pia)
            set da=pia*3.1415926/180
            call IssuePointOrderById( m, 852218, x+(100*Cos(da)), y+(100*Sin(da)) )
            set g=g+1
        endloop
        set g=jilvjilv(u)
        if g>1 then
            set tm=CreateTimer()
            set i=GetHandleId(tm)
            call SaveInteger(udg_hash,i,2,g-1)
            call SaveReal(udg_hash,i,3,x)
            call SaveReal(udg_hash,i,4,y)
            call SaveUnitHandle(udg_hash,i,5,m)
            call TimerStart(tm,0.4,true,function bingfengbaozha)
        endif
        
    elseif l == 'A021'  then
        set x=GetSpellTargetX()
        set y=GetSpellTargetY()
        set g=jilvjilv(u)
        loop
            exitwhen g<=0
            set m=CreateUnit(p,'u000',x,y,0)
            call UnitApplyTimedLife( m, 'BTLF', 15.00 )
            call UnitAddAbility(m,'A022')
            call IssuePointOrderById( m, 852089, x+GetRandomReal(-500,500),y+GetRandomReal(-500,500) )
            set g=g-1
        endloop
        
    elseif l == 'A023'  then
        set t=GetSpellTargetUnit()
        if CheckLinken(t)==true then
            set g=jilvjilv(u)
            set m=CreateUnit(p,'u000',0,0,0)
            call UnitAddAbility(m,'A024')
            call UnitApplyTimedLife( m, 'BTLF', 10 )
            call IssueTargetOrderById( m, 852226, t )
            if g>1 then
                set tm=CreateTimer()
                set i=GetHandleId(tm)
                call SaveUnitHandle(udg_hash,i,1,m)
                call SaveUnitHandle(udg_hash,i,3,t)
                call SaveInteger(udg_hash,i,2,g-1)
                call TimerStart(tm,0.4,true,function novajilvjilv)
            endif
        endif
    elseif l=='AIh1' then
        call UnitResetCooldown(u)
    endif
    
    set t=null
    set tm=null
    set u=null
    set m=null
    set p=null
    return false
endfunction



//===========================================================================
function InitTrig_bingfengqiu takes nothing returns nothing
    set gg_trg_bingfengqiu = CreateTrigger(  )
    call DisableTrigger(gg_trg_bingfengqiu)
    call TriggerAddCondition( gg_trg_bingfengqiu, Condition( function Trig_bingfengqiu_Conditions ) )
    
endfunction
