
//===========================================================================
// Trigger: darksummon
//===========================================================================
function summontothere takes nothing returns boolean
    local unit u=GetFilterUnit()
    if IsUnitType(u, UNIT_TYPE_STRUCTURE) == false and GetUnitAbilityLevel(u, 'Aloc') == 0 and GetUnitState(u, UNIT_STATE_LIFE)>0 and GetOwningPlayer(u) != Player(PLAYER_NEUTRAL_AGGRESSIVE) then
        call DestroyEffect( AddSpecialEffectTarget("Abilities\\Spells\\NightElf\\Blink\\BlinkTarget.mdl", u, "origin") )
        call SetUnitX(u,udg_X)
        call SetUnitY(u,udg_Y)
        call IssuePointOrderById( u, 851983, udg_X, udg_Y )
        call PauseUnit( u, false )
    endif
    set u=null
    return false
endfunction


function changeitem2 takes unit u,integer i returns nothing
    local item it=UnitItemInSlot(u, i)
    local integer g= GetItemUserData(it)
    local player p
    
    if i==0 then
        if GetItemTypeId(it)=='stwp' then
            call RemoveItem(it)
        endif
        set it = CreateItem('I000', 0, 0)
        call UnitAddItem( u, it )
        set it=null
        set p=null
        return
    endif
    
    
    call RemoveItem(it)
    set it = CreateItem(udg_Item[g], 0, 0)
    call UnitAddItem( u, it )
    call UnitDropItemSlot(u, it, i )
    
    
    
    set p=GetOwningPlayer(u)
    if udg_Item[g] == 'rat9' then
        set g=GetUnitTypeId(u)
        if g=='Hamg' or g=='Ofar' or g=='Ulic' or g=='Ekee' then
            call SetPlayerTechResearched(p, 'R00F', 1)
        elseif g=='Hblm' or g=='Oshd' or g=='Emoo' then
            call SetPlayerTechResearched(p, 'R00E', 1)
        else
            call SetPlayerTechResearched(p, 'R000', 1)
        endif
        
    elseif udg_Item[g]== 'rde4' then
        set g=GetUnitTypeId(u)
        if g=='Udea' or g=='Otch' or g=='Hpal' then
            call SetPlayerTechResearched(p, 'R001', 1)
        else
            if g=='Hmkg' or g=='Udre' then
                call SetPlayerTechResearched(p, 'R002', 1)
            else
                if g=='Ucrl' then
                    call SetPlayerTechResearched(p, 'R003', 1)
                else
                    call SetPlayerTechResearched(p, 'R004', 1)
                endif
            endif
        endif
        
    endif
    
    set p=null
    set it=null
endfunction



function additemallhero takes nothing returns nothing
    local unit u=GetEnumUnit()
    call SetHeroLevel( u, 30, true )
    call changeitem2(u,0)
    call changeitem2(u,1)
    call changeitem2(u,2)
    call changeitem2(u,3)
    call changeitem2(u,4)
    call changeitem2(u,5)
    set u=null
endfunction

function Trig_darksummon_Conditions takes nothing returns boolean
    local unit u=GetTriggerUnit()
    local boolexpr b
    local integer i=GetSpellAbilityId()
    if  i == 'A02J'  then
        set b=Condition(function summontothere)
        set udg_X=GetUnitX(u)
        set udg_Y=GetUnitY(u)
        call GroupEnumUnitsInRange(udg_NullGroup,GetSpellTargetX(),GetSpellTargetY(),700,b)
        call DestroyBoolExpr(b)
    elseif  i == 'A09C'  then
        call ForGroup( udg_HeroGroup, function additemallhero)
        call UnitRemoveAbility(GetTriggerUnit(),'A09C')
    elseif  i == 'A0AG'  then
        set udg_ActionScale=udg_ActionScale + 0.1
        call SetUnitScale( u,udg_ActionScale, udg_ActionScale, udg_ActionScale )
        call BJDebugMsg( "set scale to: " + R2S(udg_ActionScale))
        
    elseif  i == 'A0AH'  then
        set udg_ActionScale=udg_ActionScale - 0.1
        call SetUnitScale( u,udg_ActionScale, udg_ActionScale, udg_ActionScale )
        call BJDebugMsg( "set scale to: " + R2S(udg_ActionScale))
        
    endif
    set u=null
    set b=null
    return false
endfunction



//===========================================================================
function InitTrig_darksummon takes nothing returns nothing
    set gg_trg_darksummon = CreateTrigger(  )
    call DisableTrigger( gg_trg_darksummon)
    call TriggerAddCondition( gg_trg_darksummon, Condition( function Trig_darksummon_Conditions ) )
    
endfunction
