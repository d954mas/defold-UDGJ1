local COMMON = require "libs.common"

local Battle = COMMON.class("Battle")

---@param hero Unit
function Battle:set_hero(hero)
	self.hero = assert(hero)
end
---@param enemy EnemyUnit
function Battle:set_enemy(enemy)
	self.enemy = assert(enemy)
end

---@param world World
function Battle:set_world(world)
	self.world = world
end

function Battle:update(dt)
	if not self.hero or not self.enemy then return end
	if self.hero:is_dead() then
		self.hero:reset()
	end
	if self.enemy:is_dead() then
		self.world:enemy_killed(self.enemy)
		self.enemy:reset()
	end
	if not(self.hero:is_alive() and self.enemy:is_alive())then return end

	self.hero:update(dt)
	for _,skill in ipairs(self.hero.skills)do
		if skill:can_activate() then
			skill:use(self.hero,self.enemy)
		end
	end

	if self.enemy:is_alive() then
		self.enemy:update(dt)
		for _,skill in ipairs(self.enemy.skills)do
			if skill:can_activate() then
				skill:use(self.enemy,self.hero)
			end
		end
	end

end

return Battle