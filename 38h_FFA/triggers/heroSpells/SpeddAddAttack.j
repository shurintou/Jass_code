
//===========================================================================
// Trigger: SpeddAddAttack
//===========================================================================
function Trig_SpeddAddAttack_Conditions takes nothing returns boolean
    return GetUnitAbilityLevel(GetEventTargetUnit(), 'B005') >0 
endfunction

function Trig_SpeddAddAttack_Actions takes nothing returns nothing
local unit u=GetTriggerUnit()
local unit m=GetEventTargetUnit()
local real su=GetUnitMoveSpeed(u)
local real sm=GetUnitMoveSpeed(m)
local real ds=su-sm
local real hr=0.3*ds

if ds >0 then
call DestroyEffect( AddSpecialEffectTarget("Abilities\\Spells\\NightElf\\ThornsAura\\ThornsAuraDamage.mdl", m, "chest") )
call UnitDamageTarget( u, m, hr, true, false, ATTACK_TYPE_HERO, DAMAGE_TYPE_UNKNOWN, WEAPON_TYPE_WHOKNOWS )
call CreateTextTagUnitBJ( I2S(R2I(hr)), m, 0, 11.00, 20, 90, 70, 0 )
call SetTextTagVelocityBJ( GetLastCreatedTextTag(), 64, 90 )
call SetTextTagPermanent( GetLastCreatedTextTag(), false )
call SetTextTagLifespan( GetLastCreatedTextTag(), 3.00 )
call SetTextTagFadepoint( GetLastCreatedTextTag(), 2.60 )


endif

set u=null
set m=null
endfunction

//===========================================================================
function InitTrig_SpeddAddAttack takes nothing returns nothing
    set gg_trg_SpeddAddAttack = CreateTrigger(  )
    call TriggerAddCondition( gg_trg_SpeddAddAttack, Condition( function Trig_SpeddAddAttack_Conditions ) )
    call TriggerAddAction( gg_trg_SpeddAddAttack, function Trig_SpeddAddAttack_Actions )
endfunction
