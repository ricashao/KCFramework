---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by ricashao.
--- DateTime: 2020/4/16 18:16
---
require "Battle.Show.BattleShowCommon"
local BattleShowUnit = BaseClass("BattleShowUnit", Singleton)

local function __init(self)
    self.showUnitData = nil
    self.finishCallBack = nil
    self.showType = BattleShowRound.NoSkill
    self.curBattleSkill = nil

    self.skillActionEnd = false
    self.skillHitEnd = false

    self.curExecute = nil
    self.curNewFighter = {}
    self.curUnitResult = {}
    -- k v
    self.curRoleAttribute = {}
end

local function StartShowUnit(self, showUnitData, cb)
    self:Clear()
    self.showUnitData = showUnitData
    self.finishCallBack = cb
    self:Parse(showUnitData)
    self:BattleShowUnitMove()
end

local function Parse(self, data)
    local curExecute = require "Battle.Show.Data.RoundExecute".New()
    curExecute:Parse(data.execute)
    self.curExecute = curExecute

    if (data.newfighter) then
        -- 战斗添加新Npc
        for k, v in ipairs(data.newfighter) do
            local battler = require "Battle.Battler.Battler".New()
            battler:Parse(v)
            table.insert(self.curNewFighter, battler)
        end
    end

    if (data.resultlist) then
        -- 战斗结果
        for k, v in ipairs(data.resultlist) do
            local result = require "Battle.Show.Data.RoundResultUnit".New()
            result:Parse(v)
            table.insert(self.curUnitResult, result)
        end
    end

    if (data.rolechangedattrs) then
        -- 战斗脚本接收者，此动作后属性的变化
        for k, v in ipairs(data.rolechangedattrs) do
            self.curRoleAttribute[k] = v
        end
    end
end

local function BattleShowUnitMove(self)
    local curExecute = self.showUnitData.execute
    if (curExecute.movePaths and table.length(curExecute.movePaths) > 0) then
        local battle = BattleManager:GetInstance():GetBattle()
        local character = battle:FindBattlerByID(curExecute.attackerid):GetCharacter()
        character:MoveInBattle(curExecute.movePaths, BindCallback(self, self.MoveEnd))
    else
        self:BuildBattleShowUnit()
    end
end

local function MoveEnd(self)
    local timer = TimerManager:GetInstance():GetTimer(0.2, self.BuildBattleShowUnit, self, true, false)
    timer:Start()
end

--创建回合表现数据
local function BuildBattleShowUnit(self)
    --print(string.format("%s 开始行动",self.curExecute.attackerId ))
    if self.curExecute.eBattleOperate == BattleOperate.eOperateFailure then
        --操作失败
        self.showType = BattleShowRound.NoSkill
        self:CurrentNoSkillEnd()
        return
    elseif self.curExecute.eBattleOperate == BattleOperate.eRoundEndDemo then
        --特殊结果处理
        self.showType = BattleShowRound.NoSkill
        for _, result in pairs(self.curUnitResult) do
            result:DealResult()
        end
        local timer = TimerManager:GetInstance():GetTimer(0.5, self.CurrentNoSkillEnd, self, true, false)
        timer:Start()
        return
    elseif self.curExecute.eBattleOperate == BattleOperate.eSummonOperate then
        --召唤
        return
    elseif self.curExecute.eBattleOperate == BattleOperate.eRunawayOperate then
        --逃跑
        return
    elseif self.curExecute.eBattleOperate == BattleOperate.eItemOperate then
        --使用物品
        return
    elseif self.curExecute.eBattleOperate == BattleOperate.eOnlyMove then
        --仅移动 什么都不用做所有的操作之前都先进行了移动判断
        self.showType = BattleShowRound.NoSkill
        self:CurrentNoSkillEnd()
        return
    else
        --技能攻击
        self.showType = BattleShowRound.Skill
        if self.curExecute.operatorId == 0 then
            self.curExecute.operatorId = BattleCommon.DefaultSkill
        end

        self.curBattleSkill = require("Battle.Skill.BattleSkill").New(self.curExecute.attackerId, self.curExecute.aimId,
                self.curExecute.operatorId, self.curExecute, self.curUnitResult, BindCallback(self, self.CurrentSkillEnd))
        self.curBattleSkill:ShowBattleSkill()
        --self.curBattleHit = require("Battle.Hit.BattleHit").New(self.CurrentActionUnitHitFinish, self)

        return
    end
    if error then
        error("unknown skill, curExecute.eBattleOperate = " .. self.curExecute.eBattleOperate)
    end
    return
end

local function CurrentSkillEnd(self)
    --print(string.format("%s 结束行动",self.curExecute.attackerId ))
    self.skillActionEnd = true
    self.finishCallBack()
end

local function CurrentNoSkillEnd(self)
    --print(string.format("%s 结束行动",self.curExecute.attackerId ))
    self.finishCallBack()
end

--清理上回合表现数据
local function Clear(self)
    self.showUnitData = nil
    self.finishCallBack = nil
    self.curBattleSkill = nil
    self.curNewFighter = {}
    self.curUnitResult = {}
    self.curRoleAttribute = {}
    self.showType = BattleShowRound.NoSkill
    self.skillActionEnd = false
    self.skillHitEnd = false
end

BattleShowUnit.__init = __init
BattleShowUnit.StartShowUnit = StartShowUnit
BattleShowUnit.Clear = Clear
BattleShowUnit.Parse = Parse
BattleShowUnit.BattleShowUnitMove = BattleShowUnitMove
BattleShowUnit.MoveEnd = MoveEnd
BattleShowUnit.BuildBattleShowUnit = BuildBattleShowUnit
BattleShowUnit.CurrentSkillEnd = CurrentSkillEnd
BattleShowUnit.CurrentNoSkillEnd = CurrentNoSkillEnd
return BattleShowUnit