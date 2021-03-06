---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by ricashao.
--- DateTime: 2020/4/18 11:32
---
local BattleHit = BaseClass("BattleHit", Singleton)

local function ResponseHitByEvent(self, opId, skillConfig, unitResult, callback)
    self.roundHitUnit = {}
    self.endCallBack = callback
    for _, v in pairs(unitResult) do
        local hitUnit = require "Battle.Hit.BattleHitUnit".New(opId, skillConfig, v, Bind(self, self.HitRoundEnd))
        table.insert(self.roundHitUnit, hitUnit)
    end
    for _, v in pairs(self.roundHitUnit) do
        v:ShowHitUnit()
    end
end

local function RoundHitUnit(self)
    for k, v in ipairs(self.roundHitUnit) do
        if v:CheckHitUnitEnd() == false then
            return
        end
    end
    if self.endCallBack ~= nil then
        self.endCallBack()
    end
end

local function HitRoundEnd(self)
    for k, v in ipairs(self.roundHitUnit) do
        if v:CheckHitUnitEnd() == false then
            return false
        end
    end
    local hitUnitLength = table.length(self.roundHitUnit)
    if hitUnitLength == 0 then
        if info then
            info("HitRoundEnd is error, hitUnitLength = 0")
        end
    end
    if self.endCallBack ~= nil then
        self.endCallBack()
    end
    return true
end

BattleHit.ResponseHitByEvent = ResponseHitByEvent
BattleHit.RoundHitUnit = RoundHitUnit
BattleHit.HitRoundEnd = HitRoundEnd
return BattleHit