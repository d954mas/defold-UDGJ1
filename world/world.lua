local COMMON = require "libs.common"
local RX = require "libs.rx"

---@class World:Observable
local M = COMMON.class("World")

function M:reset()
end

function M:initialize()
	self.rx = RX.Subject()
	self:reset()
end

function M:update(dt, no_save)
	
end

function M:dispose()
	self:reset()
end

return M()