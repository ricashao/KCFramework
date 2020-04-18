---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by admin.
--- DateTime: 2020/4/16 10:45
---

local BattleStateContext = BaseClass("BattleStateContext")

--- private start --- 
local function InjectState(self, state)
    if self.allState[state:GetStateName()] ~= nil then
        Logger.LogError("BattleStateContext InjectState is not nil")
    end
    local stateName = state:GetStateName()
    self.allState[stateName] = state
end

local function Init(self)
    InjectState(self, require "Battle.State.AIBeforeEndState".New())
    InjectState(self, require "Battle.State.AIBeforeShowState".New())
    InjectState(self, require "Battle.State.BeginState".New())
    InjectState(self, require "Battle.State.ShowState".New())
    InjectState(self, require "Battle.State.WaitEndState".New())
    InjectState(self, require "Battle.State.EndState".New())
end
--- private end ---

local function __init(self)
    self.curState = nil
    self.allState = {}
    Init(self)
end

local function GetStateByStateName(self, stateName)
    local state = self.allState[stateName]
    if state == nil then
        return nil
    end
    return state
end

local function InitState(self)
    self:SetStateByName(BattleState.eBattleStateBegin)
end

local function SetStateByName(self, stateName)
    if self.curState ~= nil then
        self:Leave()
    end
    self.curState = self:GetStateByStateName(stateName)
    self:Enter()
end

local function Enter(self)
    self.curState:Enter(self)
end

local function Leave(self)
    self.curState:Leave(self)
end

local function TriggerEvent(self, eventName)
    self.curState:TriggerEvent(eventName, self)
end

BattleStateContext.__init = __init
BattleStateContext.GetStateByStateName = GetStateByStateName
BattleStateContext.InitState = InitState
BattleStateContext.SetStateByName = SetStateByName
BattleStateContext.Enter = Enter
BattleStateContext.Leave = Leave
BattleStateContext.TriggerEvent = TriggerEvent

return BattleStateContext