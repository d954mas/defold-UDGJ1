local COMMON = require "libs.common"
local RX = require "libs.rx"
local STATE = require "world.state.state"
local PRINCIPLES = require "world.principles"

---@class World:Observable
local M = COMMON.class("World")

function M:reset()
end

function M:initialize()
	self.PRINCIPLES = PRINCIPLES
	self.rx = RX.Subject()
	self.state = STATE
	self:reset()
end

function M:update(dt, no_save)
end

function M:dispose()
	self:reset()
end

return M()