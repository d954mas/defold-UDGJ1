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
local Unit = COMMON.class("Unit")

function Unit:initialize(data)
	assert(data)
	assert(data.race:isInstanceOf(PRINCIPLES.Race))
	assert(data.class:isInstanceOf(PRINCIPLES.Class))
	assert(data.alignment:isInstanceOf(PRINCIPLES.Alignment))
	self.race = data.race
	self.class = data.class
	self.alignment = data.alignment
	self.base_attributes = COMMON.read_only({
		power = 0 + self.race.attributes.power + self.class.attributes.power ,
		constitution = 0 + self.race.attributes.constitution + self.class.attributes.constitution ,
		agility = 0 + self.race.attributes.agility + self.class.attributes.agility,
	})
	self.level = data.level or 1
	self.hp_added = data.hp_added or 0
	self.hp_percent = data.hp_percent or 0
	self.attributes = LUME.clone(self.base_attributes.__VALUE)
	self:recalculate_attributes()
end

function Unit:recalculate_attributes()
	self.damage_percent = self.attributes.power * PRINCIPLES.ATTRIBUTES.POWER.damage_percent
	self.attributes.hp =  (38 + (self.level * 12) + self.attributes.constitution * PRINCIPLES.ATTRIBUTES.CONSTITUTION.hp  + self.hp_added) * (1 + self.hp_percent)
	self.defence = (53 + self.level * 3) * self.attributes.agility * PRINCIPLES.ATTRIBUTES.AGILITY.defence
	self.attack = 0 + self.level*2 + self.attributes.agility * PRINCIPLES.ATTRIBUTES.AGILITY.attack
	self.armor = 0
end

function Unit:update(dt)

end


---@param attacker Unit
---@param deffender Unit
function Unit.chance_to_hit(attacker, deffender, skill)
	return LUME.clamp(attacker.attack / (attacker.attack + (deffender.defence/4)^0.8),0.05,0.95)
end
---@param attacker Unit
---@param deffender Unit
function Unit.damage_reduce(attacker, deffender, damage, skill)
	return deffender.armor/(deffender.armor + (damage*10))
end	






return Unit