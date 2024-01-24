
//===========================================================================
// Trigger: JumoS
//===========================================================================
function trollshougecondition takes nothing returns boolean
    local unit t=GetFilterUnit()
    if IsUnitEnemy(t, udg_P) == true and GetUnitAbilityLevel(t,'Aloc')==0 and IsUnitType(t, UNIT_TYPE_STRUCTURE) == false then
        call UnitDamageTarget( udg_U, t, udg_Re, true, true, ATTACK_TYPE_HERO, DAMAGE_TYPE_ENHANCED, WEAPON_TYPE_WHOKNOWS )
        if GetUnitAbilityLevel(t,'B006')>0 then
            call UnitDamageTarget( udg_U, t,GetUnitState(t, UNIT_STATE_MAX_LIFE)*0.01 , true, false, ATTACK_TYPE_HERO, DAMAGE_TYPE_ENHANCED, WEAPON_TYPE_WHOKNOWS )
            set udg_i=udg_i+1
        endif
        call DestroyEffect( AddSpecialEffectTarget("Objects\\Spawnmodels\\Human\\HumanBlood\\HumanBloodMortarTeam.mdl", t, "chest") )
    endif
    set t=null
    return false
endfunction

function gongsuhero takes nothing returns nothing
    local unit t=GetEnumUnit()
    call UnitAddAbility( t, 'A07T' )
    call UnitAddAbility( t, 'A07Q' )
    call SetUnitAbilityLevel(t,'A07Q',udg_n)
    set t=null
endfunction


function qudiaogongsuhero takes nothing returns nothing
    local unit t=GetEnumUnit()
    call UnitRemoveAbility( t, 'A07T' )
    call UnitRemoveAbility( t, 'A07Q' )
    set t=null
endfunction

function baochigongsu takes nothing returns nothing
    local timer tm=GetExpiredTimer()
    local integer i=GetHandleId(tm)
    local unit u=LoadUnitHandle(udg_hash, i, 5)
    local integer n=R2I((GetHeroLevel(u)-3)/7)
    set udg_Chaoxi[GetConvertedPlayerId(GetOwningPlayer(u))]=10+(3*n)
    call SetUnitAbilityLevel(u,'A07R',n)
    call UnitRemoveAbility(u,'A07S')
    call SetUnitAbilityLevel(u,'A07H',1)
    call SetUnitVertexColor(u , 130, 255, 130, 255 )
    call ForGroup(LoadGroupHandle(udg_hash,i,1),function qudiaogongsuhero)
    call FlushChildHashtable( udg_hash,i)
    call DestroyTimer( tm )
    set tm=null
    set u=null
endfunction


function trollshougeji takes nothing returns nothing
    local timer tm=GetExpiredTimer()
    local integer n=GetHandleId(tm)
    local integer g=LoadInteger(udg_hash, n, 2)
    local unit u=LoadUnitHandle(udg_hash, n, 1)
    local boolexpr b
    local integer l
    
    if g>0 then
        set udg_U=u
        set udg_P=GetOwningPlayer(u)
        set udg_i=0
        set l=GetUnitAbilityLevel(u,'A07R')
        set udg_Re=LoadReal(udg_hash, n, 5)*(0.5+(0.1*l))
        set b=Condition(function trollshougecondition)
        if GetUnitAbilityLevel(u,'Bblo')>0 then
            call GroupEnumUnitsInRange(udg_NullGroup,GetUnitX(u),GetUnitY(u),450,b)
        else
            call GroupEnumUnitsInRange(udg_NullGroup,GetUnitX(u),GetUnitY(u),350,b)
        endif
        call DestroyBoolExpr(b)
        call SetUnitState( u, UNIT_STATE_LIFE,GetUnitState(u, UNIT_STATE_LIFE)+(2.5*l*udg_i))
        call SaveInteger( udg_hash, n, 2, g-1 )
    else
        call UnitRemoveAbility(u,'A07U')
        call FlushChildHashtable( udg_hash,n)
        call DestroyTimer( tm )
    endif
    
    set tm=null
    set b=null
    set u=null
endfunction


function Trig_JumoS_Conditions takes nothing returns boolean
    local timer tm
    local integer i
    local unit u=GetTriggerUnit()
    local integer l=GetSpellAbilityId()
    
    if l=='A07P' then
        set tm=CreateTimer()
        set i=GetHandleId(tm)
        call UnitAddAbility(u,'A07U')
        call SaveUnitHandle(udg_hash,i,1,u)
        call SaveInteger(udg_hash,i,2,6)
        call SaveReal(udg_hash,i,5,100+(10*GetHeroLevel(u)))
        call TimerStart(tm,0.6,true,function trollshougeji)
    elseif l=='A07O' then
        set tm=CreateTimer()
        set i=GetHandleId(tm)
        set udg_n=R2I((GetHeroLevel(u)-3)/7)
        call SetUnitAbilityLevel(u,'A07H',11)
        call SetUnitVertexColor(u , 255, 0, 0, 255 )
        call SetUnitAbilityLevel(u,'A07R',3+udg_n)
        call UnitAddAbility(u,'A07S')
        set udg_Chaoxi[GetConvertedPlayerId(GetTriggerPlayer())]=50
        if IsUnitAlly(u,Player(5))==true then
            call SaveGroupHandle(udg_hash,i,1,udg_BlueTeamHero)
            call ForGroup(udg_BlueTeamHero,function gongsuhero)
        else
            call SaveGroupHandle(udg_hash,i,1,udg_RedTeamHero)
            call ForGroup(udg_RedTeamHero,function gongsuhero)
        endif
        call SaveUnitHandle(udg_hash,i,5,u)
        call TimerStart(tm,4+(2*GetUnitAbilityLevel(u,'A07O')),false,function baochigongsu)
    endif
    set tm=null
    set u=null
    return false
endfunction


//===========================================================================
function InitTrig_JumoS takes nothing returns nothing
    set gg_trg_JumoS = CreateTrigger(  )
    call DisableTrigger( gg_trg_JumoS )
    call TriggerAddCondition( gg_trg_JumoS, Condition( function Trig_JumoS_Conditions ) )
endfunction
