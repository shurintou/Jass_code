
//===========================================================================
// Trigger: JDS
//===========================================================================
function Trig_JDS_Conditions takes nothing returns boolean
    local integer i=GetSpellAbilityId()
    local unit u=GetTriggerUnit()
    local real x
    local real y
    local integer g
    local real da
    local real pia
    local unit m
    
    //  if i=='A040' then
    //set m=CreateUnit(GetTriggerPlayer(),'o006',GetSpellTargetX(),GetSpellTargetY(),270)
    //call UnitApplyTimedLife( m, 'BTLF', 30 )
    //else
    if  i == 'A03Y'  then
        set m=CreateUnit(getcorrectplayer(u),'u000',0,0,0)
        call UnitApplyTimedLife( m, 'BTLF', 15.00 )
        call UnitAddAbility(m,'A03Z')
        call SetUnitAbilityLevel(m,'A03Z',R2I((GetHeroLevel(u)-3)/6))
        call IssuePointOrderById( m, 852089, GetSpellTargetX(),GetSpellTargetY() )
    elseif   i == 'A042'  then
        set x=GetUnitX(u)
        set y=GetUnitY(u)
        set g=0
        set m=CreateUnit(getcorrectplayer(u),'u000',x,y,0)
        call SetUnitScale(m, 1.50, 1.50, 1.50 )
        call UnitAddAbility(m,'A041')
        call SetUnitAbilityLevel(m,'A041',R2I((GetHeroLevel(u)-3)/6)+GetUnitAbilityLevel(u,'B01T'))
        call UnitApplyTimedLife( m, 'BTLF', 1.50 )
        loop
            exitwhen g>18
            set pia=20*g
            set da=pia*3.1415926/180
            call SetUnitFacing(m,pia)
            call IssuePointOrderById( m, 852560, x+(100*Cos(da)), y+(100*Sin(da)) )
            set g=g+1
        endloop
    elseif i=='AIh1' then
        call UnitResetCooldown(u)
    endif
    
    
    
    set u=null
    set m=null
    return false
endfunction



//===========================================================================
function InitTrig_JDS takes nothing returns nothing
    set gg_trg_JDS = CreateTrigger(  )
    call DisableTrigger( gg_trg_JDS )
    call TriggerAddCondition( gg_trg_JDS, Condition( function Trig_JDS_Conditions ) )
endfunction
