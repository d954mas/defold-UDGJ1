local COMMON = require "libs.common"
local RX = require "libs.rx"
local HeroState = require "world.state.hero_state"

---@class State
---@field hero HeroState|nil
---@field __VALUE State
local M = {}
M.level = 2
M.equipment = {
 [1] = 2,
 [2] = 2,
}

function M:create_hero(race,class,alignment)
	assert(not self.hero, "hero alredy created")
	self.__VALUE.hero = HeroState(race,class,alignment)
end

function M:load()
end

function M:save()
end

function M:increase_level()
end

function M:dispose()
	self:reset()
end

return COMMON.read_only_recursive(M)