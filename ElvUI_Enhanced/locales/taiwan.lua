local AceLocale = LibStub:GetLibrary("AceLocale-3.0")
local L = AceLocale:NewLocale("ElvUI", "zhTW")
if not L then return end

-- Translation by: xjjxfpyyyf, zhouf616, mcc, elmush

-- Init
L["ENH_LOGIN_MSG"] = "您正在使用 |cff1784d1ElvUI Enhanced|r (|cff1784d1%s%s|r 版)。"
L["Your version of ElvUI is to old (required v6.51 or higher). Please, download the latest version from tukui.org."] = "您的 ElvUI 版本過低 (限使用 6.51 或以上版本)，請至 tukui.org 下載最新版本。"

-- Equipment
L["Equipment"] = "自動換裝"
L["EQUIPMENT_DESC"] = "請調整相關設定，以便於切換專精或進入戰場時自動更換裝備。"
L["No Change"] = "不更換"

L["Specialization"] = "專精"
L["Enable/Disable the specialization switch."] = "啓用/停用專精切換"

L["Primary Talent"] = "主要專精"
L["Choose the equipment set to use for your primary specialization."] = "選擇主要專精使用的裝備。"

L["Secondary Talent"] = "第二專精"
L["Choose the equipment set to use for your secondary specialization."] = "選擇第二專精使用的裝備。"

L["Battleground"] = "戰場"
L['Enable/Disable the battleground switch.'] = "啓用/停用戰場切換"

L["Equipment Set"] = "裝備設定"
L["Choose the equipment set to use when you enter a battleground or arena."] = "選擇戰場或競技場中使用的裝備。"

L["You have equipped equipment set: "] = "已裝備此套裝備："

L["DURABILITY_DESC"] = "調整角色資訊框的裝備耐久度顯示設定。"
L['Enable/Disable the display of durability information on the character screen.'] = "顯示/隱藏角色資訊框的裝備耐久度。"
L["Damaged Only"] = "僅顯示受損裝備"
L["Only show durabitlity information for items that are damaged."] = "僅於裝備受損時顯示其耐久度。"

L["ITEMLEVEL_DESC"] = "調整角色資訊框的裝等資訊設定。"
L["Enable/Disable the display of item levels on the character screen."] = "顯示/隱藏角色資訊框的裝等。"

L["Miscellaneous"] = "其他"
L['Equipment Set Overlay'] = "顯示裝備設定"
L['Show the associated equipment sets for the items in your bags (or bank).'] = "於背包或銀行物品的資訊中顯示相關的裝備設定。"

-- Movers
L["Mover Transparency"] = "移動框架透明度"
L["Changes the transparency of all the movers."] = "改變所有移動框架的透明度。"

-- Automatic Role Assignment
L['Automatic Role Assignment'] = "自動設定角色類型"
L['Enables the automatic role assignment based on specialization for party / raid members (only work when you are group leader or group assist).'] = "當你是團隊隊長或助手時，自動依據成員天賦設定其角色類型。"

-- Auto Hide Role Icons in combat
L['Hide Role Icon in combat'] = "戰鬥中隱藏角色圖示"
L['All role icons (Damage/Healer/Tank) on the unit frames are hidden when you go into combat.'] = "進入戰鬥時，隱藏單位框架上的所有角色圖示 (傷害輸出/治療/坦克)。"

-- GPS module
L['GPS'] = "GPS 定位"
L['Show the direction and distance to the selected party or raid member.'] = "顯示目前所選隊伍/團隊成員的方位與距離。"

-- Attack Icon
L['Attack Icon'] = "攻擊標記"
L['Show attack icon for units that are not tapped by you or your group, but still give kill credit when attacked.'] = "若己方並未擁有開怪權，但攻擊後仍可獲得拾取權，將該目標單位標上攻擊標記。"

-- Class Icon
L['Show class icon for units.'] = "顯示職業圖示"

-- Minimap Location
L['Above Minimap'] = "小地圖上方"
L['Location Digits'] = "座標數字"
L['Number of digits for map location.'] = "地圖座標的位數。"

-- Minimap Combat Hide
L["Hide minimap while in combat."] = "戰鬥中隱藏小地圖"
L["FadeIn Delay"] = "延遲小地圖顯示"
L["The time to wait before fading the minimap back in after combat hide. (0 = Disabled)"] = "結束戰鬥後，顯示小地圖前的延遲時間 (0 = 停用)"

-- Minimap Buttons
L["Minimap Button Bar"] = "小地圖按鈕整合列"
L['Skin Buttons'] = "美化按鈕"
L['Skins the minimap buttons in Elv UI style.'] = "將小地圖按鈕美化為 ElvUI 風格。"
L['Skin Style'] = "美化風格"
L['Change settings for how the minimap buttons are skinned.'] = "變更小地圖按鈕的美化設定。"
L['The size of the minimap buttons.'] = "小地圖按鈕大小。"
L['No Anchor Bar'] = "不設定"
L['Horizontal Anchor Bar'] = "水平整合列"
L['Vertical Anchor Bar'] = "垂直整合列"
L['Layout Direction'] = "排列方向"
L['Normal is right to left or top to bottom, or select reversed to switch directions.'] = "「一般」為右至左、上至下，「逆序」則顛倒方向。"
L['Normal'] = "一般"
L['Reversed'] = "逆序"

