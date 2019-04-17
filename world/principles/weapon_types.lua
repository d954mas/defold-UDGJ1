local COMMON = require "libs.common"
local BASE_PRINCIPLE = require "world.principles.base_principle"

local M = {}

--region WEAPON TYPES
---@class WeaponType:BasePrinciple
local WeaponType = COMMON.class("WeaponType",BASE_PRINCIPLE.BasePrinciple)
M.WeaponType = WeaponType
M.DATA = {
	SWORD = WeaponType({order=1,id="SWORD",image="sword",text_title="weapon_type_sword",text_description="weapon_type_sword_description"}),
	DAGGER = WeaponType({order=2,id="DAGGER",image="dagger",text_title="weapon_type_dagger",text_description="weapon_type_dagger_description"}),
	STAFF = WeaponType({order=3,id="STAFF",image="staff",text_title="weapon_type_staff",text_description="weapon_type_staff_description"}),
}
---@type WeaponType[]
M.SORTED_DATA =  BASE_PRINCIPLE.create_sorted(M.DATA)
--endregion

return M