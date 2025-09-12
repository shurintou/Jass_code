
//===========================================================================
// Trigger: TreeS
//===========================================================================
function xuanqushumiao takes nothing returns boolean
    local unit t=GetFilterUnit()
    local integer i
    local unit m
    
    if IsUnitType(t, UNIT_TYPE_STRUCTURE) == false and IsUnitEnemy(t, udg_P) == true and GetUnitAbilityLevel(t, 'Aloc') == 0 and GetUnitState(t, UNIT_STATE_LIFE)>0 then
        call IssueTargetOrderById( udg_DeathKnight, 852171, t )
    else
        if IsUnitAlly(t, udg_P) then
            set i=GetUnitTypeId(t)
            if i=='o005' or i == 'nfgt' then
                set m=CreateUnit(udg_P,i,GetUnitX(t)+GetRandomReal(-25,25),GetUnitY(t)+GetRandomReal(-25,25),0)
                call UnitAddAbility(t,'A05E')
                call UnitAddAbility(t,'AItg')
                call UnitAddAbility(m,'A05E')
                call UnitAddAbility(m,'AItg')
                call DestroyEffect( AddSpecialEffectTarget("Abilities\\Spells\\Items\\AIlm\\AIlmTarget.mdl", t, "origin") )
                call DestroyEffect( AddSpecialEffectTarget("Abilities\\Spells\\Items\\AIlm\\AIlmTarget.mdl", m, "origin") )
                call SetUnitScale(t, 1.50, 1.50, 1.50 )
                call SetUnitVertexColor( t, 255, 0, 0, 255 )
                call UnitApplyTimedLife( t, 'BTLF', 15.00 )
                call SetUnitScale(m, 1.50, 1.50, 1.50 )
                call SetUnitVertexColor( m, 255, 0, 0, 255 )
                call UnitApplyTimedLife( m, 'BTLF', 15.00 )
                call SetUnitState( t, UNIT_STATE_LIFE, 200)
                set udg_Re=udg_Re+200
                set udg_n=udg_n+1
            endif
        endif
    endif
    set t=null
    set m=null
    return false
endfunction

function Trig_TreeS_Conditions takes nothing returns boolean
    local unit u=GetTriggerUnit()
    local boolexpr b
    local real x
    local real y
    local unit m
    local integer il
    local integer li=R2I(GetHeroLevel(u)/7)+(2*GetUnitAbilityLevel(u,'B01T'))
    local integer l=GetSpellAbilityId()
    if  l == 'A03W'  then
        set udg_U=u
        set udg_P=GetOwningPlayer(u)
        set udg_Re=0
        set udg_n=0
        set x=GetUnitX(u)
        set y=GetUnitY(u)
        if IsUnitAlly(u,Player(5))==true then
            set udg_i=5
        else
            set udg_i=11
        endif
        set b=Condition(function xuanqushumiao)
        call GroupEnumUnitsInRange(udg_NullGroup,x,y,1000,b)
        call DestroyBoolExpr(b)
        if udg_n>li+1 then
        else
            set il=li+2-udg_n
            loop
                exitwhen il<=0
                set m=CreateUnit(udg_P,'nfgt',x+GetRandomReal(-500,500),y+GetRandomReal(-500,500),0)
                call UnitAddAbility(m,'A05E')
                call UnitAddAbility(m,'AItg')
                call DestroyEffect( AddSpecialEffectTarget("Abilities\\Spells\\Items\\AIlm\\AIlmTarget.mdl", m, "origin") )
                call SetUnitScale(m, 1.50, 1.50, 1.50 )
                call SetUnitVertexColor( m, 255, 0, 0, 255 )
                call UnitApplyTimedLife( m, 'BTLF', 15.00 )
                set m=CreateUnit(udg_P,'o005',x+GetRandomReal(-500,500),y+GetRandomReal(-500,500),0)
                call UnitAddAbility(m,'A05E')
                call UnitAddAbility(m,'AItg')
                call DestroyEffect( AddSpecialEffectTarget("Abilities\\Spells\\Items\\AIlm\\AIlmTarget.mdl", m, "origin") )
                call SetUnitScale(m, 1.50, 1.50, 1.50 )
                call SetUnitVertexColor( m, 255, 0, 0, 255 )
                call UnitApplyTimedLife( m, 'BTLF', 15.00 )
                set il=il-1
            endloop
        endif
        call SetUnitState( u, UNIT_STATE_LIFE, GetUnitState(u, UNIT_STATE_LIFE)+udg_Re)
        call DestroyEffect( AddSpecialEffectTarget("Abilities\\Spells\\Items\\AIlm\\AIlmTarget.mdl", u, "origin") )
    elseif l=='AIh1' then
        call UnitResetCooldown(u)
    endif
    set u=null
    set b=null
    set m=null
    return false
endfunction



//===========================================================================
function InitTrig_TreeS takes nothing returns nothing
    set gg_trg_TreeS = CreateTrigger(  )
    call DisableTrigger( gg_trg_TreeS )
    call TriggerAddCondition( gg_trg_TreeS, Condition( function Trig_TreeS_Conditions ) )
endfunction