-- PvP Autorelease
L['PvP Autorelease'] = "PvP 自動放魂"
L['Automatically release body when killed inside a battleground.'] = "在戰場中死亡後自動釋放靈魂。"

-- Track Reputation
L['Track Reputation'] = "聲望追蹤"
L['Automatically change your watched faction on the reputation bar to the faction you got reputation points for.'] = "提昇某陣營聲望時，自動於聲望列追蹤此陣營聲望。" 

-- Select Quest Reward
L['Select Quest Reward'] = "自動選取任務獎勵"
L['Automatically select the quest reward with the highest vendor sell value.'] = "自動選取賣價最高的任務獎勵物品。"

-- Item Level Datatext
L['Item Level'] = "物品等級"

-- Range Datatext
L['Target Range'] = "目標距離"
L['Distance'] = "距離"

-- Extra Datatexts
L['Actionbar1DataPanel'] = '快捷列 1 資訊文字列'
L['Actionbar3DataPanel'] = '快捷列 3 資訊文字列'
L['Actionbar5DataPanel'] = '快捷列 5 資訊文字列'

-- Farmer
L["Sunsong Ranch"] = "日歌農莊"
L["The Halfhill Market"] = "半丘市集"
L["Tilled Soil"] = "開墾過的沃土"
L['Right-click to drop the item.'] = "點按右鍵即可卸除工具。"
L['Farmer'] = "農夫"
L['Farmer Portal Bar'] = "傳送門"
L['Farmer Seed Bar'] = "種子"
L['Farmer Tools Bar'] = "工具"
L["FARMER_DESC"] = "調整設定，提昇你在日歌農莊的耕作效率。"
L['Farmer Bars'] = "農夫列"
L['Enable/Disable the farmer bars.'] = "啟用/停用農夫快捷列。"
L['Only active buttons'] = "僅顯示適用的按鈕"
L['Only show the buttons for the seeds, portals, tools you have in your bags.'] = "僅顯示背包中有的種子、傳送門裂片和工具。"
L['Drop Tools'] = "卸除工具"
L['Automatically drop tools from your bags when leaving the farming area.'] = "離開耕作地區時，自動刪除背包中的工具。"
L['Seed Bar Direction'] = "種子列方向"
L['The direction of the seed bar buttons (Horizontal or Vertical).'] = "種子列按鈕的排序方向 (水平或垂直)。"
 
-- Nameplates
L["Threat Text"] = "仇恨值文字"
L["Display threat level as text on targeted, boss or mouseover nameplate."] = "在目標、 BOSS 或游標移經的血條上顯示仇恨值文字。"
L["Target Count"] = "選取目標人數"
L["Display the number of party / raid members targetting the nameplate unit."] = "在血條旁邊顯示選取該單位為目標的隊伍/團隊成員人數。"

-- HealGlow
L['Heal Glow'] = "加亮顯示治療目標"
L['Direct AoE heals will let the unit frames of the affected party / raid members glow for the defined time period.'] = "若隊伍/團隊成員為直接性範圍治療目標，於自定義秒數內加亮顯示其單位框架。"
L["Glow Duration"] = "加亮顯示時間"
L["The amount of time the unit frames of party / raid members will glow when affected by a direct AoE heal."] = "當隊伍/團隊成員為直接性範圍治療目標時，其單位框架加亮顯示的持續時間。"
L["Glow Color"] = "加亮顏色"

-- Raid Marker Bar
L['Raid Marker Bar'] = "團隊標記列"
L['Display a quick action bar for raid targets and world markers.'] = "顯示可迅速標記團隊擊火目標與光柱的快捷列。"
L['Modifier Key'] = "組合鍵"
L['Set the modifier key for placing world markers.'] = "設定標示團隊光柱的組合鍵。"
L['Shift Key'] = "Shift"
L['Ctrl Key'] = "Ctrl"
L['Alt Key'] = "Alt"
L["Raid Markers"] = "團隊標記"
L["Click to clear the mark."] = "點選即可清除標記。"
L["Click to mark the target."] = "點選即可標記目標。"
L["%sClick to remove all worldmarkers."] = "按住 %s 並點按滑鼠即可移除所有光柱。"
L["%sClick to place a worldmarker."] = "按住 %s 並點按滑鼠即可標示光柱。"

-- WatchFrame
L['WatchFrame'] = "追蹤清單"
L['WATCHFRAME_DESC'] = "依據個人喜好調整追蹤清單 (任務清單) 的顯示設定。"
L['Hidden'] = "隱藏"
L['Collapsed'] = "收合"
L['Settings'] = "設定"
L['City (Resting)'] = "城市 (休息)"
L['PvP'] = "PvP"
L['Arena'] = "競技場"
L['Party'] = "隊伍"
L['Raid'] = "團隊"

-- Tooltips
L['Progression Info'] = "進度資訊"
L['Display the players raid progression in the tooltip, this may not immediately update when mousing over a unit.'] = "於提示資訊中顯示玩家的團本進度，可能無法於游標移經該玩家框架時立即顯示。"
