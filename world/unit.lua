local COMMON = require "libs.common"
local PRINCIPLES = require "world.principles"
local LUME = require "libs.lume"

---@class Attributes
---@field power number
---@field constitution number
---@field agility number
---@field hp number
---@field attack number
---@field defence number
---@field armor number

---@class Unit
---@field race Race
---@field class Class
---@field attributes Attributes
---@field skills Skill[]
local Unit = COMMON.class("Unit")

function Unit:initialize(data)
	assert(data)
	assert(data.race:isInstanceOf(PRINCIPLES.RACES.Race))
	assert(data.class:isInstanceOf(PRINCIPLES.Class))
	assert(data.alignment:isInstanceOf(PRINCIPLES.Alignment))
	self.attributes_scale = data.attributes_scale or 1
	self.race = data.race
	self.class = data.class
	self.alignment = data.alignment
	self.image = data.image or self.race.image
	self.title = data.title or self.race.text_title
	self.base_attributes = COMMON.read_only({
		power = (0 + self.race.attributes.power + self.class.attributes.power)*self.attributes_scale ,
		constitution = (0 + self.race.attributes.constitution + self.class.attributes.constitution)*self.attributes_scale ,
		agility = (0 + self.race.attributes.agility + self.class.attributes.agility)*self.attributes_scale,
	})
	self.level = data.level or 1
	self.hp_added = data.hp_added or 0
	self.hp_percent = data.hp_percent or 0
	self.skills = {}
	self:reset()

end

function Unit:recalculate_attributes()
	self.damage_percent = self.attributes.power * PRINCIPLES.ATTRIBUTES.POWER.damage_percent
	self.hp =  (38 + (self.level * 12) + self.attributes.constitution * PRINCIPLES.ATTRIBUTES.CONSTITUTION.hp  + self.hp_added) * (1 + self.hp_percent)
	self.defence = (53 + self.level * 3) + self.attributes.agility * PRINCIPLES.ATTRIBUTES.AGILITY.defence
	self.attack = 0 + self.level*2 + self.attributes.agility * PRINCIPLES.ATTRIBUTES.AGILITY.attack
	self.armor = 0
end

function Unit:update(dt)
	--skills not read_only
	for _,skill in ipairs(self.skills)do
		skill:update(dt)
	end
end

function Unit:is_alive()
	return self.hp > 0
end
function Unit:is_dead()
	return self.hp <= 0
end

---@param attacker Unit
---@param deffender Unit
function Unit.chance_to_hit(attacker, deffender)
	return LUME.clamp(attacker.attack / (attacker.attack + (deffender.defence/4)^0.8),0.05,0.95)
end
---@param attacker Unit
---@param deffender Unit
function Unit.damage_reduce(deffender, damage)
	assert(damage >=0)
	return deffender.armor/(deffender.armor + (damage*10))
end

---@param attacker Unit
---@param deffender Unit
function Unit.make_attack(attacker,deffender,damage)
	local hit = attacker:chance_to_hit(deffender)
	if math.random() <= hit then
		deffender:receive_damage(attacker:count_damage(deffender,damage))
	end
end
---@param attacker Unit
---@param deffender Unit
function Unit.count_damage(attacker,deffender,damage)
	assert(damage > 0)
	return damage * (1-deffender:damage_reduce(damage))
end

function Unit:receive_damage(damage)
	assert(damage>=0)
	self.hp = math.max(self.hp - damage,0)
end

function Unit:reset()
	for _,skill in ipairs(self.skills)do
		skill:reset()
	end
	self.attributes = LUME.clone(self.base_attributes.__VALUE)
	self:recalculate_attributes()
	self.current_hp = self.attributes.hp
end

function Unit:__tostring()
	return string.format("Unit:[race:%s class:%s alignment:%s level:%s power:%s constitution:%s agility:%s hp:%s attack:%s defence:%s armor:%s]",self.race.id,self.class.id,self.alignment.id, self.level
	,self.attributes.power,self.attributes.constitution,self.attributes.agility, self.hp, self.attack, self.defence, self.armor)
end






return Unit