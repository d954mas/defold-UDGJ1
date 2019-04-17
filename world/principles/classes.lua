local COMMON = require "libs.common"
local BASE_PRINCIPLE = require "world.principles.base_principle"

local M = {}

---@class Class
local Class = COMMON.class("Class",BASE_PRINCIPLE.BasePrinciple)
function Class:initialize(data)
	BASE_PRINCIPLE.BasePrinciple.initialize(self,data)
	self.attributes = {
		power = assert(data.power),
		constitution = assert(data.constitution),
		agility = assert(data.agility) ,
	}
	self.playable = assert(data.playable) --user can use that race
end
M.Class = Class
M.DATA = {
	WARRIOR = Class({order=1,id="WARRIOR",image="warrior",text_title="class_warrior",text_description="class_warrior_description"
					,power = 0.8, agility = 0.8, constitution = 0.8,playable = true}),
	THIEF = Class({order=2,id="THIEF",image="thief",text_title="class_thief",text_description="class_thief_description"
				  ,power = 0.8, agility = 1, constitution = 0.6,playable = true}),
	MAGE = Class({order=3,id="MAGE",image="mage",text_title="class_mage",text_description="class_mage_description",
				  power = 1, agility = 0.8, constitution = 0.6,playable = true}),
}
---@type Class[]
M.SORTED_DATA =  BASE_PRINCIPLE.create_sorted(M.DATA)
M.PLAYABLE = COMMON.LUME.filter(M.SORTED_DATA,function (v) return v.playable end)

return M