local COMMON = require "libs.common"
local RX = require "libs.rx"
local PRINCIPLES = require "world.principles.principles"
local UNIT = require "world.principles.unit"
local SKILLS = require "world.principles.skills"

---@class HeroState
local M = COMMON.class("HeroState")


function M:initialize(race,class,alignment,start_attributes)
	self.unit = UNIT({race = assert(race),class = assert(class), alignment = assert(alignment),start_attributes = assert(start_attributes)})
	self.unit.skills[1] = SKILLS.Strike()
end

function M:save()
	local t = {}
	t.race = self.unit.race.id
	t.class = self.unit.class.id
	t.alignment = self.unit.alignment.id
	return t
end

function M.load(t,start_attributes)
	return M(PRINCIPLES.RACES.DATA[t.race],PRINCIPLES.CLASSES.DATA[t.class],PRINCIPLES.ALIGNMENTS.DATA[t.alignment],start_attributes)
end

return M