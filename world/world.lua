local COMMON = require "libs.common"
local RX = require "libs.rx"
local STATE = require "world.state"
local PRINCIPLES = require "world.principles"

---@class World:Observable
local M = COMMON.class("World")

function M:reset()
end

function M:initialize()
	self.rx = RX.Subject()
	self.STATE = STATE
	self.PRINCIPLES = PRINCIPLES
	self:reset()
end

function M:update(dt, no_save)
end

function M:dispose()
	self:reset()
end

return M()