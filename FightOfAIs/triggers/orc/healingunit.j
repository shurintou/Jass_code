
//===========================================================================
// Trigger: healingunit
//
// 
//    
//===========================================================================
function healhphero takes nothing returns nothing
    local unit t=GetEnumUnit()
    local real r=GetUnitState(t, UNIT_STATE_LIFE)
    
    if IsUnitAlly(t, udg_P) == true and r>0 then
        call DestroyEffect( AddSpecialEffectTarget("Abilities\\Spells\\Human\\Resurrect\\ResurrectTarget.mdl", t, "origin") )
        call SetUnitState(t, UNIT_STATE_LIFE, r+udg_Re )
        call UnitAddAbility(t,'A01T')
        call UnitRemoveAbility(t,'A01T')
    endif
    set t=null
endfunction

function yinbaotiaojian takes nothing returns boolean
    local unit t=GetFilterUnit()
    local real r=GetUnitState(t, UNIT_STATE_MANA)
    local real l
    local real dr
    local unit m
    if IsUnitType(t, UNIT_TYPE_STRUCTURE) == false and IsUnitEnemy(t, udg_P) == true and GetUnitAbilityLevel(t, 'Aloc') == 0 and GetUnitState(t, UNIT_STATE_LIFE)>0 and GetUnitAbilityLevel(t, 'Avul') == 0 and IsUnitType(t, UNIT_TYPE_MAGIC_IMMUNE) == false  then
        if r>0 then
            set l=GetUnitState(t, UNIT_STATE_MAX_MANA)
            set dr=r-l*udg_Re
            if dr>0 then
                call SetUnitState(t, UNIT_STATE_MANA, dr)
                call UnitDamageTarget( udg_U, t,0.75*udg_Re*l , true, false,  ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
            else
                call UnitDamageTarget( udg_U, t,udg_Re*l-0.3*r , true, false,  ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
                call SetUnitState(t, UNIT_STATE_MANA, 0)
            endif
        else
            call UnitDamageTarget( udg_U, t,400*(0.7+udg_Re) , true, false,  ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
        endif
        set m=CreateUnit(udg_P,'u000',GetUnitX(t),GetUnitY(t),0)
        call DestroyEffect( AddSpecialEffectTarget("Abilities\\Spells\\Orc\\Purge\\PurgeBuffTarget.mdl", t, "origin") )
        call UnitAddAbility(m,'Apg2')
        call IssueTargetOrderById( m, 852111, t )
        call UnitApplyTimedLife( m, 'BTLF', 1.00 )
    endif
    set t=null
    set m=null
    return false
endfunction



function yinbaoleibao takes nothing returns nothing
    local timer tm=GetExpiredTimer()
    local integer i=GetHandleId(tm)
    local unit u=LoadUnitHandle(udg_hash,i,1)
    local boolexpr b
    local real x=LoadReal(udg_hash,i,2)
    local real y=LoadReal(udg_hash,i,3)
    call SaveUnitHandle(udg_hash,GetHandleId(gg_trg_healingunit),2,u)
    set b=Condition(function yinbaotiaojian)
    call KillUnit(CreateUnit(GetOwningPlayer(u),'u006',x,y,0))
    set udg_P=getcorrectplayer(u)
    set udg_U=u
    set udg_Re=0.3+(0.01*GetHeroLevel(u))
    call GroupEnumUnitsInRange(udg_NullGroup,x,y,1000,b)
    call DestroyBoolExpr(b)
    
    
    
    
    call FlushChildHashtable( udg_hash,i)
    call DestroyTimer( tm )
    set tm=null
    set u=null
    set b=null
endfunction


function Trig_healingunit_Conditions takes nothing returns boolean
    local unit u=GetTriggerUnit()
    local integer i=1
    local unit t
    local unit m
    local player p
    local real x
    local real y
    local real da
    local real pia
    local timer tm
    local integer ll=GetSpellAbilityId()
    local integer level=R2I((GetHeroLevel(u)-5)/5)
    call SetPlayerTechResearched(GetTriggerPlayer(), 'R008', level)
    if  ll == 'A01Q'  then
        set udg_P=GetOwningPlayer(u)
        if GetUnitAbilityLevel(u,'B01T')>0 then
            set udg_Re=(GetUnitAbilityLevel(u,'A01Q')*150)+150+(3*GetHeroInt(u,true))
        else
            set udg_Re=(GetUnitAbilityLevel(u,'A01Q')*100)+100+(2*GetHeroInt(u,true))
        endif
        call ForGroup(udg_HeroGroup,function healhphero)
    elseif  ll == 'A01R'  then
        set t=GetSpellTargetUnit()
        if CheckLinken(t)==true then
            set p=getcorrectplayer(u)
            set x=GetUnitX(u)
            set y=GetUnitY(u)
            set pia=3.1415926
            loop
                exitwhen i>12
                set da=pia*30*i/180
                set m=CreateUnit(p,'u000',x+(250*Cos(da)),y+(250*Sin(da)),0)
                call UnitAddAbility( m, 'A01S' )
                call SetUnitAbilityLevel(m,'A01S',level)
                call UnitApplyTimedLife( m, 'BTLF', 1.00 )
                call IssueTargetOrderById( m, 852095, t )
                set i=i+1
            endloop
        endif
    elseif ll == 'A01U'  then
        set m=CreateUnit(GetTriggerPlayer(),'o000',GetUnitX(u),GetUnitY(u),0)
        call UnitApplyTimedLife( m, 'BHwe', level+2.5 )
        call IssuePointOrderById( m, 851983, 0, 0 )
        //call SetUnitAnimationByIndex(u, 6 )
        //set udg_SpellTimer[GetConvertedPlayerId(GetTriggerPlayer())]=5getcorrectplayer(u)
    elseif ll == 'A01W'  then
        set tm=CreateTimer()
        set i=GetHandleId(tm)
        call SaveUnitHandle(udg_hash,i,1,u)
        call SaveReal(udg_hash,i,2,GetSpellTargetX())
        call SaveReal(udg_hash,i,3,GetSpellTargetY())
        call TimerStart(tm,2,false,function yinbaoleibao)
    elseif ll=='AIh1' then
        call UnitResetCooldown(u)
    endif
    
    set m=null
    set p=null
    set t=null
    set tm=null
    set u=null
    return false
endfunction



//===========================================================================
function InitTrig_healingunit takes nothing returns nothing
    set gg_trg_healingunit = CreateTrigger(  )
    call DisableTrigger( gg_trg_healingunit)
    call TriggerAddCondition( gg_trg_healingunit, Condition( function Trig_healingunit_Conditions ) )
    
endfunction
