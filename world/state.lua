local COMMON = require "libs.common"
local RX = require "libs.rx"

---@class State
local M = {}
M.level = 2
M.equipment = {
 [1] = 2,
 [2] = 2,
}

print("SIZE:" .. #M.equipment)

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