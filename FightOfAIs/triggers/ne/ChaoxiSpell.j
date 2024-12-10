
//===========================================================================
// Trigger: ChaoxiSpell
//===========================================================================
function xuanquchaoxi takes nothing returns boolean
    local unit t=GetFilterUnit()
    if IsUnitType(t, UNIT_TYPE_STRUCTURE) == false and IsUnitEnemy(t, udg_P) == true and GetUnitAbilityLevel(t, 'Aloc') == 0 and GetUnitState(t, UNIT_STATE_LIFE)>0 then
        call UnitDamageTarget( udg_U, t, udg_n, true, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
        call DestroyEffect( AddSpecialEffectTarget("Abilities\\Spells\\Other\\CrushingWave\\CrushingWaveDamage.mdl", t, "chest") )
        if IsUnitType(t, UNIT_TYPE_HERO) == true then
            set udg_i=udg_i+3
        else
            set udg_i=udg_i+1
        endif
    endif
    set t=null
    return false
endfunction




function Trig_ChaoxiSpell_Conditions takes nothing returns boolean
    local unit u=GetTriggerUnit()
    local real x
    local real y
    local integer g=0
    local real da
    local real pia
    local unit m
    local integer level
    local integer l=0
    local integer n=GetConvertedPlayerId(GetTriggerPlayer())
    local boolexpr b
    local player p
    local integer ll=GetSpellAbilityId()
    local integer gsd=GetUnitAbilityLevel(u,'B01T')
    if  ll == 'A01K'  then
        set x=GetUnitX(u)
        set y=GetUnitY(u)
        if udg_Chaoxi[n]>30 then
            set level=3+gsd
        elseif udg_Chaoxi[n]>15 then
            set level=2+gsd
        else
            set level=1+gsd
        endif
        
        set p=getcorrectplayer(u)
        loop
            exitwhen g>12
            set da=30*g*3.1415926/180
            set m=CreateUnit(p,'u000',x,y,0)
            call UnitAddAbility(m,'A03E')
            call SetUnitAbilityLevel(m,'A03E',level)
            call UnitApplyTimedLife( m, 'BTLF', 0.50 )
            call IssuePointOrderById( m, 852555, x+(50*Cos(da)), y+(50*Sin(da)) )
            set g=g+1
        endloop
        
        set udg_Chaoxi[n]=udg_Chaoxi[n]-15*(level-1)
    elseif  ll == 'A02K' then
        if udg_Chaoxi[n]>20 then
            set level=3
        elseif udg_Chaoxi[n]>10 then
            set level=2
        else
            set level=1
        endif
        set m=CreateUnit(GetTriggerPlayer(),'u000',GetUnitX(u),GetUnitY(u),0)
        call UnitAddAbility(m,'A03F')
        call UnitApplyTimedLife( m, 'BTLF', 1.00 )
        set udg_U=u
        set udg_i=0
        set b=Condition(function xuanquchaoxi)
        set udg_n=100*level+GetHeroStr(u,true)*2
        set udg_P=GetOwningPlayer(u)
        call GroupEnumUnitsInRange(udg_NullGroup,GetUnitX(u),GetUnitY(u),500,b)
        call DestroyBoolExpr(b)
        call SetUnitState( u, UNIT_STATE_LIFE, GetUnitState(u, UNIT_STATE_LIFE)+GetHeroStr(u,true)+level*15*udg_i )
        set udg_Chaoxi[n]=udg_Chaoxi[n]-10*(level-1)
    elseif  ll == 'A03D' then
        set level=GetUnitAbilityLevel(u,'A03D')
        set udg_Chaoxi[n]=udg_Chaoxi[n]-5*(level-1)
        if udg_Chaoxi[n]>10 then
            call SetUnitAbilityLevel(u,'A03D',3)
        elseif udg_Chaoxi[n]>5 then
            call SetUnitAbilityLevel(u,'A03D',2)
        else
            call SetUnitAbilityLevel(u,'A03D',1)
        endif
    elseif ll=='AIh1' then
        call UnitResetCooldown(u)
    endif
    
    
    
    
    set p=null
    set m=null
    set u=null
    set b=null
    return false
endfunction



//===========================================================================
function InitTrig_ChaoxiSpell takes nothing returns nothing
    set gg_trg_ChaoxiSpell = CreateTrigger(  )
    call DisableTrigger( gg_trg_ChaoxiSpell )
    call TriggerAddCondition( gg_trg_ChaoxiSpell, Condition( function Trig_ChaoxiSpell_Conditions ) )
endfunction
