local COMMON = require "libs.common"
local RX = require "libs.rx"
local PRINCIPLES = require "world.principles"
local UNIT = require "world.unit"
local SKILLS = require "world.skills"

---@class HeroState
local M = COMMON.class("HeroState")


function M:initialize(race,class,alignment)
	self.unit = UNIT({race = race,class = class, alignment = alignment})
	self.unit.skills[1] = SKILLS.Strike()
end

function M:save()
	local t = {}
	t.race = self.unit.race.id
	t.class = self.unit.class.id
	t.alignment = self.unit.alignment.id
	return t
end

function M.load(t)
	return M(PRINCIPLES.RACES[t.race],PRINCIPLES.CLASSES[t.class],PRINCIPLES.ALIGNMENTS[t.alignment])
end

return M