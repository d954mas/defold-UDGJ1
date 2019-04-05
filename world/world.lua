local COMMON = require "libs.common"
local RX = require "libs.rx"
local STATE = require "world.state"

---@class World:Observable
local M = COMMON.class("World")

function M:reset()
end

function M:initialize()
	self.rx = RX.Subject()
	self.state = STATE
	self:reset()
end

function M:update(dt, no_save)
	for k,v in pairs(self.state) do
	end
end

function M:dispose()
	self:reset()
end

return M()