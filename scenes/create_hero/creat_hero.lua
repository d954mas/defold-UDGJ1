local BaseScene = require "libs.sm.scene"
local SM = require "libs.sm.sm"
local COMMON = require "libs.common"

---@class CreateHeroScene:Scene
local Scene = BaseScene:subclass("CreateHeroScene")
function Scene:initialize()
    BaseScene.initialize(self, "CreateHeroScene", "/create_hero#proxy", "create_hero:/scene_controller")
end

function Scene:on_show(input)
end

function Scene:final(go_self)
end

function Scene:update(go_self, dt)
    BaseScene.update(self,go_self,dt)
end

function Scene:on_transition(transition)
end

return Scene