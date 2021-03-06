---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by ricashao.
--- DateTime: 2020/4/16 14:21
---
---存客户端显示的属性
local AttrType = {
    HP = 60, -- 当前生命
    ATTACK = 80, -- 攻击
    DEFEND = 100, -- 防御
    HIT_RATE = 110, -- 命中值
    DODGE_RATE = 120, -- 躲避值
    SPEED = 130, -- 速度
    MAX_HP = 140, -- 最大生命上限
    PHYSIC_CRIT_RATE = 210, -- 外功暴击率
    MAGIC_CRIT_RATE = 400, -- 内功暴击率（初始为0%）
    MAGIC_ATTACK = 810, -- 法术攻击力
    MAGIC_DEF = 820, -- 法术防御力
    WOUND = 840, -- 伤
    MOVEMENT = 950, -- 行动力
    FIRE = 1630, -- 火
    EARTH = 1640, -- 地
    WIND = 1650, -- 风
    WATER = 1660, -- 水
    SKY = 1670, -- 空
    ATK_JIANMIAN = 1680, -- 物攻减免
    MAGIC_JIANMIAN = 1690, -- 法攻减免
    ATK_STRONG = 1720, -- 物攻加深
    MAGIC_STRONG = 1730, -- 法攻加深
    HEAL = 1540, -- 治疗量
}

return AttrType