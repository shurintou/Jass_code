
//===========================================================================
// Trigger: LAS
//===========================================================================
function enemyangel takes nothing returns nothing
    local unit u=GetEnumUnit()
    local integer i=UnitCountBuffsEx(u, true, true, false, false, true, true, false)
    call UnitRemoveAbility( u, 'BHad' )
    call UnitRemoveAbility( u, 'BHab' )
    call UnitRemoveAbility( u, 'Bhea' )
    call UnitRemoveAbility( u, 'Binf' )
    call UnitRemoveAbility( u, 'Binv' )
    call UnitRemoveAbility( u, 'BOac' )
    call UnitRemoveAbility( u, 'BOvd' )
    call UnitRemoveAbility( u, 'BOac' )
    call UnitRemoveAbility( u, 'BOwk' )
    call UnitRemoveAbility( u, 'BOae' )
    call UnitRemoveAbility( u, 'Bblo' )
    call UnitRemoveAbility( u, 'Bakb' )
    call UnitRemoveAbility( u, 'Bspl' )
    call UnitRemoveAbility( u, 'Bblo' )
    call UnitRemoveAbility( u, 'BUav' )
    call UnitRemoveAbility( u, 'BUau' )
    call UnitRemoveAbility( u, 'BUfa' )
    call UnitRemoveAbility( u, 'Bams' )
    call UnitRemoveAbility( u, 'Bam2' )
    call UnitRemoveAbility( u, 'Brpb' )
    call UnitRemoveAbility( u, 'Brpl' )
    call UnitRemoveAbility( u, 'Brpm' )
    call UnitRemoveAbility( u, 'Buhf' )
    call UnitRemoveAbility( u, 'BEar' )
    call UnitRemoveAbility( u, 'Brej' )
    call UnitRemoveAbility( u, 'BEah' )
    call UnitRemoveAbility( u, 'Broa' )
    call UnitRemoveAbility( u, 'BIrg' )
    call UnitRemoveAbility( u, 'BIpv' )
    call UnitRemoveAbility( u, 'BNbr' )
    call UnitRemoveAbility( u, 'B005' )
    call UnitRemoveAbility( u, 'B01Y' )
    call UnitRemoveAbility( u, 'B00O' )
    call UnitRemoveAbility( u, 'B01E' )
    call UnitRemoveAbility( u, 'B00P' )
    call UnitRemoveAbility( u, 'B00K' )
    call UnitRemoveAbility( u, 'B01N' )
    call UnitRemoveAbility( u, 'B01K' )
    call UnitRemoveAbility( u, 'B00A' )
    call UnitRemoveAbility( u, 'B003' )
    call UnitRemoveAbility( u, 'B01J' )
    call UnitRemoveAbility( u, 'B010' )
    call UnitRemoveAbility( u, 'B01M' )
    call UnitRemoveAbility( u, 'B01A' )
    call UnitRemoveAbility( u, 'B002' )
    call UnitRemoveAbility( u, 'B01B' )
    call UnitRemoveAbility( u, 'B01D' )
    call UnitRemoveAbility( u, 'B011' )
    call UnitRemoveAbility( u, 'B01G' )
    call UnitRemoveAbility( u, 'B021' )
    call DestroyEffect( AddSpecialEffectTarget("war3mapImported\\LAdaEnemy.mdx", u, "origin") )
    set i=i-UnitCountBuffsEx(u, true, true, false, false, true, true, false)
    call UnitDamageTarget( udg_U, u, udg_n+(udg_Re*((20+i)/20)*GetUnitState(u, UNIT_STATE_LIFE)), true, true, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
    set u=null
endfunction

function allyangel takes nothing returns nothing
    local unit u=GetEnumUnit()
    local integer i=UnitCountBuffsEx(u, true, true, false, false, true, true, false)
    local real r=GetUnitState(u, UNIT_STATE_LIFE)
    call DestroyEffect( AddSpecialEffectTarget("war3mapImported\\LAdaAlly.mdx", u, "chest") )
    call Removedebuff(u)
    set i=i-UnitCountBuffsEx(u, true, true, false, false, true, true, false)
    call SetUnitState( u, UNIT_STATE_LIFE,r+(udg_Re*((20+i)/20)*(GetUnitState(u, UNIT_STATE_MAX_LIFE)-r)))
    set u=null
endfunction


function lightangleone takes nothing returns boolean
    local unit t=GetFilterUnit()
    if IsUnitType(t, UNIT_TYPE_STRUCTURE) == false and IsUnitEnemy(t, udg_P) == true and GetUnitAbilityLevel(t, 'Aloc') == 0 and GetUnitState(t, UNIT_STATE_LIFE)>0 and IsUnitType(t, UNIT_TYPE_MAGIC_IMMUNE) == false then
        call UnitDamageTarget( udg_U, t, 0.1*GetUnitState(t, UNIT_STATE_MAX_LIFE)+udg_Re, true, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
        call DestroyEffect( AddSpecialEffectTarget("war3mapImported\\LA2harmeff.mdx", t, "origin") )
    endif
    set t=null
    return false
endfunction

function lightangletwo takes nothing returns boolean
    local unit t=GetFilterUnit()
    if IsUnitType(t, UNIT_TYPE_STRUCTURE) == false and IsUnitEnemy(t, udg_P) == true and GetUnitAbilityLevel(t, 'Aloc') == 0 and GetUnitState(t, UNIT_STATE_LIFE)>0 and IsUnitType(t, UNIT_TYPE_MAGIC_IMMUNE) == false then
        call UnitDamageTarget( udg_U, t, udg_Re, true, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
        call DestroyEffect( AddSpecialEffectTarget("war3mapImported\\LA2harmeff.mdx", t, "origin") )
    endif
    set t=null
    return false
endfunction


function Trig_LAS_Conditions takes nothing returns boolean
    local integer i
    local unit u=GetTriggerUnit()
    local integer l=GetSpellAbilityId()
    local integer ev=GetHeroLevel(u)
    local boolexpr b
    local unit m
    local real x
    local real y
    local real ra
    local real rb
    local real r
    if  l == 'A08J'  then
        set udg_P=GetOwningPlayer(u)
        set udg_U=u
        set udg_Re=200+(10*ev)
        set x=GetSpellTargetX()
        set y=GetSpellTargetY()
        set b=Condition(function lightangleone)
        call GroupEnumUnitsInRange(udg_NullGroup,x,y,400,b)
        call DestroyBoolExpr(b)
        set m=CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE),'u00E',x,y,0)
        call UnitAddAbility(m,'A08G')
        call UnitApplyTimedLife( m, 'BTLF',5 )
    elseif l == 'A08K' then
        set i=GetConvertedPlayerId(GetTriggerPlayer())
        if i==1 then
            set i=5
        endif
        call UnitRemoveAbility(udg_SpellTarget[i],'A08M')
        call UnitRemoveAbility(udg_SpellTarget[i],'A08N')
        call UnitRemoveAbility(udg_SpellTarget[i],'A08I')
        set udg_SpellTarget[i]=GetSpellTargetUnit()
        call UnitAddAbility(udg_SpellTarget[i],'A08M')
        call UnitAddAbility(udg_SpellTarget[i],'A08N')
        call UnitAddAbility(udg_SpellTarget[i],'A08I')
        set ra=GetUnitState(u, UNIT_STATE_MAX_LIFE)
        set rb=GetUnitState(udg_SpellTarget[i], UNIT_STATE_MAX_LIFE)
        set x=GetUnitState(u, UNIT_STATE_LIFE)/ra
        set y=GetUnitState(udg_SpellTarget[i], UNIT_STATE_LIFE)/rb
        set ev=R2I((ev-5)/5)
        call SetUnitAbilityLevel(udg_SpellTarget[i],'A08M',ev)
        call SetUnitAbilityLevel(udg_SpellTarget[i],'A08I',ev)
        set r=0.1+(ev/200)
        call DestroyEffect( AddSpecialEffectTarget("war3mapImported\\LA2changehp.mdx", u, "chest") )
        call DestroyEffect( AddSpecialEffectTarget("war3mapImported\\LA2changehp.mdx", udg_SpellTarget[i], "chest") )
        if x>y then
            if y>r then
                call SetUnitState( u, UNIT_STATE_LIFE,y*ra)
                set r=y
            else
                call SetUnitState( u, UNIT_STATE_LIFE,r*ra)
            endif
            if x>r then
                call SetUnitState( udg_SpellTarget[i],UNIT_STATE_LIFE, x*rb)
            else
                call SetUnitState( udg_SpellTarget[i],UNIT_STATE_LIFE, r*rb)
            endif
        else
            if x<r then
                call SetUnitState( u, UNIT_STATE_LIFE,r*ra)
            endif
            if y<r then
                call SetUnitState( udg_SpellTarget[i], UNIT_STATE_LIFE,r*rb)
            endif
        endif
        set udg_P=GetOwningPlayer(u)
        set udg_U=u
        set udg_Re=(1-r)*(300+(50*ev))
        set b=Condition(function lightangletwo)
        call GroupEnumUnitsInRange(udg_NullGroup,GetUnitX(u),GetUnitY(u),(1-r)*600,b)
        call DestroyBoolExpr(b)
    elseif l == 'A08L' then
        call SetUnitAnimationByIndex( u, 76 )
        set i=GetUnitAbilityLevel(u,'B01T')
        set udg_U=u
        set udg_Re=0.2*(1+i)+(ev/150)
        set udg_n=100+(5*ev)+150*i
        if IsUnitAlly(u,Player(5))==true then
            call ForGroup(udg_BlueTeamHero,function allyangel)
            call ForGroup(udg_RedTeamHero,function enemyangel)
        else
            call ForGroup(udg_RedTeamHero,function allyangel)
            call ForGroup(udg_BlueTeamHero,function enemyangel)
        endif
    endif
    set m=null
    set b=null
    set u=null
    return false
endfunction


//===========================================================================
function InitTrig_LAS takes nothing returns nothing
    set gg_trg_LAS = CreateTrigger(  )
    call DisableTrigger( gg_trg_LAS )
    call TriggerAddCondition( gg_trg_LAS, Condition( function Trig_LAS_Conditions ) )
endfunction
