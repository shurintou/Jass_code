
//===========================================================================
// Trigger: Arthashealingnova
//===========================================================================
function hunzhiwange takes nothing returns nothing
    local timer tm=GetExpiredTimer()
    local integer i=GetHandleId(tm)
    local unit u=LoadUnitHandle(udg_hash,i,1)
    local integer n=LoadInteger(udg_hash,i,2)
    local real x
    local real y
    local integer g=0
    local real da
    local real pia=3.1415926
    
    if n<11 then
        set x=LoadReal(udg_hash,i,3)
        set y=LoadReal(udg_hash,i,4)
        loop
            exitwhen g>12
            set da=pia*30*g/180
            call SetUnitX(u,x+(125*n*Cos(da)))
            call SetUnitY(u,y+(125*n*Sin(da)))
            call IssueImmediateOrderById( u, 852526 )
            set g=g+1
        endloop
        call SaveInteger(udg_hash,i,2,n+1)
    else
        call RemoveUnit(u)
        call FlushChildHashtable(udg_hash,i)
        call DestroyTimer( tm )
    endif
    
    set u=null
    set tm=null
endfunction

function shanchumomian takes nothing returns nothing
    local timer tm=GetExpiredTimer()
    local integer i=GetHandleId(tm)
    local unit u=LoadUnitHandle(udg_hash,i,1)
    call SetPlayerAbilityAvailable( GetOwningPlayer(u), 'A00O', true )
    call DestroyEffect(LoadEffectHandle(udg_hash,i,2)  )
    call UnitRemoveAbility(u,'A07N')
    call FlushChildHashtable( udg_hash,i)
    call DestroyTimer( tm )
    set u=null
    set tm=null
endfunction

function Trig_Arthashealingnova_Conditions takes nothing returns boolean
    local unit m
    local unit u=GetTriggerUnit()
    local integer i
    local timer tm
    local real x
    local real y
    local integer l=GetSpellAbilityId()
    local integer le
    
    
    if l == 'A00O'  then
        set tm=CreateTimer()
        set i=GetHandleId(tm)
        call UnitAddAbility(u,'A07N')
        call SaveUnitHandle(udg_hash,i,1,u)
        call SaveEffectHandle(udg_hash,i,2,AddSpecialEffectTarget("Abilities\\Spells\\Items\\StaffOfSanctuary\\Staff_Sanctuary_Target.mdl", u, "chest"))
        call TimerStart(tm,3,false,function shanchumomian)
        set le=R2I((GetHeroLevel(u)-6)/4)
        call SetUnitAbilityLevel(u,'A00M',le)
        call SetUnitAbilityLevel(u,'A00O',le)
        set m=CreateUnit(getcorrectplayer(u),'u000',GetUnitX(u),GetUnitY(u),0)
        call UnitAddAbility( m, 'A06P' )
        call SetUnitAbilityLevel(m,'A06P',le)
        call IssueImmediateOrderById( m, 852526 )
        call UnitApplyTimedLife( m, 'BTLF', 1.00 )
        call SetPlayerAbilityAvailable( GetTriggerPlayer(), 'A00O', false )
    elseif l == 'A00Q' then
        set tm=CreateTimer()
        set i=GetHandleId(tm)
        set x=GetUnitX(u)
        set y=GetUnitY(u)
        set m=CreateUnit(getcorrectplayer(u),'u000',x,y,0)
        call UnitAddAbility( m, 'A01L' )
        call SetUnitAbilityLevel(m,'A01L',R2I((GetHeroLevel(u)-3)/7)+GetUnitAbilityLevel(u,'B01T'))
        call IssueImmediateOrderById( m, 852526 )
        call UnitApplyTimedLife( m, 'BTLF', 3.00 )
        call SaveUnitHandle(udg_hash,i,1,m)
        call SaveInteger(udg_hash,i,2,1)
        call SaveReal(udg_hash,i,3,x)
        call SaveReal(udg_hash,i,4,y)
        call TimerStart(tm,0.25,true,function hunzhiwange)
        set m=CreateUnit(GetTriggerPlayer(),'u000',x,y,0)
        call UnitAddAbility( m, 'S000' )
        call UnitApplyTimedLife( m, 'BTLF', 3.00 )
    elseif l=='AIh1' then
        call UnitResetCooldown(u)
    endif
    
    
    set u=null
    set m=null
    set tm=null
    return false
endfunction



//===========================================================================
function InitTrig_Arthashealingnova takes nothing returns nothing
    set gg_trg_Arthashealingnova = CreateTrigger(  )
    call DisableTrigger(gg_trg_Arthashealingnova)
    call TriggerAddCondition( gg_trg_Arthashealingnova, Condition( function Trig_Arthashealingnova_Conditions ) )
    
endfunction
