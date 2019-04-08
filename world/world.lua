local COMMON = require "libs.common"
local RX = require "libs.rx"
local STATE = require "world.state.state"
local PRINCIPLES = require "world.principles"

local TAG = "World"

local RESET_SAVE = false

---@class World:Observable
local M = COMMON.class("World")

function M:reset()
end

function M:initialize()
	self.PRINCIPLES = PRINCIPLES
	self.rx = RX.Subject()
	self.state = STATE
	self.autosave = true
	self.autosave_dt = 0
	self.autosave_time = 10
	self:reset()
end

function M:update(dt)
	self:process_autosave(dt)
end

function M:process_autosave(dt)
	if self.autosave then
		self.autosave_dt = self.autosave_dt + dt
		if self.autosave_dt > self.autosave_time then
			self.autosave_dt = 0
			self:save()
		end
	end
end

function M:save()
	COMMON.i("save", TAG)
	local data = {state = self.state:save()}
	sys.save(sys.get_save_file("idle","data"), data)
end

function M:load()
	local data =  RESET_SAVE and {} or sys.load(sys.get_save_file("idle", "data"))
	if not data.state then return end
	self.state:load(data.state)
end

function M:dispose()
	self:reset()
end

return M()