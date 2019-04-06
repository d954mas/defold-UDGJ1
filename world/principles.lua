local COMMON = require "libs.common"
local M = {}

local function create_sorted(t)
	local data = {}
	for k,v in pairs(t)do
		table.insert(data,v)
	end
	table.sort(data,function(a,b) return a.id < b.id end)
	return data
end

--region RACES
---@class Race
local Race = COMMON.class("Race")
function Race:initialize(id,image)
	self.id = assert(id)
	self.image = assert(image)
end


M.RACES = {
	human = Race(1,"human"),
	elf = Race(2,"elf"),
	gnome = Race(3,"gnome"),
}
---@type Race[]
M.SORTED_RACES = create_sorted(M.RACES)
--endregion

--region CLASSES
---@class Class
local Class = COMMON.class("CLASS")
function Class:initialize(id,image)
	self.id = assert(id)
	self.image = assert(image)
end


M.CLASSES = {
	warrior = Class(1,"warrior"),
	thief = Class(2,"thief"),
	mage = Class(3,"mage"),
}
---@type Class[]
M.SORTED_CLASSES = create_sorted(M.CLASSES)
--endregion

return COMMON.read_only_recursive(M)


