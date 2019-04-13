local COMMON = require "libs.common"
local M = {}

local function create_sorted(t)
	local data = {}
	for _,v in pairs(t)do
		table.insert(data,v)
	end
	table.sort(data,function(a,b) return a.order < b.order end)
	return data
end

---@class BasePrinciple
local BasePrinciple = COMMON.class("BasePrinciple")
function BasePrinciple:initialize(data)
	assert(data)
	self.order = assert(data.order)
	self.id = assert(data.id)
	self.image = assert(data.image)
	self.text_title = assert(data.text_title)
	self.text_description = assert(data.text_description)
	COMMON.LOCALE:locale_exist(self.text_title)
	COMMON.LOCALE:locale_exist(self.text_description)
end

--region ATTRIBUTES
---@class Attribute:BasePrinciple
local Attribute = COMMON.class("Attribute",BasePrinciple)

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
M.SORTED_ATTRIBUTES = create_sorted(M.ATTRIBUTES)
--endregion

--region ALIGNMENTS
---@class Alignment:BasePrinciple
local Alignment = COMMON.class("Alignment",BasePrinciple)

M.ALIGNMENTS = {
	EVIL = Alignment({order=1,id="EVIL",image="evil",text_title="alignment_evil",text_description="alignment_evil_description"}),
	NEUTRAL = Alignment({order=2,id="NEUTRAL",image="neutral",text_title="alignment_neutral",text_description="alignment_neutral_description"}),
	GOOD = Alignment({order=3,id="GOOD",image="good",text_title="alignment_good",text_description="alignment_good_description"}),
}
---@type Alignment[]
M.SORTED_ALIGNMENTS = create_sorted(M.ALIGNMENTS)
--endregion

--region RACES
---@class Race:BasePrinciple
local Race = COMMON.class("Race",BasePrinciple)

function Race:initialize(data)
	BasePrinciple.initialize(self,data)
	self.attributes = {
		power = data.power or 0,
		constitution = data.constitution or 0,
		agility = data.agility or 0,
	}
end

M.RACES = {
	HUMAN = Race({order=1,id="HUMAN",image="human",text_title="race_human",text_description="race_human_description",power = 32, agility = 14, constitution = 14}),
	ELF = Race({order=2,id="ELF",image="elf",text_title="race_elf",text_description="race_elf_description",power = 14, agility = 32, constitution = 14}),
	DWARF = Race({order=3,id="DWARF",image="dwarf",text_title="race_dwarf",text_description="race_dwarf_description",power = 14, agility = 14, constitution = 32}),
}
---@type Race[]
M.SORTED_RACES = create_sorted(M.RACES)

--endregion

--region CLASSES
---@class Class:BasePrinciple
local Class = COMMON.class("Class",BasePrinciple)
function Class:initialize(data)
	BasePrinciple.initialize(self,data)
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
M.SORTED_CLASSES = create_sorted(M.CLASSES)
--endregion

--region WEAPON TYPES
---@class WeaponType:BasePrinciple
local WeaponType = COMMON.class("WeaponType",BasePrinciple)

M.WEAPON_TYPES = {
	SWORD = WeaponType({order=1,id="SWORD",image="sword",text_title="weapon_type_sword",text_description="weapon_type_sword_description"}),
	DAGGER = WeaponType({order=2,id="DAGGER",image="dagger",text_title="weapon_type_dagger",text_description="weapon_type_dagger_description"}),
	STAFF = WeaponType({order=3,id="STAFF",image="staff",text_title="weapon_type_staff",text_description="weapon_type_staff_description"}),
}
---@type WeaponType[]
M.SORTED_WEAPON_TYPES = create_sorted(M.WEAPON_TYPES)
--endregion

--region ARMOR TYPES
---@class ArmorType:BasePrinciple
local ArmorType = COMMON.class("ArmorType",BasePrinciple)


M.ARMOR_TYPES = {
	CLOTHES = ArmorType({order=1,id="CLOTHES",image="clothes",text_title="armor_type_clothes",text_description="armor_type_clothes_description"}),
	LIGHT = ArmorType({order=2,id="LIGHT",image="light",text_title="armor_type_light",text_description="armor_type_light_description"}),
	HEAVY = ArmorType({order=3,id="HEAVY",image="heavy",text_title="armor_type_heavy",text_description="armor_type_heavy_description"}),
}
---@type ArmorType[]
M.SORTED_ARMOR_TYPES = create_sorted(M.ARMOR_TYPES)
--endregion




--endregion
M.BasePrinciple = BasePrinciple
M.Alignment = Alignment
M.Race = Race
M.Class = Class
M.Skill = Skill
return COMMON.read_only_recursive(M)


