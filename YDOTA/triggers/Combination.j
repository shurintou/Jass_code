
//===========================================================================
// Trigger: Combination
//
// 在InitRecipe函数中定义合成公式，直接复制触发就能使用
// 合成公式以如下方式添加：
// //魔力之源=索比面具*2+合成卷轴
// call NewRecipe('I058','I01Z',0,0,0,0,0)               //'I01Z'是商店显示的卷轴，物品图标显示为合成对象；                                                             //'I058'是实际使用的卷轴，物品图标显示为卷轴； 
//     
// call NewRecipe('I048','I058','I00T','I00T',0,0,0)     //'I00T':索比面具  'I058':合成卷轴  'I048':魔力之源
// 全局变量列表：
// udg_CombineItem[]   合成用到的临时物品变量数组
// udg_GC              游戏缓存
// udg_RecipeCount     合成公式数量计数
// udg_RecipeItemId[]  合成公式所对应的物品： 公式ID*10 + i（0<i<5:分别对应6个合成部件，i=9:合成对象）
// 游戏缓存项：
// udg_GC   ItemTypeId   "ItemRecipeCount"   物品参与合成公式数量
// udg_GC   ItemTypeId   "ItemRecipe"+i      物品对应的合成公式Id，i从1开始计数，无上限
//===========================================================================
function NewRecipe takes integer i0,integer i1,integer i2,integer i3,integer i4,integer i5,integer i6 returns nothing
    local integer array a
    local integer b
    local integer n=0
    set udg_RecipeCount = udg_RecipeCount+1
    set udg_RecipeItemId[udg_RecipeCount*10+9] = i0
    set a[0]=i1
    set a[1]=i2
    set a[2]=i3
    set a[3]=i4
    set a[4]=i5
    set a[5]=i6
    loop
        exitwhen a[n] == 0
        set b = GetStoredInteger(udg_GC,I2S(a[n]),"ItemRecipeCount")
        call StoreInteger(udg_GC,I2S(a[n]),"ItemRecipeCount",b+1)
        call StoreInteger(udg_GC,I2S(a[n]),"ItemRecipe"+I2S(b),udg_RecipeCount)
        set udg_RecipeItemId[udg_RecipeCount*10+n] = a[n]
        set n=n+1
    endloop
endfunction

function RecipeCheck takes unit u,integer rec returns boolean
    local integer n
    local integer i = 0
    local integer array A
    local integer array B
    local integer c
    local integer d = 5
    loop
        set B[i]=udg_RecipeItemId[rec*10+i]
        exitwhen B[i]==0
        set A[i]=GetItemTypeId(UnitItemInSlot(u,i))
        set i = i+1
    endloop
    set n = i-1
    set c = n
    loop
        exitwhen i>=6
        set A[i]=GetItemTypeId(UnitItemInSlot(u,i))
        set i = i+1
    endloop
    loop
        set i=0
        loop
            exitwhen A[i]==B[0]
            if i==d then
                return false
            endif
            set i=i+1
        endloop
        exitwhen c==0
        set A[i]=A[d]
        set B[0]=B[c]
        set B[c]=i
        set c=c-1
        set d=d-1
    endloop
    set B[0]=i
    set i=0
    loop
        set udg_CombineItem[i]=UnitItemInSlot(u,i)
        exitwhen i>=5
        set i=i+1
    endloop
    set d = 5-n
    if n>0 then
        call DestroyEffect(AddSpecialEffectTarget("Abilities\\Spells\\Items\\AIsm\\AIsmTarget.mdl",u,"origin"))
    endif
    loop
        call RemoveItem(udg_CombineItem[B[n]])
        exitwhen n==0
        set udg_CombineItem[B[n]] = udg_CombineItem[n+d]
        set n=n-1
    endloop
    call UnitAddItemById(u,udg_RecipeItemId[rec*10+9])
    return true
endfunction

function ItemCombine takes unit u,item it returns nothing
    local integer r
    local integer i=0
    loop
        set r = GetStoredInteger(udg_GC,I2S(GetItemTypeId(it)),"ItemRecipe"+I2S(i))
        exitwhen r==0
        if RecipeCheck(u,r) then
            return
        endif
        set i=i+1
    endloop
endfunction

function Trig_Combination_Conditions takes nothing returns boolean
    call ItemCombine(GetTriggerUnit(),GetManipulatedItem())
    return false
endfunction

function InitTrig_Combination takes nothing returns nothing
    set gg_trg_Combination=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Combination,EVENT_PLAYER_UNIT_PICKUP_ITEM)
    call TriggerAddCondition(gg_trg_Combination,Condition(function Trig_Combination_Conditions))
endfunction
