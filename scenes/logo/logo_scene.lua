local BaseScene = require "libs.sm.scene"
local SM = require "libs.sm.sm"
local COMMON = require "libs.common"
local SM = require "libs.sm.sm"


---@class LogoScene:Scene
local Scene = BaseScene:subclass("LogoScene")
function Scene:initialize()
    BaseScene.initialize(self, "LogoScene", "/logo#proxy", "logo:/scene_controller")
end

function Scene:on_show(input)
end

function Scene:final(go_self)
end

function Scene:update(go_self, dt)
    BaseScene.update(self,go_self,dt)
end

function Scene:on_transition(transition)
    if transition == self.STATIC.TRANSITIONS.ON_SHOW then
        go.set("/logo#sprite","tint.w",0)
        go.animate("/logo#sprite","tint.w",go.PLAYBACK_ONCE_FORWARD,1,go.EASING_LINEAR,0.5)
        self._scheduler:schedule(function()
            SM:show("GameScene")
        end,1.5)
    elseif transition == self.STATIC.TRANSITIONS.ON_HIDE then
        local wait = true
        go.set("/logo#sprite","tint.w",1)
        go.animate("/logo#sprite","tint.w",go.PLAYBACK_ONCE_FORWARD,0,go.EASING_LINEAR,0.5,0,function()
            wait = false
        end)
        while wait do
            coroutine.yield()
        end
    end--]]
end

return Scene