
//===========================================================================
// Trigger: NLS
//===========================================================================
function moonstrikeact takes nothing returns nothing
    local unit t
    local real x
    local real y
    if udg_n==0 then
        set t=GetEnumUnit()
        if IsUnitType(t, UNIT_TYPE_MAGIC_IMMUNE)==false and GetUnitState(t, UNIT_STATE_LIFE)>0 and IsUnitHidden(t) == false and IsUnitVisible(t, udg_P) == true then
            set x=GetUnitX(t)-udg_X
            set y=GetUnitY(t)-udg_Y
            if x*x+y*y<490000 then
                set udg_n=1
                call IssueTargetOrderById(udg_U, 852095, t)
            endif
        endif
    endif
    set t=null
endfunction

function moonstrike takes nothing returns nothing
    local timer tm=GetExpiredTimer()
    local integer i=GetHandleId(tm)
    local integer g=LoadInteger(udg_hash,i,2)
    local unit u=LoadUnitHandle(udg_hash,i,1)
    
    if GetUnitState(u, UNIT_STATE_LIFE)>0 and g>0 then
        set udg_X=GetUnitX(u)
        set udg_Y=GetUnitY(u)
        set udg_n=0
        set udg_P=GetOwningPlayer(u)
        set udg_U=LoadUnitHandle(udg_hash,i,4)
        call ForGroup(LoadGroupHandle(udg_hash,i,3),function moonstrikeact)
        call SaveInteger(udg_hash,i,2,g-1)
    else
        call RemoveUnit(LoadUnitHandle(udg_hash,i,4))
        call DestroyEffect(LoadEffectHandle(udg_hash,i,5))
        call FlushChildHashtable( udg_hash, i )
        call DestroyTimer(tm)
    endif
    set tm=null
    set u=null
endfunction

function Trig_NLS_Conditions takes nothing returns boolean
    local timer tm
    local integer i
    local unit u
    local unit m
    
    if GetSpellAbilityId()=='A054' then
        set u=GetTriggerUnit()
        set tm=CreateTimer()
        set i=GetHandleId(tm)
        call SaveUnitHandle(udg_hash,i,1,u)
        call SaveInteger(udg_hash,i,2,3+R2I(GetHeroLevel(u)/5)+(2*GetUnitAbilityLevel(u,'B01T')))
        set udg_X=GetUnitX(u)
        set udg_Y=GetUnitY(u)
        set udg_n=0
        set udg_P=GetOwningPlayer(u)
        
        if IsUnitAlly(u,Player(5))==true then
            set m=CreateUnit(Player(5),'u00C',udg_X,udg_Y,0)
            call UnitAddAbility(m,'A053')
            call SetUnitAbilityLevel(m,'A053',GetUnitAbilityLevel(u,'A052'))
            set udg_U=m
            call ForGroup(udg_RedTeamHero,function moonstrikeact)
            call SaveGroupHandle(udg_hash,i,3,udg_RedTeamHero)
        else
            set m=CreateUnit(Player(11),'u00C',udg_X,udg_Y,0)
            call UnitAddAbility(m,'A053')
            call SetUnitAbilityLevel(m,'A053',GetUnitAbilityLevel(u,'A052'))
            set udg_U=m
            call ForGroup(udg_BlueTeamHero,function moonstrikeact)
            call SaveGroupHandle(udg_hash,i,3,udg_BlueTeamHero)
        endif
        call SaveEffectHandle(udg_hash,i,5,AddSpecialEffectTarget("Units\\NightElf\\Owl\\Owl.mdl", u, "origin"))
        call SaveUnitHandle(udg_hash,i,4,m)
        call TimerStart(tm,1,true,function moonstrike)
    endif
    set u=null
    set m=null
    set tm=null
    return false
endfunction



//===========================================================================
function InitTrig_NLS takes nothing returns nothing
    set gg_trg_NLS = CreateTrigger(  )
    call DisableTrigger( gg_trg_NLS )
    call TriggerAddCondition( gg_trg_NLS, Condition( function Trig_NLS_Conditions ) )
endfunction
