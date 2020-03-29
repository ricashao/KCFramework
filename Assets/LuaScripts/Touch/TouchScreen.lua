---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by Administrator.
--- DateTime: 2020/3/28 16:02
---
local TouchScreen = BaseClass("TouchScreen")
local MIN_TIME = 0.5
local _currentTouchTime = 0.5
local rayCamera = CS.UnityEngine.Camera.main
local Input = CS.UnityEngine.Input
local PointerEventData = CS.UnityEngine.EventSystems.PointerEventData
local EventSystem = CS.UnityEngine.EventSystems.EventSystem

local function __init(self)
    rayCamera = mainCamera
end

local function SetRayCamera(self, camera)
    rayCamera = camera;
end

local function Tick(self, deltaTime)
    if Input.GetMouseButtonDown(0) then
        self:CallTouchFunction();
        _currentTouchTime = 0
    elseif (Input.touchCount > 0 and Input.GetTouch(0).phase == CS.UnityEngine.TouchPhase.Moved) then
        _currentTouchTime = _currentTouchTime + deltaTime
        if (_currentTouchTime > MIN_TIME) then
            if (_currentTouchTime > MIN_TIME) then
                _currentTouchTime = 0.0
                self:CallLuaFunction();
            end
        end
    else
        _currentTouchTime = 0.0;
    end

    if (Input.GetMouseButtonUp(0)) then
        InputTouch:GetInstance():SetTouchButtonState(true)
    elseif (Input.GetMouseButtonDown(0)) then
        InputTouch:GetInstance():SetTouchButtonState(false)
    end
end

local function HitUI(self, mousePos)
    local eventDataCurrentPosition = PointerEventData.New(EventSystem.current)
    eventDataCurrentPosition.position = Vector2.New(mousePos.x, mousePos.y)
    local results = EventSystem.current.RaycastAll(eventDataCurrentPosition);
    return results.Count > 0
end

local function CallTouchFunction(self)
    if not rayCamera then
        return
    end
    local ray = rayCamera:ScreenPointToRay(Input.mousePosition);
    local hitInfo = CS.UnityEngine.Physics.RaycastAll(ray);
    if (hitInfo and hitInfo.Length > 0) then
        InputTouch:GetInstance():OnTouchScreen(Input.mousePosition)
        if (not self:HitUI(Input.mousePosition)) then
            InputTouch:GetInstance():OnTouch(hitInfo)
        end
    end
end

TouchScreen.__init = __init
TouchScreen.SetRayCamera = SetRayCamera
TouchScreen.Tick = Tick
TouchScreen.HitUI = HitUI
TouchScreen.CallTouchFunction = CallTouchFunction

return TouchScreen