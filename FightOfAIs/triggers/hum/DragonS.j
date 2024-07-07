
//===========================================================================
// Trigger: DragonS
//===========================================================================
function  longqishitiaojian takes nothing returns boolean
    local unit t=GetFilterUnit()
    local unit m
    if IsUnitType(t, UNIT_TYPE_STRUCTURE) == false and IsUnitEnemy(t, udg_P) == true and GetUnitAbilityLevel(t, 'Aloc') == 0 and GetUnitState(t, UNIT_STATE_LIFE)>0 then
        call UnitDamageTarget( udg_U, t, udg_n, true, false,  ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
        set m=CreateUnit(udg_P,udg_i,GetUnitX(t),GetUnitY(t),0)
        call IssueTargetOrderById( m, 851983, t)
        call UnitApplyTimedLife( m, 'BTLF', 1.50 )
    endif
    set t=null
    set m=null
    return false
endfunction

function Trig_DragonS_Conditions takes nothing returns boolean
    local unit u
    local boolexpr b
    local real da
    local real pia
    local integer o
    local real x
    local real y
    if  GetSpellAbilityId() == 'A03L'  then
        set u=GetTriggerUnit()
        set pia=3.1415926
        set udg_P=getcorrectplayer(u)
        set udg_U=u
        if GetUnitAbilityLevel(u,'Afrb')==1 then
            set udg_i='o004'
            set udg_n=250+15*GetHeroLevel(u)
        else
            set udg_i='o003'
            set udg_n=150+15*GetHeroLevel(u)
        endif
        set b=Condition(function  longqishitiaojian)
        call GroupEnumUnitsInRange(udg_NullGroup,GetUnitX(u),GetUnitY(u),500,b)
        call DestroyBoolExpr(b)
        set o=0
        set x=GetUnitX(u)
        set y=GetUnitY(u)
        loop
            exitwhen o>12
            set da=pia*30*o/180
            call DestroyEffect( AddSpecialEffect("Abilities\\Spells\\Undead\\FrostNova\\FrostNovaTarget.mdl", x+(250*Cos(da)),y+(250*Sin(da))) )
            set o=o+1
        endloop
    endif
    set u=null
    set b=null
    return false
endfunction



//===========================================================================
function InitTrig_DragonS takes nothing returns nothing
    set gg_trg_DragonS = CreateTrigger(  )
    call DisableTrigger( gg_trg_DragonS )
    call TriggerAddCondition( gg_trg_DragonS, Condition( function Trig_DragonS_Conditions ) )
endfunction
