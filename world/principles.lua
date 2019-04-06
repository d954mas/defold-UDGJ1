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

--region ALIGNMENTS
---@class Alignment
local Alignment = COMMON.class("Alignment")
function Alignment:initialize(data)
	assert(data)
	self.order = assert(data.order)
	self.id = assert(data.id)
	self.image = assert(data.image)
end

M.ALIGNMENTS = {
	EVIL = Alignment({order=1,id="EVIL",image="evil"}),
	NEUTRAL = Alignment({order=2,id="NEUTRAL",image="neutral"}),
	GOOD = Alignment({order=3,id="GOOD",image="good"}),
}
---@type Alignment[]
M.SORTED_ALIGNMENTS = create_sorted(M.ALIGNMENTS)
--endregion

--region RACES
---@class Race
local Race = COMMON.class("Race")
function Race:initialize(data)
	assert(data)
	self.order = assert(data.order)
	self.id = assert(data.id)
	self.image = assert(data.image)
	self.text_title = assert(data.text_title)
	self.text_description = assert(data.text_description)
end

M.RACES = {
	HUMAN = Race({order=1,id="HUMAN",image="human",text_title="race_human",text_description="race_human_description"}),
	ELF = Race({order=2,id="ELF",image="elf",text_title="race_elf",text_description="race_elf_description"}),
	DWARF = Race({order=3,id="DWARF",image="dwarf",text_title="race_dwarf",text_description="race_dwarf_description"}),
}
---@type Race[]
M.SORTED_RACES = create_sorted(M.RACES)
--endregion

--region CLASSES
---@class Class
local Class = COMMON.class("CLASS")
function Class:initialize(data)
	assert(data)
	self.order = assert(data.order)
	self.id = assert(data.id)
	self.image = assert(data.image)
end


M.CLASSES = {
	WARRIOR = Class({order=1,id="WARRIOR",image="warrior"}),
	THIEF = Class({order=2,id="THIEF",image="thief"}),
	MAGE = Class({order=3,id="MAGE",image="mage"}),
}
---@type Class[]
M.SORTED_CLASSES = create_sorted(M.CLASSES)
--endregion

--region WEAPON TYPES
---@class WeaponType
local WeaponType = COMMON.class("WeaponType")
function WeaponType:initialize(data)
	assert(data)
	self.order = assert(data.order)
	self.id = assert(data.id)
	self.image = assert(data.image)
end

M.WEAPON_TYPES = {
	SWORD = WeaponType({order=1,id="SWORD",image="sword"}),
	DAGGER = WeaponType({order=2,id="DAGGER",image="dagger"}),
	STAFF = WeaponType({order=3,id="STAFF",image="staff"}),
}
---@type WeaponType[]
M.SORTED_WEAPON_TYPES = create_sorted(M.WEAPON_TYPES)
--endregion

--region ARMOR TYPES
---@class ArmorType
local ArmorType = COMMON.class("ArmorType")
function ArmorType:initialize(data)
	assert(data)
	self.order = assert(data.order)
	self.id = assert(data.id)
	self.image = assert(data.image)
end

M.ARMOR_TYPES = {
	CLOTHES = ArmorType({order=1,id="CLOTHES",image="clothes"}),
	LIGHT = ArmorType({order=2,id="LIGHT",image="light"}),
	HEAVY = ArmorType({order=3,id="HEAVY",image="heavy"}),
}
---@type ArmorType[]
M.SORTED_ARMOR_TYPES = create_sorted(M.ARMOR_TYPES)
--endregion
return COMMON.read_only_recursive(M)


