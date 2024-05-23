
//===========================================================================
// Trigger: UGDA
//===========================================================================
function youguihuanxiangattack takes nothing returns nothing
    local unit t=GetEnumUnit()
    local unit m
    local integer i=udg_n
    local integer i5 = GetItemTypeId(UnitItemInSlot(udg_UG, 5))
    local integer i4 = GetItemTypeId(UnitItemInSlot(udg_UG, 4))
    
    if GetUnitState(t, UNIT_STATE_LIFE)>0 then
        set m=CreateUnit(udg_P,'u003',GetUnitX(t),GetUnitY(t),GetRandomReal(0,360))
        call UnitApplyTimedLife( m, 'BTLF', udg_Re )
        call SetUnitPathing( m, false )
        call SetUnitColor( m, ConvertPlayerColor(12) )
        if  i5!= 'clfm' and i5!= 'I004' then
            call UnitRemoveAbility(m,'A00R')
        endif
        if i4!='oli2' then
            call UnitRemoveAbility(m,'A006')
        endif
        
        set i=(i-5)/5
        call SetUnitAbilityLevel(m,'A04V',i)
        call SetUnitAbilityLevel(m,'A04W',i)
        call SetUnitAbilityLevel(m,'A04A',i)
        call IssueTargetOrderById( m, 851983, t )
    endif
    set t=null
    set m=null
endfunction



function Trig_UGDA_Conditions takes nothing returns boolean
    local unit u=GetTriggerUnit()
    local unit m
    local integer i=GetHeroLevel(u)
    local unit t
    local integer l=GetSpellAbilityId()
    local integer i5 = 0
    local integer i4 = 0
    
    
    if l == 'A01O' then
        call PlaySoundBJ( gg_snd_SacrificeUnit )
        set udg_P=getcorrectplayer(u)
        set udg_UG=u
        set udg_Re=6.00+(i/10)+(3*GetUnitAbilityLevel(u,'B01T'))
        set udg_n=GetHeroLevel(udg_UG)
        if IsUnitAlly(u,Player(5))==true then
            call ForGroup(udg_RedTeamHero,function youguihuanxiangattack)
        else
            call ForGroup(udg_BlueTeamHero,function youguihuanxiangattack)
        endif
    elseif l == 'A01M' then
        set i5 = GetItemTypeId(UnitItemInSlot(u, 5))
        set i4 = GetItemTypeId(UnitItemInSlot(u, 4))
        set t=GetSpellTargetUnit()
        if CheckLinken(t)==true then
            set m=CreateUnit(getcorrectplayer(u),'u003',GetUnitX(t),GetUnitY(t),GetRandomReal(0,360))
            call UnitApplyTimedLife( m, 'BTLF', 6.00+i/10 )
            call SetUnitPathing( m, false )
            if  i5!= 'clfm' and i5!= 'I004' then
                call UnitRemoveAbility(m,'A00R')
            endif
            if i4!='oli2' then
                call UnitRemoveAbility(m,'A006')
            endif
            
            set i=(i-5)/5
            call SetUnitColor( m, ConvertPlayerColor(12) )
            call SetUnitAbilityLevel(m,'A04V',i)
            call SetUnitAbilityLevel(m,'A04W',i)
            call SetUnitAbilityLevel(m,'A04A',i)
            call IssueTargetOrderById( m, 851983, t )
        endif
    endif
    
    
    
    set u=null
    set t=null
    set m=null
    return false
endfunction



//===========================================================================
function InitTrig_UGDA takes nothing returns nothing
    set gg_trg_UGDA = CreateTrigger(  )
    call DisableTrigger( gg_trg_UGDA)
    call TriggerAddCondition( gg_trg_UGDA, Condition( function Trig_UGDA_Conditions ) )
    
endfunction
