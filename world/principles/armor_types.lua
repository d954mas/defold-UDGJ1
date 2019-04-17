local COMMON = require "libs.common"
local BASE_PRINCIPLE = require "world.principles.base_principle"

local M = {}

--region ARMOR TYPES
---@class ArmorType:BasePrinciple
local ArmorType = COMMON.class("ArmorType",BASE_PRINCIPLE.BasePrinciple)
M.ArmorType = ArmorType

M.DATA = {
	CLOTHES = ArmorType({order=1,id="CLOTHES",image="clothes",text_title="armor_type_clothes",text_description="armor_type_clothes_description"}),
	LIGHT = ArmorType({order=2,id="LIGHT",image="light",text_title="armor_type_light",text_description="armor_type_light_description"}),
	HEAVY = ArmorType({order=3,id="HEAVY",image="heavy",text_title="armor_type_heavy",text_description="armor_type_heavy_description"}),
}
---@type ArmorType[]
M.SORTED_DATA =  BASE_PRINCIPLE.create_sorted(M.DATA)
--endregion

return M