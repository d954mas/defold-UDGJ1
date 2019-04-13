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

function Battle:update()

end

return Battle