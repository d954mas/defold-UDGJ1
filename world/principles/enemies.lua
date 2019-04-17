local COMMON = require "libs.common"
local Unit = require "world.principles.unit"
local Principles = require "world.principles.principles"
local SKILLS = require "world.principles.skills"

---@class EnemyUnit:Unit
local Enemy = COMMON.class("EnemyUnit",Unit)

function Enemy:initialize(data)
	Unit.initialize(self,{race = Principles.RACES.DATA.HUMAN,class = Principles.CLASSES.DATA.WARRIOR, alignment = Principles.ALIGNMENTS.DATA.EVIL,title = assert(data.title),
	image = assert(data.image),attributes_scale = 0.5,start_attributes = {power = 5, agility = 5, constitution = 5}})
	self.gold = assert(data.gold)
	self.exp = assert(data.exp)
	self.skills[1] = SKILLS.Strike()
end



---@type EnemyUnit[]
local Enemies = {
	Enemy({hp = 50, gold = 64,exp = 1, image = "wolf",title = "enemy_wolf"}),
	Enemy({hp = 139, gold = 128,exp = 1, image = "adder",title = "enemy_adder"}),
	Enemy({hp = 328, gold = 200,exp = 1, image = "anaconda",title = "enemy_anaconda"}),
	Enemy({hp = 670, gold = 277,exp = 1, image = "fire_crab",title = "enemy_crab"}),
	Enemy({hp = 1230, gold = 362,exp = 1, image = "killer_bee",title = "enemy_bee"}),
	Enemy({hp = 2087, gold = 454,exp = 1, image = "snapping_turtle",title = "enemy_turtle"}),
	Enemy({hp = 3329, gold = 557,exp = 1, image = "wolf",title = "enemy_wolf"}),
	Enemy({hp = 5065, gold = 665,exp = 1, image = "adder",title = "enemy_adder"}),
	Enemy({hp = 7419, gold = 783,exp = 1, image = "anaconda",title = "enemy_anaconda"}),
	Enemy({hp = 10535, gold = 909,exp = 1, image = "fire_crab",title = "enemy_crab"}),
	Enemy({hp = 14579, gold = 1045,exp = 1, image = "killer_bee",title = "enemy_bee"}),
	Enemy({hp = 19741, gold = 1189,exp = 1, image = "snapping_turtle",title = "enemy_turtle"}),
	Enemy({hp = 26240, gold = 1344,exp = 1, image = "adder",title = "enemy_adder"}),
	Enemy({hp = 34321, gold = 1506,exp = 1, image = "anaconda",title = "enemy_anaconda"}),
	Enemy({hp = 44268, gold = 1678,exp = 1, image = "fire_crab",title = "enemy_crab"}),
	Enemy({hp = 56398, gold = 1858,exp = 1, image = "killer_bee",title = "enemy_bee"}),
}

return Enemies
