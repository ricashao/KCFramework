---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by ricashao.
--- DateTime: 2020/5/1 10:53
---
local skillfile = require "Config.Data.Skill"

local SkillDB = {}

local function GetSkillCfgById(skillId)
    return skillfile[skillId]
end

SkillDB.GetSkillCfgById = GetSkillCfgById

return ConstClass("SkillDB", SkillDB)