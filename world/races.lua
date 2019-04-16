local COMMON = require "libs.common"
local BASE_PRINCIPLE = require "world.base_principle"

local M = {}

---@class Race
local Race = COMMON.class("Race",BASE_PRINCIPLE.BasePrinciple)

function Race:initialize(data)
	BASE_PRINCIPLE.BasePrinciple.initialize(self,data)
	self.attributes = {
		power = data.power,
		constitution = data.constitution,
		agility = data.agility,
	}
	self.playable = assert(data.playable) --user can use that race
end
M.Race = Race
M.DATA = {
	HUMAN = Race({order=1,id="HUMAN",image="human",text_title="race_human",text_description="race_human_description",power = 1, agility = 1, constitution = 1,playable = true}),
	ELF = Race({order=2,id="ELF",image="elf",text_title="race_elf",text_description="race_elf_description",power = 1.15, agility = 1.15, constitution = 0.7,playable = true}),
	DWARF = Race({order=3,id="DWARF",image="dwarf",text_title="race_dwarf",text_description="race_dwarf_description",power = 1.15, agility = 0.7, constitution = 1.15,playable = true}),
}
---@type Race[]
M.SORTED_DATA = BASE_PRINCIPLE.create_sorted(M.DATA)
M.PLAYABLE = COMMON.LUME.filter(M.SORTED_DATA,function (v) return v.playable end)

return M