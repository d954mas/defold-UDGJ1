local COMMON = require "libs.common"
local RX = require "libs.rx"
local PRINCIPLES = require "world.principles"

---@class HeroState
local M = COMMON.class("HeroState")


function M:initialize(race,class,alignment)
	assert(race:isInstanceOf(PRINCIPLES.Race))
	assert(class:isInstanceOf(PRINCIPLES.Class))
	assert(alignment:isInstanceOf(PRINCIPLES.Alignment))
	self.race =  race
	self.class =  class
	self.alignment =  alignment
end

return M