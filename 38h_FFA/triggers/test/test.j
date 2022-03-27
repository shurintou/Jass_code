
//===========================================================================
// Trigger: test
//
// 小精灵买了以后死亡
// 玩家1和玩家3联盟关系要取消
// 这个触发要关掉
// 玩家的金钱要搞成600
// 正式开始时只需用触发删掉刘弟就行
//     
// //call ForceAddPlayer( udg_OnlinePlayer,Player(1))//要删
// //set udg_PlayerLockToHero[2] = gg_unit_Hamg_0130//要删
// call TriggerRegisterUnitEvent( gg_trg_HeroDead, gg_unit_Hamg_0130, EVENT_UNIT_DEATH )//要删
// call TriggerRegisterUnitEvent( gg_trg_attacked, gg_unit_Ewrd_0109, EVENT_UNIT_ATTACKED )
//  call AddGetHarmTrigger(gg_unit_Hamg_0130)
//===========================================================================
function Trig_test_Actions takes nothing returns nothing
    call SetUnitInvulnerable( gg_unit_Hamg_0130, false )
    call SetUnitInvulnerable( gg_unit_Ewrd_0109, false )
    call ShowUnit( gg_unit_Hamg_0130, true )
    call ShowUnit( gg_unit_Ewrd_0109, true )
    call SetUnitOwner( gg_unit_Hamg_0130, Player(1), true )
    call SetUnitOwner( gg_unit_Ewrd_0109, Player(1), true )
    call UnitAddItemByIdSwapped( 'I001', gg_unit_Hamg_0130 )
    call UnitAddItemByIdSwapped( 'clfm', gg_unit_Ewrd_0109 )
    set udg_Test = true
    call EnableTrigger( gg_trg_CreateItem )
    call multiboradact()
    call DisplayTimedTextToPlayer( Player(0), 0, 0, 180.00, "TRIGSTR_828" )
    call TriggerRegisterPlayerChatEvent( gg_trg_NoCD, Player(0), "-cd", true )
    call TriggerRegisterPlayerChatEvent( gg_trg_checkhpgroup, Player(0), "-ch", false )
    call TriggerRegisterPlayerChatEvent( gg_trg_view, Player(0), "-view", false )
    call TriggerRegisterPlayerChatEvent( gg_trg_kill, Player(0), "-kill", false )
    call TriggerRegisterPlayerChatEvent( gg_trg_level, Player(0), "-level", true )
    call TriggerRegisterPlayerChatEvent( gg_trg_wtf, Player(0), "-wtf", true )
    call ForceAddPlayer( udg_OnlinePlayer, Player(1) )
    call GroupAddUnit( udg_CheckHpGroup, gg_unit_Hamg_0130 )
    call GroupAddUnit( udg_CheckHpGroup, gg_unit_Ewrd_0109 )
    call SetPlayerMaxHeroesAllowed( -1, Player(0) )
    call SetPlayerStateBJ( Player(0), PLAYER_STATE_RESOURCE_GOLD, 99999 )
    call SetPlayerStateBJ( Player(0), PLAYER_STATE_RESOURCE_LUMBER, 99999 )
    set udg_PlayerLockToHero[2] = gg_unit_Hamg_0130
    call EnableTrigger( gg_trg_Uplevel )
    call AddGetHarmTrigger(gg_unit_Hamg_0130)
    call AddGetHarmTrigger(gg_unit_Ewrd_0109)
    call TriggerRegisterUnitEvent( gg_trg_HeroDead, gg_unit_Hamg_0130, EVENT_UNIT_DEATH )
    call TriggerRegisterUnitEvent( gg_trg_BuyToRevive, gg_unit_Hamg_0130, EVENT_UNIT_HERO_REVIVE_FINISH )
    call TriggerRegisterUnitEvent( gg_trg_attacked, gg_unit_Ewrd_0109, EVENT_UNIT_ATTACKED )
    call TriggerRegisterUnitEvent( gg_trg_attacked, gg_unit_Hamg_0130, EVENT_UNIT_ATTACKED )
    call TriggerRegisterUnitEvent( gg_trg_HeroDead, gg_unit_Ewrd_0109, EVENT_UNIT_DEATH )
    call TriggerRegisterUnitEvent( gg_trg_BuyToRevive, gg_unit_Ewrd_0109, EVENT_UNIT_HERO_REVIVE_FINISH )
    call TriggerRegisterUnitEvent( gg_trg_ZheShe, gg_unit_Ewrd_0109, EVENT_UNIT_DAMAGED )
    call TriggerRegisterUnitEvent( gg_trg_HuangWu, gg_unit_Ewrd_0109, EVENT_UNIT_TARGET_IN_RANGE )
    call UnitAddAbility(gg_unit_Ewrd_0109,'AEah')
    call SetUnitAbilityLevel(gg_unit_Ewrd_0109,'AEah',4)
    call TriggerRegisterUnitEvent( gg_trg_attacked, gg_unit_Ewrd_0109, EVENT_UNIT_ATTACKED )
    call SetUnitMoveSpeed( gg_unit_Ewrd_0109, 5.00 )
    call DestroyTrigger( GetTriggeringTrigger() )
endfunction

//===========================================================================
function InitTrig_test takes nothing returns nothing
    set gg_trg_test = CreateTrigger(  )
    call TriggerRegisterPlayerChatEvent( gg_trg_test, Player(0), "-test", true )
    call TriggerAddAction( gg_trg_test, function Trig_test_Actions )
endfunction
