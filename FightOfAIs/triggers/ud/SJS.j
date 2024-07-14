
//===========================================================================
// Trigger: SJS
//===========================================================================
function refumeronghua takes nothing returns nothing
    local unit t=GetEnumUnit()
    call UnitRemoveAbility(t,'A07C')
    call UnitRemoveAbility(t,'Abun')
    set t=null
endfunction


function ronghuahujiaend takes nothing returns nothing
    local timer tm=GetExpiredTimer()
    local integer i=GetHandleId(tm)
    local group g=LoadGroupHandle(udg_hash,i,2)
    call ForGroup(g,function refumeronghua)
    call GroupClear(g)
    call DestroyGroup(g)
    call FlushChildHashtable( udg_hash, i )
    call DestroyTimer(tm)
    set tm=null
    set g=null
endfunction


function ronghuahujia takes nothing returns boolean
    local unit t=GetFilterUnit()
    if IsUnitEnemy(t, udg_P) == true and GetUnitAbilityLevel(t, 'Aloc') == 0 and GetUnitState(t, UNIT_STATE_LIFE)>0 and GetUnitAbilityLevel(t, 'Avul') == 0 then
        call UnitAddAbility(t,'Abun')
        call UnitAddAbility(t,'A07C')
        set t=null
        return true
    endif
    set t=null
    return false
endfunction


function Trig_SJS_Conditions takes nothing returns boolean
    local timer tm
    local integer i=0
    local unit u=GetTriggerUnit()
    local integer l=GetSpellAbilityId()
    local group g
    local boolexpr b
    local real x
    local real y
    local unit m
    local real f
    local real pi
    local player p
    local real da
    
    
    if l == 'A07B'  then
        set tm=CreateTimer()
        set i=GetHandleId(tm)
        set g=CreateGroup()
        set udg_P=GetOwningPlayer(u)
        set b=Condition(function  ronghuahujia)
        call GroupEnumUnitsInRange(g,GetUnitX(u),GetUnitY(u),400+(50*GetUnitAbilityLevel(u,'A07B')),b)
        call DestroyBoolExpr(b)
        call SaveGroupHandle(udg_hash,i,2,g)
        call TimerStart(tm,2+GetUnitAbilityLevel(u,'A07B'),false,function ronghuahujiaend)
    elseif l=='A079' then
        set i=GetConvertedPlayerId(GetTriggerPlayer())
        set udg_Chaoxi[i]  =udg_Chaoxi[i]+10+R2I(GetHeroLevel(u)/5)
        call UnitAddAbility(u,'Apmf')
        call UnitAddAbility(u,'A07E')
        call SetUnitAbilityLevel( u, 'Apmf', GetUnitAbilityLevel(u,'A07A') )
        call PauseUnit( u, true )
        call PauseUnit( u, false)
    elseif l=='A07D' then
        set x=GetUnitX(u)
        set y=GetUnitY(u)
        set f=GetUnitFacing(u)
        set p=getcorrectplayer(u)
        set m=CreateUnit(p,'u000',x,y,0)
        set l=GetUnitAbilityLevel(u,'A07D')
        call UnitAddAbility(m,'A07D')
        call SetUnitAbilityLevel(m,'A07D',l)
        call UnitApplyTimedLife( m, 'BTLF', 1 )
        set pi=adjustangle(-22.5)
        call SetUnitFacing( m, pi )
        set da=pi*3.1415926/180
        call IssuePointOrderById( m,852125,  x+(100*Cos(da)), y+(100*Sin(da)) )
        
        set m=CreateUnit(p,'u000',x,y,0)
        call UnitAddAbility(m,'A07D')
        call SetUnitAbilityLevel(m,'A07D',l)
        call UnitApplyTimedLife( m, 'BTLF', 1 )
        set pi=adjustangle(22.5)
        call SetUnitFacing( m, pi )
        set da=pi*3.1415926/180
        call IssuePointOrderById( m,852125,  x+(100*Cos(da)), y+(100*Sin(da)) )
        
        loop
            exitwhen i>4
            set m=CreateUnit(p,'u008',x,y,0)
            call SetUnitAbilityLevel(m,'Apmf',l)
            call PauseUnit( m, true )
            call PauseUnit( m, false)
            call IssuePointOrderById(m, 851986, x+GetRandomReal(-500,500),y+GetRandomReal(-500,500) )
            call UnitApplyTimedLife( m, 'BTLF', 5+l )
            set i=i+1
        endloop
    endif
    set g=null
    set m=null
    set b=null
    set p=null
    set tm=null
    set u=null
    return false
endfunction



//===========================================================================
function InitTrig_SJS takes nothing returns nothing
    set gg_trg_SJS = CreateTrigger(  )
    call DisableTrigger( gg_trg_SJS )
    call TriggerAddCondition( gg_trg_SJS, Condition( function Trig_SJS_Conditions ) )
endfunction
