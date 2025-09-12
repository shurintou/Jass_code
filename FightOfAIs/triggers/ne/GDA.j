
//===========================================================================
// Trigger: GDA
//===========================================================================
function Trig_GDA_Conditions takes nothing returns boolean
    local unit u=GetTriggerUnit()
    local unit t=GetEventTargetUnit()
    local integer l=GetHeroLevel(u)
    local integer i=R2I((l-5)/5)
    local unit m
    local real fa
    local real f
    local player p=GetTriggerPlayer()
    local integer n=GetConvertedPlayerId(p)
    local integer y=GetUnitAbilityLevel(u,'B01T')
    local integer c= CountUnitsInGroup(udg_DianGroup[n])
    local real mp
    
    
    if IsUnitType(t, UNIT_TYPE_STRUCTURE) == false then
        set mp=GetUnitState(u, UNIT_STATE_MANA)
        if GetUnitTypeId(u)=='N00A' and mp>100 then
            set  fa=GetRandomReal(128,800)
            set  f=Deg2Rad(GetUnitFacing(u))
            call SetUnitState( u, UNIT_STATE_MANA,mp-(20*i))
            if c>7+i then
                set m=GroupPickRandomUnit(udg_DianGroup[n])
                call GroupRemoveUnit( udg_DianGroup[n],m )
                call RemoveUnit(m)
            endif
            
            if GetUnitState(u, UNIT_STATE_LIFE)/GetUnitState(u, UNIT_STATE_MAX_LIFE)>0.5 then
                set m=CreateUnit(getcorrectplayer(u) ,'u007',GetUnitX(t)+fa*Cos(f)+GetRandomReal(-100,100),GetUnitY(t)+fa*Sin(f)+GetRandomReal(-100,100),GetRandomReal(0,360))
                call SetUnitAbilityLevel(m,'A07F',i+y)
            else
                set m=CreateUnit(getenemyplayer(u) ,'u007',GetUnitX(t)+fa*Cos(f)+GetRandomReal(-100,100),GetUnitY(t)+fa*Sin(f)+GetRandomReal(-100,100),GetRandomReal(0,360))
                call UnitRemoveAbility(m,'A07F')
                call UnitAddAbility(m,'A07M')
                call SetUnitAbilityLevel(m,'A07M',i+y)
            endif
            call IssuePointOrderById( m, 852218, GetUnitX(u), GetUnitY(u) )
            call UnitApplyTimedLife( m, 'BTLF', 8 )
            call GroupAddUnit( udg_DianGroup[n], m )
        endif
        
    endif
    call SetUnitAbilityLevel(u,'A07G',i)
    call SetUnitAbilityLevel(u,'A07J',i)
    set i=R2I((l-3)/7)+y
    call SetUnitAbilityLevel(u,'A07I',i)
    
    if udg_SpellTarget[n]==t then
        set udg_Chaoxi[n]=udg_Chaoxi[n]+1+y
    endif
    
    
    if  IsUnitType(t, UNIT_TYPE_HERO) == true  then
        call IssueTargetOrderById( u, 852095, t )
        if GetUnitDefaultFlyHeight(u) < 300 then
            call IssueImmediateOrderById( u, 852180 )
        endif
        set udg_UGharm[n]=udg_UGharm[n]+(0.01*(2+y))
    else
        set udg_UGharm[n]=udg_UGharm[n]+(0.01*(1+y))
    endif
    
    if  GetUnitState(u, UNIT_STATE_LIFE)< GetUnitState(u, UNIT_STATE_MAX_LIFE)*0.5 then
        call IssueImmediateOrderById(u, 852184 )
    endif
    
    set u=null
    set t=null
    set p=null
    set m=null
    return false
endfunction



//===========================================================================
function InitTrig_GDA takes nothing returns nothing
    set gg_trg_GDA = CreateTrigger(  )
    call DisableTrigger( gg_trg_GDA )
    call TriggerAddCondition( gg_trg_GDA, Condition( function Trig_GDA_Conditions ) )
endfunction
