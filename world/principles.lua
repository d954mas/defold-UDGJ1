local COMMON = require "libs.common"
local BASE_PRINCIPLE = require "world.base_principle"
local M = {}

M.SKILLS = require "world.skills"
M.RACES = require "world.races"


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


M.ATTRIBUTES = {
	POWER = PowerAttribute(),
	CONSTITUTION = ConstitutionAttribute(),
	AGILITY = AgilityAttribute(),
}
---@type ArmorType[]
M.SORTED_ATTRIBUTES = BASE_PRINCIPLE.create_sorted(M.ATTRIBUTES)
--endregion

--region ALIGNMENTS
---@class Alignment:BasePrinciple
local Alignment = COMMON.class("Alignment",BASE_PRINCIPLE.BasePrinciple)

M.ALIGNMENTS = {
	EVIL = Alignment({order=1,id="EVIL",image="evil",text_title="alignment_evil",text_description="alignment_evil_description"}),
	NEUTRAL = Alignment({order=2,id="NEUTRAL",image="neutral",text_title="alignment_neutral",text_description="alignment_neutral_description"}),
	GOOD = Alignment({order=3,id="GOOD",image="good",text_title="alignment_good",text_description="alignment_good_description"}),
}
---@type Alignment[]
M.SORTED_ALIGNMENTS =  BASE_PRINCIPLE.create_sorted(M.ALIGNMENTS)
--endregion

--region CLASSES
---@class Class:BasePrinciple
local Class = COMMON.class("Class",BASE_PRINCIPLE.BasePrinciple)
function Class:initialize(data)
	BASE_PRINCIPLE.BasePrinciple.initialize(self,data)
	self.attributes = {
		power = data.power or 0,
		constitution = data.constitution or 0,
		agility = data.agility or 0,
	}
end

M.CLASSES = {
	WARRIOR = Class({order=1,id="WARRIOR",image="warrior",text_title="class_warrior",text_description="class_warrior_description"
					,power = 14, agility = 14, constitution = 20}),
	THIEF = Class({order=2,id="THIEF",image="thief",text_title="class_thief",text_description="class_thief_description"
				  ,power = 20, agility = 20, constitution = 14}),
	MAGE = Class({order=3,id="MAGE",image="mage",text_title="class_mage",text_description="class_mage_description",
					power = 20, agility = 14, constitution = 20}),
}
---@type Class[]
M.SORTED_CLASSES =  BASE_PRINCIPLE.create_sorted(M.CLASSES)
--endregion

--region WEAPON TYPES
---@class WeaponType:BasePrinciple
local WeaponType = COMMON.class("WeaponType",BASE_PRINCIPLE.BasePrinciple)

M.WEAPON_TYPES = {
	SWORD = WeaponType({order=1,id="SWORD",image="sword",text_title="weapon_type_sword",text_description="weapon_type_sword_description"}),
	DAGGER = WeaponType({order=2,id="DAGGER",image="dagger",text_title="weapon_type_dagger",text_description="weapon_type_dagger_description"}),
	STAFF = WeaponType({order=3,id="STAFF",image="staff",text_title="weapon_type_staff",text_description="weapon_type_staff_description"}),
}
---@type WeaponType[]
M.SORTED_WEAPON_TYPES =  BASE_PRINCIPLE.create_sorted(M.WEAPON_TYPES)
--endregion

--region ARMOR TYPES
---@class ArmorType:BasePrinciple
local ArmorType = COMMON.class("ArmorType",BASE_PRINCIPLE.BasePrinciple)


M.ARMOR_TYPES = {
	CLOTHES = ArmorType({order=1,id="CLOTHES",image="clothes",text_title="armor_type_clothes",text_description="armor_type_clothes_description"}),
	LIGHT = ArmorType({order=2,id="LIGHT",image="light",text_title="armor_type_light",text_description="armor_type_light_description"}),
	HEAVY = ArmorType({order=3,id="HEAVY",image="heavy",text_title="armor_type_heavy",text_description="armor_type_heavy_description"}),
}
---@type ArmorType[]
M.SORTED_ARMOR_TYPES =  BASE_PRINCIPLE.create_sorted(M.ARMOR_TYPES)
--endregion





--endregion
M.Alignment = Alignment
M.Race = Race
M.Class = Class
M.Skils = Skill


return COMMON.read_only_recursive(M)


