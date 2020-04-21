---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by ricashao.
--- DateTime: 2020/4/20 11:39
---
local UISkillAttr = BaseClass("UISkillAttr")

local pos1, luapos;
local OFFSET = Vector3.up
local CRIT_IMG = {
    PHY_SICAL = 0;
    SPELL = 1;
}

local fullpath = "UI/Prefabs/Model/Win_SomethFly_Text"
local hp_text_path = "et_text"
local green_hp_text_path = "et_text_green"
local skillname_text_path = "et_skillName"
local result_path = "g_result"
local result_text_path = "g_result/et_text"
local result_img_path = "g_result/ep_result"

--------------private start-------------
local function SetUIHp(self)
    if not self.currentValue then
        return
    end

    local hp = tonumber(self.currentValue)
    if not hp then
        return
    end

    if hp < 0 then
        self.changeHpTransform.gameObject:SetActive(true)
        self.changeHpText.text = tostring(self.currentValue)
    else
        self.greenHpTransform.gameObject:SetActive(true)
        self.greenHpText.text = tostring(self.currentValue)
    end
end

local function SetUISkillName(self)
    if not self.currentValue then
        return
    end

    local value = tostring(self.currentValue);
    if not value then
        return
    end

    self.skillNameTransform.gameObject:SetActive(true)
    self.skillNameText.text = value
end

local function InitCritComponent(self)
    if not self.resultImage then
        self.resultImage = self.resultImgTransform:GetComponent("Image")
    end

    if not self.resultImageList then
        self.resultImageList = self.resultImgTransform:GetComponent(typeof(UISpriteSwap)).Spritelist
    end

    if (not self.resultImage) or (not self.resultImageList) then
        return false
    end

    return true
end

local function SetUIResult(self)
    if not self.currentValue then
        return
    end

    if not InitCritComponent(self) then
        return
    end

    local sprite

    if self.displayType == CHARACTER_POPUP_TYPE.PHY_CRIT then
        sprite = self.resultImageList[CRIT_IMG.PHY_SICAL]

    elseif self.displayType == CHARACTER_POPUP_TYPE.SPELL_CRIT then
        sprite = self.resultImageList[CRIT_IMG.SPELL]

    elseif self.displayType == CHARACTER_POPUP_TYPE.DODGE then
        self.currentValue = self:GetSkillMsg(4211)
    else

    end

    self.resultTransform.gameObject:SetActive(true)

    if not sprite then
        self.resultImage.gameObject:SetActive(false)
    else
        self.resultImage.gameObject:SetActive(true)
        self.resultImage.sprite = sprite
    end

    self.resultText.text = tostring(self.currentValue)
end

--------------private end  -------------
local function InitUI(self)
    self.camera = GameLayerManager:GetInstance():GetCamera(self.cameraLayer)
    if not self.camera then
        if error then
            error("UISkillAttr camera can not nil")
        end
        return
    end
    GameObjectPool:GetInstance():GetGameObjectAsync(fullpath, BindCallback(self, self.OnPrefabLoad))
end

local function __init(self, character, cameraLayer)
    self.handPointType = ""
    self.camera = nil
    self.handPoint = nil
    self.root = nil
    self.rectTransform = nil
    self.isNeedToDestory = false
    self.positionY = 0
    self.loaded = false
    self.normalGetEffect = nil
    self.time = os.time() + 3

    self.character = character
    self.cameraLayer = cameraLayer
    self.offset = offset or OFFSET

    self.displayType = CHARACTER_POPUP_TYPE.NONE

    -- 传过来要显示的值
    self.currentValue = ""

    -- 掉血控件
    self.changeHpTransform = nil
    self.changeHpText = nil
    self.greenHpTransform = nil
    self.greenHpText = nil

    -- 技能名控件
    self.skillNameTransform = nil
    self.skillNameText = nil

    self.resultTransform = nil
    self.resultText = nil

    self.resultImage = nil
    self.resultImgTransform = nil
    self.resultImageList = nil

    self.transformDict = {}

    self:InitUI()
end

