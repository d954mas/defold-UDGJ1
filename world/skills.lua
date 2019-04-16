local COMMON = require "libs.common"
local BASE_PRINCIPLE = require "world.base_principle"
---@class Skill:BasePrinciple
local Skill= COMMON.class("Skill",BASE_PRINCIPLE.BasePrinciple)

function Skill:_initialize(data)
	BASE_PRINCIPLE.BasePrinciple.initialize(self,data)
	self.speed = assert(data.speed)
	self.current_time = 0
	self.current_percent = 0
end

function Skill:can_activate()
	return self.current_percent == 1
end

function Skill:time_to_act()
	return self.speed - self.current_time
end

function Skill:update(dt)
	self.current_time = math.min(self.current_time + dt,self.speed)
	self.current_percent = self.current_time/self.speed
end

---@param owner Unit
---@param enemy Unit
function Skill:use(owner,enemy)
	self.current_time = 0
	self.current_percent = 0
end

function Skill:reset()
	self.current_time = 0
	self.current_percent = 0
end

---@class StrikeSill:Skill
local StrikeSill = COMMON.class("StrikeSkill",Skill)

function StrikeSill:initialize()
	Skill._initialize(self,{order=1,id="STRIKE",image="strike",text_title="skill_strike",text_description="skill_strike_description",speed = 0.5})
end

function StrikeSill:use(owner,enemy)
	Skill.use(self,owner,enemy)
	owner:make_attack(enemy,10)
end


local M = {}

M.Strike = StrikeSill

return M