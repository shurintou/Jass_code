
//===========================================================================
// Trigger: FireQueen
//===========================================================================
function firequeen3 takes nothing returns nothing
    local timer tm=GetExpiredTimer()
    local integer i=GetHandleId(tm)
    local integer n=LoadInteger(udg_hash,i,4)
    local unit u
    local unit t=LoadUnitHandle(udg_hash,i,2)
    local real x
    local real y
    
    set u=LoadUnitHandle(udg_hash,i,1)
    set x=GetUnitX(t)
    set y=GetUnitY(t)
    call SetUnitX(u,x)
    call SetUnitY(u,y)
    call IssuePointOrderById( u, 852560, x,y )
    call DestroyEffect( AddSpecialEffect("Objects\\Spawnmodels\\Other\\NeutralBuildingExplosion\\NeutralBuildingExplosion.mdl", x, y) )
    call DestroyEffect( AddSpecialEffect("war3mapImported\\519.mdx", x, y) )
    
    if n>0 then
        call SaveInteger(udg_hash,i,4,n-1)
    else
        call RemoveUnit(t)
        call FlushChildHashtable( udg_hash, i )
        call DestroyTimer(tm)
    endif
    set t=null
    set tm=null
    set u=null
endfunction

function Trig_FireQueen_Conditions takes nothing returns boolean
    local integer i=GetSpellAbilityId()
    local unit u=GetTriggerUnit()
    local real x
    local real y
    local unit m
    local timer tm
    local unit t
    local integer n
    local real fa
    local real f
    if IsUnitAlly(u,Player(5))==true then
        set n=udg_RacePlayerNum[3]
    else
        set n=udg_RacePlayerNum[4]
    endif
    
    if  i == 'A04G' then
        set tm=CreateTimer()
        set i=GetHandleId(tm)
        set  fa=GetUnitFacing(u)
        set  f=Deg2Rad(fa)
        set  x=GetUnitX(u)
        set  y=GetUnitY(u)
        set m=CreateUnit(getcorrectplayer(u),'udes',x,y,fa)
        call SetUnitAbilityLevel(udg_SpellTarget[n],'A04Q',R2I((GetHeroLevel(u)-3)/7))
        call IssuePointOrderById( m, 851986, x+2400*Cos(f), y+2400*Sin(f) )
        call SaveUnitHandle(udg_hash,i,1,udg_SpellTarget[n])
        call SaveUnitHandle(udg_hash,i,2,m)
        call SaveInteger(udg_hash,i,4,10)
        call TimerStart(tm,0.5,true,function firequeen3 )
    elseif i=='A01H' or i=='A04N' then
        call SetUnitAbilityLevel(u,'A04N',R2I((GetHeroLevel(u)-2)/8))
    endif
    call UnitAddAbility(u,'S001')
    call UnitRemoveAbility(u,'S001')
    
    set t=null
    set u=null
    set m=null
    set tm=null
    
    return false
endfunction



//===========================================================================
function InitTrig_FireQueen takes nothing returns nothing
    set gg_trg_FireQueen = CreateTrigger(  )
    call DisableTrigger( gg_trg_FireQueen )
    call TriggerAddCondition( gg_trg_FireQueen, Condition( function Trig_FireQueen_Conditions ) )
endfunction
