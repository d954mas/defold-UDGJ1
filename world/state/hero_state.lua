local COMMON = require "libs.common"
local RX = require "libs.rx"
local PRINCIPLES = require "world.principles"

---@class HeroState
---@field race Race
---@field class Class
---@field alignment Alignment
local M = COMMON.class("HeroState")


function M:initialize(race,class,alignment)
	assert(race:isInstanceOf(PRINCIPLES.Race))
	assert(class:isInstanceOf(PRINCIPLES.Class))
	assert(alignment:isInstanceOf(PRINCIPLES.Alignment))
	self.race =  race
	self.class =  class
	self.alignment =  alignment
end

function M:save()
	local t = {}
	t.race = self.race.id
	t.class = self.class.id
	t.alignment = self.alignment.id
	return t
end

function M.load(t)
	return M(PRINCIPLES.RACES[t.race],PRINCIPLES.CLASSES[t.class],PRINCIPLES.ALIGNMENTS[t.alignment])
end

return M