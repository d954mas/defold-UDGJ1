local COMMON = require "libs.common"
local BASE_PRINCIPLE = require "world.principles.base_principle"

local M = {}

--region ATTRIBUTES
---@class Attribute:BasePrinciple
local Attribute = COMMON.class("Attribute",BASE_PRINCIPLE.BasePrinciple)

---@class PowerAttribute:Attribute
local PowerAttribute = COMMON.class("PowerAttribute",Attribute)
function PowerAttribute:initialize()
	Attribute.initialize(self,{order=1,id="POWER",image="power",text_title="attribute_power",text_description="attribute_power_description"})
	self.damage_percent = 0.02
end

---@class ConstitutionAttribute:Attribute
local ConstitutionAttribute = COMMON.class("ConstitutionAttribute",Attribute)
function ConstitutionAttribute:initialize()
	Attribute.initialize(self,{order=2,id="CONSTITUTION",image="constitution",text_title="attribute_constitution",text_description="attribute_constitution_description"})
	self.hp = 5
end

---@class AgilityAttribute:Attribute
local AgilityAttribute = COMMON.class("AgilityAttribute",Attribute)
function AgilityAttribute:initialize()
	Attribute.initialize(self,{order=3,id="AGILITY",image="agility",text_title="attribute_agility",text_description="attribute_agility_description"})
	self.attack = 2
	self.defence = 3
end

M.Attribute = Attribute

M.DATA = {
	POWER = PowerAttribute(),
	CONSTITUTION = ConstitutionAttribute(),
	AGILITY = AgilityAttribute(),
}
---@type ArmorType[]
M.SORTED_DATA = BASE_PRINCIPLE.create_sorted(M.DATA)

return M