
//===========================================================================
// Trigger: lianjinyiliaobo
//===========================================================================
function water takes nothing returns boolean
    local unit t=GetFilterUnit()
    if IsUnitEnemy(t, udg_P) == true and GetUnitAbilityLevel(t,'Aloc')==0 and IsUnitType(t, UNIT_TYPE_MAGIC_IMMUNE) == false and IsUnitType(t, UNIT_TYPE_STRUCTURE) == false then
        call SetUnitX(t,udg_X+GetRandomReal(-50,50))
        call SetUnitY(t,udg_Y+GetRandomReal(-50,50))
        call UnitDamageTarget( udg_U, t, 200+5*GetHeroLevel(udg_U), true, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS )
    endif
    set t=null
    return false
endfunction

function moveinwater takes nothing returns nothing
    local timer tm=GetExpiredTimer()
    local integer n=GetHandleId(tm)
    local integer i=LoadInteger(udg_hash, n, 3)
    local unit u=LoadUnitHandle(udg_hash, n, 4)
    local boolexpr b
    local integer h
    
    
    if i>0 then
        set udg_U=u
        set udg_P=GetOwningPlayer(u)
        set udg_X=LoadReal(udg_hash, n, 1)
        set udg_Y=LoadReal(udg_hash, n, 2)
        set b=Condition(function water)
        call GroupEnumUnitsInRange(udg_NullGroup,udg_X,udg_Y,450,b)
        call DestroyEffect( AddSpecialEffect("Objects\\Spawnmodels\\Naga\\NagaDeath\\NagaDeath.mdl", udg_X, udg_Y) )
        call DestroyBoolExpr(b)
        call SaveInteger( udg_hash, n, 3, i-1 )
    else
        set h=5
        loop
            exitwhen h>17
            call RemoveUnit(LoadUnitHandle(udg_hash, n,h))
            set h=h+1
        endloop
        set h=GetConvertedPlayerId(GetOwningPlayer(u))
        call TerrainDeformStop(udg_T[h],1000)
        set udg_T[h]=null
        if udg_T[2]==null and udg_T[9]==null then
            call SetWaterDeforms( false )
        endif
        call SetPlayerAbilityAvailable( GetOwningPlayer(u), 'A027', true )
        call FlushChildHashtable( udg_hash, n )
        call DestroyTimer(tm)
        
    endif
    
    set u=null
    set tm=null
    set b=null
endfunction



function Trig_lianjinyiliaobo_Conditions takes nothing returns boolean
    local unit m
    local unit u
    local real x
    local real y
    local timer tm
    local integer n
    local integer i=0
    local player p
    local real da=0
    local integer l=GetSpellAbilityId()
    
    if  l == 'ANhs'  then
        set u=GetTriggerUnit()
        set m=CreateUnit(getcorrectplayer(u),'u000',GetUnitX(u),GetUnitY(u),0)
        call UnitAddAbility( m, 'A03C' )
        call UnitApplyTimedLife( m, 'BTLF', 10.00 )
        call SetUnitAbilityLevel(m,'A03C',R2I((GetHeroLevel(u)-5)/5))
        call IssuePointOrderById( m, 852664, GetSpellTargetX(), GetSpellTargetY() )
    elseif  l == 'A027'  then
        set u=GetTriggerUnit()
        set l=GetUnitAbilityLevel(u,'B01T')
        set tm=CreateTimer()
        set n=GetHandleId(tm)
        set p=getcorrectplayer(u)
        set x=GetSpellTargetX()
        set y=GetSpellTargetY()
        set udg_T[GetConvertedPlayerId(p)]=TerrainDeformCrater(x, y, 525, 500.00, 7000+(2000*l), false)
        set l=6+l
        loop
            exitwhen i>12
            set da=3.1415926*30*i/180
            set m=CreateUnit(p,'n000',x+(500*Cos(da)),y+(500*Sin(da)),30*i)
            call UnitApplyTimedLife( m, 'BTLF', l )
            set i=i+1
            call SaveUnitHandle(udg_hash,n,4+i,m)
        endloop
        call SetPlayerAbilityAvailable( GetTriggerPlayer(), 'A027', false )
        call SaveReal( udg_hash, n, 1, x )
        call SaveReal( udg_hash, n, 2, y )
        call SaveInteger( udg_hash, n, 3, l )
        call SaveUnitHandle(udg_hash,n,4,u)
        call TimerStart(tm,1,true,function moveinwater)
        call SetWaterDeforms( true )
    elseif l=='AIh1' then
        call UnitResetCooldown(GetTriggerUnit())
    endif
    
    
    set tm=null
    set p=null
    set u=null
    set m=null
    return false
endfunction

//===========================================================================
function InitTrig_lianjinyiliaobo takes nothing returns nothing
    set gg_trg_lianjinyiliaobo = CreateTrigger(  )
    call DisableTrigger(gg_trg_lianjinyiliaobo)
    call TriggerAddCondition( gg_trg_lianjinyiliaobo, Condition( function Trig_lianjinyiliaobo_Conditions ) )
endfunction
