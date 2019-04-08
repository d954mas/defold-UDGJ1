local COMMON = require "libs.common"

---@class Enemy
local Enemy = COMMON.class("Enemy")

function Enemy:initialize(data)
	self.hp = assert(data.hp)
	self.money = assert(data.money)
	self.exp = assert(data.exp)
	self.image = assert(data.image)
end




local Enemies = {
	Enemy({hp = 50, gold = 64,exp = 1, image = "wolf"}),
	Enemy({hp = 139, gold = 128,exp = 1, image = "adder"}),
	Enemy({hp = 328, gold = 200,exp = 1, image = "anaconda"}),
	Enemy({hp = 670, gold = 277,exp = 1, image = "fire_crab"}),
	Enemy({hp = 1230, gold = 362,exp = 1, image = "killer_bee"}),
	Enemy({hp = 2087, gold = 454,exp = 1, image = "snapping_turtle"}),
	Enemy({hp = 3329, gold = 557,exp = 1, image = "wolf"}),
	Enemy({hp = 5065, gold = 665,exp = 1, image = "adder"}),
	Enemy({hp = 7419, gold = 783,exp = 1, image = "anaconda"}),
	Enemy({hp = 10535, gold = 909,exp = 1, image = "fire_crab"}),
	Enemy({hp = 14579, gold = 1045,exp = 1, image = "killer_bee"}),
	Enemy({hp = 19741, gold = 1189,exp = 1, image = "snapping_turtle"}),
	Enemy({hp = 26240, gold = 1344,exp = 1, image = "adder"}),
	Enemy({hp = 34321, gold = 1506,exp = 1, image = "anaconda"}),
	Enemy({hp = 44268, gold = 1678,exp = 1, image = "fire_crab"}),
	Enemy({hp = 56398, gold = 1858,exp = 1, image = "killer_bee"}),
}

return Enemies
