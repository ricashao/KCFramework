--[[
-- added by wsh @ 2018-01-08
-- 特效
--]]

local EffectConfig = {
	UITaskFinish = {
		Name = "UITaskFinish",
		EffectPath = "Effect/Prefab/UI/ef_ui_TaskFinish.prefab",
		-- 是否为UI特效，场景特效等可能使用情况会复杂些，到时候再考虑是否做扩展
		IsUIEffect = true,
		-- 是否循环：循环的特效不会被自动回收
		IsLoop = true,
		-- 存活时间：不循环时生效，存活时间到特效会自动回收
		LiveTime = 0,
	},
	UIPetRankYellow = {
		Name = "UIPetRankYellow",
		EffectPath = "Effect/Prefab/UI/ef_ui_pet_rank_yellow_test.prefab",
		IsUIEffect = true,
		IsLoop = true,
		LiveTime = 0,
	},
	
	
	
	------战斗特效-------
	heal_1 ={
		Name = "heal_1",
		EffectPath = "Effect/Prefab/Battle/heal_1.prefab",
		IsUIEffect = false,
		IsLoop = false,
	},

	normal_hit1 ={
		Name = "normal_hit1",
		EffectPath = "Effect/Prefab/Battle/normal_hit1.prefab",
		IsUIEffect = false,
		IsLoop = false,
	},

	cheal_1 ={
		Name = "cheal_1",
		EffectPath = "Effect/Prefab/Battle/cheal_1.prefab",
		IsUIEffect = false,
		IsLoop = true,
	}
}

return ConstClass("EffectConfig", EffectConfig)