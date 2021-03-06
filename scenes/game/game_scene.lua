local BaseScene = require "libs.sm.scene"
local SM = require "libs.sm.sm"
local COMMON = require "libs.common"

---@class GameScene:Scene
local Scene = BaseScene:subclass("GameScene")
function Scene:initialize()
    BaseScene.initialize(self, "GameScene", "/game#proxy", "game:/scene_controller")
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