

//==========================================
//=====定义合成公式=====
//==========================================

function InitRecipe takes nothing returns nothing
//Lv1
//英勇面具=力量腰带+精灵皮靴+合成卷轴
call NewRecipe('I052','I01L',0,0,0,0,0)
call NewRecipe('I040','I052','I00H','I00F',0,0,0)
//灵巧头巾=精灵皮靴+法师长袍+合成卷轴
call NewRecipe('I04V','I01N',0,0,0,0,0)
call NewRecipe('I03S','I04V','I00F','I00L',0,0,0)
//勇气勋章=力量腰带+法师长袍+合成卷轴
call NewRecipe('I04G','I01M',0,0,0,0,0)
call NewRecipe('I037','I04G','I00H','I00L',0,0,0)
//大法师指环Lv1=贵族圆环+索比面具+合成卷轴
call NewRecipe('I04K','I01H',0,0,0,0,0)
call NewRecipe('I03C','I04K','I00M','I00T',0,0,0)
//大法师指环Lv2=大法师指环Lv1+合成卷轴
call NewRecipe('I03D','I04K','I03C',0,0,0,0)
//大法师指环LvMax=大法师指环Lv2+合成卷轴
call NewRecipe('I03E','I04K','I03D',0,0,0,0)
//战舰之舵=国王之冠+合成卷轴
call NewRecipe('I04O','I01O',0,0,0,0,0)
call NewRecipe('I03K','I04O','I00N',0,0,0,0)
//施魔护盾=强化盾+生命晶体
call NewRecipe('I03L','I01F','I00O',0,0,0,0)
//魔力之源=索比面具*2+合成卷轴
call NewRecipe('I058','I01Z',0,0,0,0,0)
call NewRecipe('I048','I058','I00T','I00T',0,0,0)
//影子风衣=法师长袍+精灵皮靴+闪避护符
call NewRecipe('I03I','I00L','I00F','I01S',0,0,0)
//雷霆晶石=魔法垂饰+合成卷轴
call NewRecipe('I055','I021',0,0,0,0,0)
call NewRecipe('I045','I055','I00R',0,0,0,0)
//疾风之靴=速度之靴+合成卷轴
call NewRecipe('I04Y','I022',0,0,0,0,0)
call NewRecipe('I03V','I04Y','I008',0,0,0,0)

//Lv2
//传送者笔记=传送卷轴+神秘腰带+魔法垂饰+合成卷轴
call NewRecipe('I04B','I023',0,0,0,0,0)
call NewRecipe('I01D','I04B','I007','I01T','I00R',0,0)
//医疗权杖=恢复指环+生命晶体+合成卷轴
call NewRecipe('I04H','I024',0,0,0,0,0)
call NewRecipe('I038','I04H','I00U','I00O',0,0,0)
//飓风权杖=法杖+法师长袍+索比面具+合成卷轴
call NewRecipe('I057','I025',0,0,0,0,0)
call NewRecipe('I047','I057','I011','I00L','I00T',0,0)
//飓风权杖=飓风权杖+合成卷轴
call NewRecipe('I047','I057','I047',0,0,0,0)
//净化之杖=闪电之球+法杖+合成卷轴
call NewRecipe('I04E','I026',0,0,0,0,0)
call NewRecipe('I034','I04E','I017','I011',0,0,0)
//大法师之手=加速手套+法师长袍+合成卷轴
call NewRecipe('I04J','I027',0,0,0,0,0)
call NewRecipe('I03B','I04J','I00E','I00L',0,0,0)
//神秘之剑=长剑+刃爪+合成卷轴
call NewRecipe('I050','I028',0,0,0,0,0)
call NewRecipe('I03Y','I050','I00X','I00W',0,0,0)
//战争兵器=铁锤+战斧+长剑
call NewRecipe('I03J','I00Z','I00Y','I00X',0,0,0)
//偏向之盾=施魔护盾+闪避护符
call NewRecipe('I01I','I03L','I01S',0,0,0,0)
//三棱盾=施魔护盾+神秘腰带+合成卷轴
call NewRecipe('I04A','I02C',0,0,0,0,0)
call NewRecipe('I01B','I04A','I03L','I01T',0,0,0)
//刀刃护甲=锁甲+神秘腰带+合成卷轴
call NewRecipe('I04F','I02D',0,0,0,0,0)
call NewRecipe('I035','I04F','I01W','I01T',0,0,0)

