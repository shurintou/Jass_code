
//===========================================================================
// Trigger: deathcamera
//===========================================================================
function  heroselection takes nothing returns boolean
    local unit t
    if udg_i==0 then
        
        set t=GetFilterUnit()
        if IsUnitType(t, UNIT_TYPE_HERO) == true and GetUnitState(t, UNIT_STATE_LIFE)>0 and GetUnitTypeId(t) != udg_Observer then
            set udg_i=1
            set udg_CameraUnit=t
            call SelectUnitForPlayerSingle( t, Player(0) )
        endif
        
    endif
    set t=null
    return false
endfunction

function SelectNewHeroForPlayer takes real x,real y returns nothing
    local boolexpr b
    set udg_i=0
    set b=Condition(function heroselection)
    call GroupEnumUnitsInRange(udg_NullGroup,x,y,2500,b)
    call DestroyBoolExpr(b)
    set b=null
endfunction

function caculatedistanceofhero takes nothing returns nothing
    local unit t=GetEnumUnit()
    local real x
    local real y
    local real r
    
    if GetUnitState(t, UNIT_STATE_LIFE)>0 and IsUnitVisible(t, Player(0)) == true then
        set x=GetUnitX(t)-udg_X
        set y=GetUnitY(t)-udg_Y
        set r=SquareRoot(x*x+y*y)
        if r<udg_Re then
            set udg_Re=r
            set udg_CameraUnit=t
        endif
    endif
    
    set t=null
endfunction


