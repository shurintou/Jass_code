
//===========================================================================
// Trigger: checkhpgroup
//
// call GroupAddUnit( udg_CheckHpGroup, gg_unit_Hamg_0140 )
//     call GroupAddUnit( udg_CheckHpGroup, gg_unit_Hamg_0141 )
//     call GroupAddUnit( udg_CheckHpGroup, gg_unit_Hamg_0143 )
//     call GroupAddUnit( udg_CheckHpGroup, gg_unit_Hamg_0142 )
//     call GroupAddUnit( udg_CheckHpGroup, gg_unit_Hamg_0130 )
// //U鬼
// call TriggerRegisterUnitEvent( gg_trg_ZheShe, gg_unit_Ewrd_0109, EVENT_UNIT_DAMAGED )
// call TriggerRegisterUnitEvent( gg_trg_HuangWu, gg_unit_Ewrd_0109, EVENT_UNIT_TARGET_IN_RANGE )
//===========================================================================
function Trig_checkhpgroup_Actions takes nothing returns nothing
local integer i=GetRandomInt(1,7)
local unit u

if GetEventPlayerChatString() == "-ch1" then
set u=CreateUnit(Player(1),'Efur',udg_ReviveX[i], udg_ReviveY[i],0)
else
set u=CreateUnit(Player(2),'Hamg',udg_ReviveX[i], udg_ReviveY[i],0)
call SetPlayerAllianceStateBJ( Player(0), Player(2), bj_ALLIANCE_ALLIED_VISION )
call SetPlayerAllianceStateBJ( Player(2), Player(0), bj_ALLIANCE_ALLIED_VISION )
call SetPlayerAlliance( Player(0), Player(2), ALLIANCE_SHARED_VISION, false )
call SetPlayerAlliance( Player(2), Player(0), ALLIANCE_SHARED_VISION, false )
call UnitShareVision( u, Player(0), false )
call UnitAddAbility( u, 'Agho' )
call BJDebugMsg( I2S(udg_PlayerScore[3]) )
endif
call UnitAddAbility(u,'ANss')
call GroupAddUnit( udg_CheckHpGroup,u)
call TriggerRegisterUnitEvent( gg_trg_BuyToRevive, u, EVENT_UNIT_HERO_REVIVE_FINISH )
call TriggerRegisterUnitEvent( gg_trg_HeroDead, u, EVENT_UNIT_DEATH )
call UnitAddItemToSlotById( u, 'wlsd', 4 )

set u=null
endfunction

//===========================================================================
function InitTrig_checkhpgroup takes nothing returns nothing
    set gg_trg_checkhpgroup = CreateTrigger(  )
    call TriggerAddAction( gg_trg_checkhpgroup, function Trig_checkhpgroup_Actions )
endfunction