//Lv3
//潜行者之甲=影子风衣+长剑+合成卷轴
call NewRecipe('I04U','I02E',0,0,0,0,0)
call NewRecipe('I03R','I04U','I03I','I00X',0,0,0)
//埃苏尼之心=医疗权杖+大法师指环LvMax
call NewRecipe('I03A','I024','I03E',0,0,0,0)
//银色十字徽章=灵魂宝石+合成卷轴
call NewRecipe('I054','I02G',0,0,0,0,0)
call NewRecipe('I043','I054','I01E',0,0,0,0)
//神秘手套=加速手套+合成卷轴
call NewRecipe('I051','I02H',0,0,0,0,0)
call NewRecipe('I03Z','I051','I00E',0,0,0,0)
//霜华之锋=神秘之剑+霜冻之球+合成卷轴
call NewRecipe('I056','I02I',0,0,0,0,0)
call NewRecipe('I046','I056','I03Y','I019',0,0,0)
//玛诺洛斯战枪=战争兵器+火焰之球+合成卷轴
call NewRecipe('I04X','I02J',0,0,0,0,0)
call NewRecipe('I03U','I04X','I03J','I016',0,0,0)
//弑君者=腐蚀之球+神秘之剑+合成卷轴
call NewRecipe('I04N','I02K',0,0,0,0,0)
call NewRecipe('I03H','I04N','I018','I03Y',0,0,0)
//远古战斧=战争兵器+天灾骨钟+合成卷轴
call NewRecipe('I053','I02L',0,0,0,0,0)
call NewRecipe('I042','I053','I03J','I013',0,0,0)
//毁灭之爪=刃爪+合成卷轴
call NewRecipe('I04T','I02M',0,0,0,0,0)
call NewRecipe('I03Q','I04T','I00W',0,0,0,0)
//碎骨雷锤=矿铲+铁锤+合成卷轴
call NewRecipe('I04Z','I02A',0,0,0,0,0)
call NewRecipe('I03X','I04Z','I01A','I00Z',0,0,0)

//Lv4
//幻影权杖=魔力之源+原神之星+法杖+合成卷轴
call NewRecipe('I04M','I02N',0,0,0,0,0)
call NewRecipe('I03G','I04M','I048','I01Q','I011',0,0)
//破法者之刃=净化之杖+大法师之手
call NewRecipe('I03W','I034','I03B',0,0,0,0)
//死亡领主护盾=施魔护盾+魔法垂饰+火焰风衣+合成卷轴
call NewRecipe('I02Q','I04Q',0,0,0,0,0)
call NewRecipe('I03N','I04Q','I01Y','I00R','I01G',0,0)
//死亡领主皇冠=生命晶体+雷霆晶石+国王之冠+合成卷轴
call NewRecipe('I04R','I02P',0,0,0,0,0)
call NewRecipe('I03O','I04R','I00O','I045','I00N',0,0)
//上帝之戒=忍耐姜歌+战歌之鼓+天灾骨钟+风暴狮角+灵魂宝石
call NewRecipe('I01C','I012','I013','I014','I015','I01E',0)
//镜之铠=刀刃护甲+偏向之盾+钢盔
call NewRecipe('I044', 'I035','I01I','I01V',0,0,0)
//光明圣堂=三棱盾+锁甲+钢盔+合成卷轴
call NewRecipe('I04C','I02T',0,0,0,0,0)
call NewRecipe('I01J','I04C','I01B','I01W','I01V',0,0)
//狮心=三棱盾+灵魂宝石+合成卷轴
call NewRecipe('I04W','I02U',0,0,0,0,0)
call NewRecipe('I03T','I04W','I01B','I01E',0,0,0)

//Lv5
//创世者=灵魂晶石+原神之星+血羽之心+毁灭号角
call NewRecipe('I036','I01E','I01P','I01Q','I01R',0,0)
//兽性呼唤·地狱战斧=毁灭号角*2+战斧+合成卷轴
call NewRecipe('I04D','I030',0,0,0,0,0)
call NewRecipe('I01K','I04D','I01R','I01R','I00Y',0,0)
//鹰之号角·十字军弓=短弓+血羽之心*2+合成卷轴
call NewRecipe('I059','I02W',0,0,0,0,0)
call NewRecipe('I049','I059','I01P','I01P','I010',0,0)
//宙斯之力·神属权杖=雷霆晶石+原神之星*2+合成卷轴
call NewRecipe('I04L','I02X',0,0,0,0,0)
call NewRecipe('I03F','I04L','I01Q','I01Q','I045',0,0)
//时之轮= 魔力之源+灵魂宝石+合成卷轴
call NewRecipe('I04P','I02Y',0,0,0,0,0)
call NewRecipe('I03M','I04P','I048','I01E',0,0,0)
//死神之镰=战争兵器+棍棒+合成卷轴
call NewRecipe('I04S','I02Z',0,0,0,0,0)
call NewRecipe('I03P','I04S','I03J','I00V',0,0,0)
//辉光·幻化之刃=神秘之剑+火焰之球+霜冻之球+闪电之球
call NewRecipe('I041','I03Y','I016','I017','I019',0,0)
//圣剑·Blade=神秘之剑+灵魂晶石+合成卷轴
call NewRecipe('I04I','I032',0,0,0,0,0)
call NewRecipe('I039','I04I','I03Y','I01E',0,0,0)
endfunction//===========================================================================
// Trigger: InitCombination
//===========================================================================
function Trig_InitCombination_Actions takes nothing returns nothing
    call InitGameCacheBJ( "MapName.w3v" )
    set udg_GC = GetLastCreatedGameCacheBJ()
    call ExecuteFunc("InitRecipe")
    // 以下动作可以删除
endfunction

//===========================================================================
function InitTrig_InitCombination takes nothing returns nothing
    set gg_trg_InitCombination = CreateTrigger(  )
    call TriggerAddAction( gg_trg_InitCombination, function Trig_InitCombination_Actions )
endfunction
