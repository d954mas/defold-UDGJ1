local COMMON = require "libs.common"
local BASE_PRINCIPLE = require "world.principles.base_principle"

local M = {}

--region ALIGNMENTS
---@class Alignment:BasePrinciple
local Alignment = COMMON.class("Alignment",BASE_PRINCIPLE.BasePrinciple)
M.Alignment = Alignment
M.DATA = {
	EVIL = Alignment({order=1,id="EVIL",image="evil",text_title="alignment_evil",text_description="alignment_evil_description"}),
	NEUTRAL = Alignment({order=2,id="NEUTRAL",image="neutral",text_title="alignment_neutral",text_description="alignment_neutral_description"}),
	GOOD = Alignment({order=3,id="GOOD",image="good",text_title="alignment_good",text_description="alignment_good_description"}),
}
---@type Alignment[]
M.SORTED_DATA=  BASE_PRINCIPLE.create_sorted(M.DATA)
--endregion

return M