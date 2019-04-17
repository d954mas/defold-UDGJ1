local COMMON = require "libs.common"
local M = {}

function  M.create_sorted(t)
	local data = {}
	for _,v in pairs(t)do
		table.insert(data,v)
	end
	table.sort(data,function(a,b) return a.order < b.order end)
	return data
end

---@class BasePrinciple
local BasePrinciple = COMMON.class("BasePrinciple")
function BasePrinciple:initialize(data)
	assert(data)
	self.order = assert(data.order)
	self.id = assert(data.id)
	self.image = assert(data.image)
	self.text_title = assert(data.text_title)
	self.text_description = assert(data.text_description)
	COMMON.LOCALE:locale_exist(self.text_title)
	COMMON.LOCALE:locale_exist(self.text_description)
end

M.BasePrinciple = BasePrinciple

return M