
//===========================================================================
// Trigger: DropItem
//
// ACnrif i=='desc' then//跳刀
// call PauseTimer(LoadTimerHandle(udg_Hash2,GetHandleId(u),9999))
// else
//===========================================================================
function Trig_DropItem_Actions takes nothing returns nothing
    local unit u=GetManipulatingUnit()
    local item t=GetManipulatedItem()
    local integer i=GetItemTypeId(t)
    local player p=GetOwningPlayer(u)
    

if i=='thdm' then//龙心
   if ciwh(u,'thdm')==1 then
   call UnitRemoveAbility(u,'ACnr')
   endif
else
if i=='ssil' then//宝剑
   if ciwh(u,'ssil')==1 then
   call UnitRemoveAbility(u,'A0DJ')
   endif
else
if i=='tmsc' then//科技枪
   if ciwh(u,'tmsc')==1 then
   call UnitRemoveAbility(u,'A0DW')
   call UnitRemoveAbility(u,'B04I')
   call UnitRemoveAbility(u,'A0E8')
   endif
else
endif
endif
endif


set u=null
set t=null
set p=null
endfunction

//===========================================================================
function InitTrig_DropItem takes nothing returns nothing
    set gg_trg_DropItem = CreateTrigger(  )
    call TriggerAddAction( gg_trg_DropItem, function Trig_DropItem_Actions )
endfunction
