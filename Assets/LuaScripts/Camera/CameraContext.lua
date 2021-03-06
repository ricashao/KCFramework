---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by Administrator.
--- DateTime: 2020/3/29 13:51
---
local CameraContext = BaseClass("CameraContext",Singleton)

local function __init(self)
    self.stayState   = nil
    self.followState = nil
    self.smartCamera = nil
    self.cameraState = self:GetStayState()
end

local function SetCameraTarget(self,camera)
    self.smartCamera = camera
end

local function ChangeState(self,state)
    if self.smartCamera == nil then
        return false
    end

    self:Exit()
    self.cameraState = state
    self:Enter()
end

local function Enter(self)
    if self.smartCamera == nil then
        return false
    end

    self.cameraState:Enter(self, self.smartCamera)
end

local function LateTick(self,delta)
    if self.smartCamera == nil then
        return false
    end

    self.cameraState:LateTick(delta, self, self.smartCamera)
end

local function Exit(self)
    if self.smartCamera == nil then
        return false
    end

    self.cameraState:Exit(self, self.smartCamera)
end

local function GetStayState(self)
    if self.stayState == nil then
        self.stayState = require "Camera.State.CameraStayState".New()
    end
    return self.stayState
end

local function GetFollowState(self)
    if self.followState == nil then
        self.followState = require "Camera.State.CameraFollowState".New()
    end
    return self.followState
end


CameraContext.__init = __init
CameraContext.SetCameraTarget = SetCameraTarget
CameraContext.ChangeState = ChangeState
CameraContext.Enter = Enter
CameraContext.LateTick = LateTick
CameraContext.Exit = Exit
CameraContext.GetStayState = GetStayState
CameraContext.GetFollowState = GetFollowState

return CameraContext