local function OnPrefabLoad(self, pfb)
    self.root = pfb

    self.rectTransform = UIUtil.FindComponent(self.root.tranform, typeof(CS.UnityEngine.RectTransform))
    self.changeHpTransform = UIUtil.FindTrans(self.root.tranform, hp_text_path)
    self.changeHpText = UIUtil.FindText(self.root.tranform, hp_text_path)

    self.greenHpTransform = UIUtil.FindTrans(self.root.tranform, green_hp_text_path)
    self.greenHpText = UIUtil.FindText(self.root.tranform, green_hp_text_path)

    self.skillNameTransform = UIUtil.FindTrans(self.root.tranform, skillname_text_path)
    self.skillNameText = UIUtil.FindText(self.root.tranform, skillname_text_path)

    self.resultTransform = UIUtil.FindTrans(self.root.tranform, result_path)
    self.resultText = UIUtil.FindText(self.root.tranform, result_text_path)
    self.resultImgTransform = UIUtil.FindImage(self.root.tranform, result_img_path)

    table.insert(self.transformDict, self.changeHpTransform);
    table.insert(self.transformDict, self.greenHpTransform);
    table.insert(self.transformDict, self.skillNameTransform);
    table.insert(self.transformDict, self.resultTransform);

    GameLayerManager:GetInstance():AddGameObjectToCameraLayer(pfb, self.cameraLayer)

    self:SetCurrentState()
    self.character:AddSkillAttrInBattle(self)
    self:SetVisible(self.character:IsVisible())

    self.loaded = true
    self:UpdateTransformPos(0.0)
end

local function SetVisible(self, visible)
    if self.root then
        self.root.gameObject:SetActive(visible)
    end
end

local function SetUISkillAttr(self, value, displayType)
    if not value then
        value = ""
    end

    if not displayType then
        return
    end
    self.currentValue = value
    self.displayType = displayType

    if not self.loaded then
        return
    end

    self:SetCurrentState()
end

local function SetCurrentState(self)
    if not self.displayType then
        return
    end

    if self.displayType == CHARACTER_POPUP_TYPE.NONE then
        return
    end

    for _, tran in ipairs(self.transformDict) do
        if tran then
            tran.gameObject:SetActive(false)
        end
    end

    if self.displayType == CHARACTER_POPUP_TYPE.HP then
        SetUIHp(self)

    elseif self.displayType == CHARACTER_POPUP_TYPE.SKILL_NAME then
        SetUISkillName(self)
    else
        SetUIResult(self)
    end
end

local function UpdateTransformPos(self, delta)
    if self.isNeedToDestory then
        self.character:RemoveSkillAttrInBattle(self)
        return false
    end

    if self.root == nil then
        return false
    end

    if self.root.gameObject.activeSelf == false then
        self.isNeedToDestory = true
        return false
    end

    if not self.loaded then
        return false
    end

    self.handPoint = self.character:GetModel():GetHandPos(CharacterHandPoint.Bottom)
    if self.handPoint == nil then
        self.handPoint = self.character:GetWorldPosition()
    end

    pos1 = self.handPoint + self.offset

    pos1 = GameLayerManager:GetInstance().battleCamera:WorldToScreenPoint(pos1)
    luapos = Vector3.New(pos1.x, pos1.y, pos1.z)
    self.positionY = self.positionY + 20 * delta
    if self.positionY > 30 then
        self.root.gameObject:SetActive(false)
    end
    luapos.y = luapos.y + 30 + self.positionY
    luapos = self.camera:ScreenToWorldPoint(luapos)
    self.rectTransform.position = luapos

end

local function LateTick(self, delta)
    self:UpdateTransformPos(delta)
end

local function __delete(self)
    if self.normalGetEffect ~= nil then
        GameObject.Destroy(self.normalGetEffect)
        self.normalGetEffect = nil
    end
    if self.root ~= nil then
        GameObjectPool:GetInstance().RecycleGameObject(fullpath, self.root)
        self.root = nil
    end
    self.character = nil
    self.positionY = 0
    self.isNeedToDestory = false
    self.transformDict = {}
end

UISkillAttr.__init = __init
UISkillAttr.InitUI = InitUI
UISkillAttr.OnPrefabLoad = OnPrefabLoad
UISkillAttr.SetCurrentState = SetCurrentState
UISkillAttr.SetVisible = SetVisible
UISkillAttr.SetUISkillAttr = SetUISkillAttr
UISkillAttr.UpdateTransformPos = UpdateTransformPos
UISkillAttr.LateTick = LateTick
UISkillAttr.__delete = __delete

return UISkillAttr