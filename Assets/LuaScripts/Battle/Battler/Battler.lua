---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by admin.
--- DateTime: 2020/4/16 12:40
---
local Battler = BaseClass("Battler")

--- private start ---
local function InitAttrs(self)
    self.attrAgent = require "Battle.Attr.ClientAttrAgent".New(self)
    self.attrAgent:SetAttr(AttrType.HP, self.hp)
    self.attrAgent:SetAttr(AttrType.MAX_HP, self.maxhp)
end

local function InitCharacter(self)
    local bornDir = self:IsFriendSide() and BattleCommon.FriendSideDir or BattleCommon.EnemySideDir
    local battleScene = BattleManager:GetInstance():GetBattle():GetMapInfo()
    self.character = require "Character.Warrior.Warrior".New()
    self.character:SetParent(battleScene.planeBackground.transform)
    --self:CreateChracterData()
    self.character:Initialize(self.fighterInfo, { x = self.fighterInfo.posx, y = self.fighterInfo.posy }, bornDir, Bind(self, self.InitBuffs))
    self.character:SetFighterId(self.battlerId)
    self.character:SetName(tostring(self.battlerId), UILayers.BattlerNameCamera_1.Name, HUD_TYPE.TOP_NAME)
end
--- private end ---

local function __init(self)

    self.battlerId = 0
    self.eBattlerType = BattlerType.eBattlerCharacter
    self.buffAgent = nil
    self.attrAgent = nil
    self.hp = 0
    self.maxhp = 0
    self.isdeath = false
    self.isFlyOut = false
    self.isDisappear = false
    -- 特效渲染列表
    self.effects = {}
    self.character = nil
    self.data = nil
end

local function CreateBattler(self)
    InitAttrs(self)
    InitCharacter(self)
end

local function InitBuffs(self)
    self.buffAgent = require "Battle.Buff.ClientBuffAgent".New(self)
    if (self.buffs) then
        for k, v in ipairs(self.buffs) do
            self.buffAgent:InitBuff(k, v)
        end
    end
end

--是否在战场左下角
local function IsFriendSide(self)
    return (self.battlerId <= BattleCommon.FriendMaxID) and (self.battlerId >= BattleCommon.FriendMinID)
end

local function Parse(self, fighterInfo)
    self.battlerId = fighterInfo.index
    self.eBattlerType = fighterInfo.fightertype
    self.hp = fighterInfo.hp
    self.maxhp = fighterInfo.maxhp
    --self:SetShape(fighterInfo.shape)
    self.fighterInfo = fighterInfo
end

local function AddEffectById(self, id)
    if self.effects[id] then
        self:RemoveEffectById(id)
    end
    if self.character:IsVisible() then
        --加载特效
        local cfg = BuffDB.GetCBuffConfigById(id)
        if (cfg.effect ~= "") then
            local decode = EfDecode.Decode(cfg.effect)
            local ac = AniController:GetInstance()
            local battleEffect = ac:PlayAniOnTargetBody(decode.ef, self:GetCharacter())
            self.effects[id] = battleEffect
        end
    end
end

local function RemoveEffectById(self, id)
    if self.effects[id] then
        --移除特效
        self.effects[id]:Delete()
        self.effects[id] = nil
    end
end

--变化属性 并且做受击动作
local function DealAttrWithBattleResult(self, resultUnit)
    for i = 1, BattleResult.eBattleResultMax do
        local result = CS.BitOperator.lMove(1, BattleResult.eBattleResultMax - i)
        if CS.BitOperator.And(result, resultUnit.eTargetResult) == result then
            if result == BattleResult.eBattleResultHPChange then
                self:UpdateHp(resultUnit.hpChange)
            end
        end
    end
end

--受击动作后 后续动作 比如死亡 眩晕等 只会放一种吧？？
local function DealActionWithBattleResult(self, resultUnit, cb)
    for i = 1, BattleResult.eBattleResultMax do
        local result = CS.BitOperator.lMove(1, BattleResult.eBattleResultMax - i);
        if CS.BitOperator.And(result, resultUnit.eTargetResult) == result then
            if result == BattleResult.eBattleResultDeath then
                self.isDeath = true
                self.isFlyOut = true
                self:FlyOut(cb)
                return
            elseif result == BattleResult.eBattleResultFlyOut then
                --TODO 先在击飞里添加倒地死亡的动作，今后改成击飞
                self.isDeath = true
                self.isFlyOut = true
                self:FlyOut(cb)
                return
            end
        end
    end
    if (cb) then
        cb()
    end
end

local function UpdateHp(self, changeHp)
    local attrValues = {}
    attrValues[AttrType.HP] = changeHp
    self.attrAgent:UpdateAttrs(attrValues)
    --todo 更新血量
end

local function FlyOut(self, cb)
    -- 临时隐藏下
    self.character:SetVisible(false)
    if (cb) then
        cb()
    end
end

--- get set start ---
local function GetCharacter(self)
    return self.character
end

local function GetBuffAgent(self)
    return self.buffAgent
end

local function GetAttrAgent(self)
    return self.attrAgent
end

local function IsDeath(self)
    return self.isdeath
end

local function GetBattlerId(self)
    return self.battlerId
end

--- get set end ---

local function __delete(self)
    for _, v in pairs(self.effects) do
        v:Delete()
    end
    self.effects = {}
    self.character:Delete()
    self.buffAgent = nil
    self.attrAgent = nil
end

Battler.__init = __init
Battler.CreateBattler = CreateBattler
Battler.InitCharacter = InitCharacter
Battler.IsFriendSide = IsFriendSide
Battler.InitBuffs = InitBuffs
Battler.Parse = Parse
Battler.AddEffectById = AddEffectById
Battler.RemoveEffectById = RemoveEffectById
Battler.DealAttrWithBattleResult = DealAttrWithBattleResult
Battler.UpdateHp = UpdateHp
Battler.DealActionWithBattleResult = DealActionWithBattleResult
Battler.FlyOut = FlyOut
Battler.__delete = __delete

Battler.GetCharacter = GetCharacter
Battler.GetBuffAgent = GetBuffAgent
Battler.GetAttrAgent = GetAttrAgent
Battler.GetBattlerId = GetBattlerId
Battler.IsDeath = IsDeath
return Battler
