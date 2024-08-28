
//===========================================================================
// Trigger: ChooseHero
//
// call UnitShareVision( gg_unit_harm_0113, p, true )
//===========================================================================
function Trig_ChooseHero_Conditions takes nothing returns boolean
    return GetOwningPlayer(GetTriggerUnit()) == GetTriggerPlayer() 
endfunction

function Trig_ChooseHero_Actions takes nothing returns nothing
local player p=GetTriggerPlayer()
local unit u=GetTriggerUnit()
call IssueNeutralTargetOrderById(p, gg_unit_nmer_0003, 852566, u )
call IssueNeutralTargetOrderById(p, gg_unit_nmr5_0105, 852566, u )
call IssueNeutralTargetOrderById(p, gg_unit_nmr2_0021, 852566, u )
call IssueNeutralTargetOrderById(p, gg_unit_nmr6_0106, 852566, u )
call IssueNeutralTargetOrderById(p, gg_unit_nmr3_0090, 852566, u )
call IssueNeutralTargetOrderById(p, gg_unit_nmr7_0107, 852566, u )
call IssueNeutralTargetOrderById(p, gg_unit_utom_0132, 852566, u )
call IssueNeutralTargetOrderById(p, gg_unit_ovln_0129, 852566, u )
call IssueNeutralTargetOrderById(p, gg_unit_ngme_0005, 852566, u )
call IssueNeutralTargetOrderById(p, gg_unit_eden_0131, 852566, u )
call IssueNeutralTargetOrderById(p, gg_unit_ngad_0133, 852566, u )
call IssueNeutralTargetOrderById(p, gg_unit_nmrd_0136, 852566, u )
call IssueNeutralTargetOrderById(p, gg_unit_nmr4_0135, 852566, u )
call IssueNeutralTargetOrderById(p, gg_unit_hvlt_0020, 852566, u )
call IssueNeutralTargetOrderById(p, gg_unit_nmr0_0138, 852566, u )
call IssueNeutralTargetOrderById(p, gg_unit_nmrf_0134, 852566, u )
call IssueNeutralTargetOrderById(p, gg_unit_harm_0113, 852566, u )
call IssueNeutralTargetOrderById(p, gg_unit_hars_0137, 852566, u )
call IssueNeutralTargetOrderById(p, gg_unit_edob_0140, 852566, u )
call IssueNeutralTargetOrderById(p, gg_unit_npgr_0141, 852566, u )
set p=null
set u=null
endfunction

//===========================================================================
function InitTrig_ChooseHero takes nothing returns nothing
    set gg_trg_ChooseHero = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_ChooseHero, Condition( function Trig_ChooseHero_Conditions ) )
    call TriggerAddAction( gg_trg_ChooseHero, function Trig_ChooseHero_Actions )
endfunction
