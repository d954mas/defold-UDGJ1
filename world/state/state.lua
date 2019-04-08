local COMMON = require "libs.common"
local RX = require "libs.rx"
local HeroState = require "world.state.hero_state"

---@class State
---@field hero HeroState|nil
---@field __VALUE State
local M = {}

M.souls = 0 --reincarnation gold
M.gems = 0
M.gold = 0
M.exp = 0
M.lvl = 1
M.current_stage = 1



function M:create_hero(race,class,alignment)
	assert(not self.hero, "hero alredy created")
	self.__VALUE.hero = HeroState(race,class,alignment)
end

function M:load(t)
	self.__VALUE.souls = t.souls or 0
	self.__VALUE.gems = t.gems or 0
	self.__VALUE.gold = t.gold or 0
	self.__VALUE.exp = t.exp or 0
	self.__VALUE.lvl = t.lvl or 1
	self.__VALUE.current_stage = t.current_stage or 1
	self.__VALUE.hero = t.hero and HeroState.load(t.hero)
end

function M:save()
	local t = {}
	t.souls = M.souls
	t.gems = M.gems
	t.gold = M.gold
	t.exp = M.exp
	t.lvl = M.lvl
	t.current_stage = M.current_stage
	t.hero = self.hero and self.hero:save()
	return t
end

function M:increase_level()
end

function M:dispose()
	self:reset()
end

return COMMON.read_only_recursive(M)