function Trig_deathcamera_Conditions takes nothing returns boolean
    local unit u=GetTriggerUnit()
    local integer i
    local integer g
    local player p=GetTriggerPlayer()
    local integer e
    local integer n=GetConvertedPlayerId(p)
    local real x=GetUnitX(u)
    local real y=GetUnitY(u)
    local unit m
    local unit k=GetKillingUnit()
    local player kp=GetOwningPlayer(k)
    local integer kn =GetConvertedPlayerId(kp)
    
    if udg_ExtraHero[n]!= u then
        if GetUnitState(udg_ComHero[(  3 * n ) - 2 ], UNIT_STATE_LIFE) > 0 then
            set udg_LiveComHero[n]=udg_ComHero[(  3 * n ) - 2 ]
        elseif GetUnitState(udg_ComHero[(  3 * n ) - 1 ], UNIT_STATE_LIFE) > 0 then
            set m=udg_ComHero[(  3 * n ) - 2]
            set udg_ComHero[(  3 * n ) - 2]=udg_ComHero[(  3 * n ) - 1 ]
            set udg_ComHero[(  3 * n ) - 1 ]=m
            set udg_LiveComHero[n]=udg_ComHero[(  3 * n ) - 1 ]
        elseif GetUnitState(udg_ComHero[(  3 * n ) ], UNIT_STATE_LIFE) > 0 then
            set m=udg_ComHero[(  3 * n ) - 2]
            set udg_ComHero[(  3 * n ) - 2]=udg_ComHero[(  3 * n ) ]
            set udg_ComHero[(  3 * n )  ]=m
            set udg_LiveComHero[n]=udg_ComHero[(  3 * n )]
        endif
        
    endif
    call PauseUnit( u, false )
    call UnitRemoveAbility( u, 'A08R' )
    call SetUnitTimeScale( u, 1.00 )
    if  udg_CameraUnit ==u then
        call ResetToGameCameraForPlayer( Player(0), 0 )
        call SetCameraFieldForPlayer( Player(0), CAMERA_FIELD_TARGET_DISTANCE, udg_Cameraheigh, 0.00 )
        set udg_X= GetUnitX(u)
        set udg_Y= GetUnitY(u)
        set udg_CameraUnit=null
        set udg_Re=99999
        call ForGroup(udg_HeroGroup, function caculatedistanceofhero)
        call SelectUnitForPlayerSingle( udg_CameraUnit, Player(0) )
    endif
    
    if p==Player(0) then
        call ReviveHero( u, -500, 150, true )
        call SetUnitState( u, UNIT_STATE_MANA,GetUnitState(u, UNIT_STATE_MAX_MANA))
    else
        if  udg_ExtraHero[n]==u then
            
            set udg_DeathTimer[n]=R2I(GetHeroLevel(u)/3)
            
        endif
    endif
    
    if IsUnitAlly(u,Player(5))==true then
        set i=udg_RacePlayerNum[4]//udead
        set e=udg_RacePlayerNum[2]//human
    else
        call SetUnitX(udg_Gold,GetUnitX(u))
        call SetUnitY(udg_Gold,GetUnitY(u))
        call UnitAddItemToSlotById( udg_Gold, 'gold', 1 )
        set i=udg_RacePlayerNum[3]//udead
        set e=udg_RacePlayerNum[1]//human
    endif
    if udg_Silinglong[i]!=null and GetUnitState(udg_Silinglong[i], UNIT_STATE_LIFE)>0  then
        call SetUnitState( udg_Silinglong[i], UNIT_STATE_LIFE,GetUnitState(udg_Silinglong[i], UNIT_STATE_LIFE)+0.1*GetUnitState(u, UNIT_STATE_MAX_LIFE) )
        call DestroyEffect( AddSpecialEffectTarget("Abilities\\Spells\\Orc\\HealingWave\\HealingWaveTarget.mdl", udg_Silinglong[i], "chest") )
        call UnitAddAbility( udg_Silinglong[i], 'A04D' )
        call SetUnitAbilityLevel( udg_Silinglong[i], 'A04D', 2 )
        call UnitRemoveAbility( udg_Silinglong[i], 'A04D' )
    endif
    if udg_Silinglong[e]!=null and GetUnitState(udg_Silinglong[e], UNIT_STATE_LIFE)>0  then
        call SetUnitState( udg_Silinglong[e], UNIT_STATE_MANA,GetUnitState(udg_Silinglong[e], UNIT_STATE_LIFE)+0.1*GetUnitState(u, UNIT_STATE_MAX_MANA) )
        call DestroyEffect( AddSpecialEffectTarget("Abilities\\Spells\\Items\\TomeOfRetraining\\TomeOfRetrainingCaster.mdl", udg_Silinglong[e], "origin") )
        call UnitAddAbility( udg_Silinglong[e], 'A05I' )
        call SetUnitAbilityLevel( udg_Silinglong[e], 'A05I', 2 )
        call UnitRemoveAbility( udg_Silinglong[e], 'A05I' )
    endif
    
    set e=GetHeroLevel(u)
    set g=GetUnitTypeId(k)
    
    if  g == 'Hvwd' then
        call SetHeroInt( k, GetHeroInt(k,false)+(3+GetUnitAbilityLevel(k,'B01T')), true )
        call DestroyEffect( AddSpecialEffectTarget("Abilities\\Spells\\Items\\AIim\\AIimTarget.mdl", k, "origin") )
        
    elseif  g == 'H001' then
        call UnitResetCooldown( k )
        if GetUnitAbilityLevel(k,'B01T') >0 then
            call SetUnitState( k, UNIT_STATE_MANA,GetUnitState(k, UNIT_STATE_MAX_MANA))
        endif
        call DestroyEffect( AddSpecialEffectTarget("Abilities\\Spells\\Items\\AIsm\\AIsmTarget.mdl", k, "origin") )
        
    elseif  g=='Uktl' then
        set  udg_Chaoxi[kn]   =udg_Chaoxi[kn]+1
        if GetUnitAbilityLevel(k,'BNdo')==0 then
            call UnitAddItemToSlotById( k, 'tdx2', 0 )
            call DestroyEffect( AddSpecialEffectTarget("war3mapImported\\Ghost Strike.mdx", k, "origin") )
            call DestroyEffect( AddSpecialEffect("war3mapImported\\Channeling.mdx", x,y) )
        endif
        
    elseif  g=='H007' then
        call DestroyEffect( AddSpecialEffectTarget("war3mapImported\\TThuixue.mdx", k, "origin") )
        call SetUnitState( k, UNIT_STATE_LIFE,(0.8*GetUnitState(k, UNIT_STATE_LIFE))+(0.2*GetUnitState(k, UNIT_STATE_MAX_LIFE)) )
        
    elseif  g=='H00D' then
        if IsUnitType(u, UNIT_TYPE_MELEE_ATTACKER) then
            if GetUnitAbilityLevel(k, 'A0A9')<2 then
                call SetUnitAbilityLevel(k,'A0A9',GetUnitAbilityLevel(k, 'A0A9')+1)
            else
                call SetUnitAbilityLevel(k,'A0A9',3)
                call SetPlayerTechResearchedSwap( 'R00C', 1, kp )
                call DestroyEffect( AddSpecialEffect("war3mapImported\\Flamestrike I.mdx", GetUnitX(k), GetUnitY(k)) )
            endif
        else
            if GetUnitAbilityLevel(k, 'A0AA')<2 then
                call SetUnitAbilityLevel(k,'A0AA',GetUnitAbilityLevel(k, 'A0AA')+1)
            else
                call SetUnitAbilityLevel(k,'A0AA',3)
                call SetPlayerTechResearchedSwap( 'R00D', 1, kp )
                call DestroyEffect( AddSpecialEffect("war3mapImported\\Flamestrike Mystic I.mdx", GetUnitX(k), GetUnitY(k)) )
            endif
        endif
        
    elseif  g=='H00B' and udg_Chaoxi[kn]<20 then
        if IsUnitType(u, UNIT_TYPE_MELEE_ATTACKER)  then
            set udg_Chaoxi[kn]  = udg_Chaoxi[kn] + 1
            
        endif
    elseif  g=='H00C' and udg_Chaoxi[kn]<20 then
        if IsUnitType(u, UNIT_TYPE_RANGED_ATTACKER) then
            set udg_Chaoxi[kn]  = udg_Chaoxi[kn] + 1
        endif
    endif
    
    call SetPlayerState(kp, PLAYER_STATE_RESOURCE_GOLD, GetPlayerState(kp, PLAYER_STATE_RESOURCE_GOLD)+200+(10*e) )
    call SetUnitFlyHeight( k, GetUnitDefaultFlyHeight(k), 9999.00 )
    set p=null
    set u=null
    set m=null
    set k=null
    set kp=null
    return false
endfunction



//===========================================================================
function InitTrig_deathcamera takes nothing returns nothing
    set gg_trg_deathcamera = CreateTrigger(  )
    call DisableTrigger( gg_trg_deathcamera )
    call TriggerAddCondition( gg_trg_deathcamera, Condition( function Trig_deathcamera_Conditions ) )
endfunction
