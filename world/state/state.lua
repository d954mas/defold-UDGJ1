local COMMON = require "libs.common"
local RX = require "libs.rx"
local HeroState = require "world.state.hero_state"

local START_ATTRIBUTES = {
	power = 5,
	agility = 5,
	constitution = 5
}

local VERSION = 3

---@class State
---@field hero HeroState|nil
---@field __VALUE State
local M = {}

function M:create_hero(race,class,alignment)
	assert(not self.hero, "hero alredy created")
	self.__VALUE.hero = HeroState(race,class,alignment,START_ATTRIBUTES)
end

function M:load(t)
	if t.version < VERSION then
		self:init_default()
		return
	end
	self = self.__VALUE or self
	self.user = {
		exp = assert(t.user.exp),
		lvl = assert(t.user.lvl)
	}
	self.resources = {
		souls = assert(t.resources.souls),
		gems = assert(t.resources.gems),
		gold = assert(t.resources.gold),
	}
	self.current_stage = assert(t.current_stage)
	self.hero = t.hero and HeroState.load(t.hero,START_ATTRIBUTES)
	self:update_user_attributes()
end

function M:init_default()
	self = self.__VALUE or self
	self.current_stage = 1
	self.user = {
		exp = 0,
		lvl = 1,
	}
	self.resources = {
		souls = 0,
		gems = 0,
		gold = 0
	}
	self:update_user_attributes()
end

--recalculate user attributes. Use it when attributes changed(for expample after achievments or evolution or reuncarnation)
function M:update_user_attributes()
	self = self.__VALUE or self
	self.user.attributes = {
		power = START_ATTRIBUTES.power,
		agility = START_ATTRIBUTES.agility,
		constitution = START_ATTRIBUTES.constitution
	}
end

function M:save()
	local t = {}
	t.current_stage = M.current_stage
	t.resources = {
		souls = self.resources.souls,
		gems = self.resources.gems,
		gold = self.resources.gold,
	}
	t.user = {
		exp = self.user.exp,
		lvl = self.user.lvl
	}
	t.version = VERSION
	t.hero = self.hero and self.hero:save()
	return t
end

function M:increase_level()
end

function M:add_gold(gold)
	assert(gold >= 0)
	self.__VALUE.resources.gold = self.__VALUE.resources.gold + gold
end


return COMMON.read_only(M)