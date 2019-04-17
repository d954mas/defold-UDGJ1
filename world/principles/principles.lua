local COMMON = require "libs.common"

local M = {}
M.SKILLS = require "world.principles.skills"
M.RACES = require "world.principles.races"
M.CLASSES = require "world.principles.classes"
M.ATTRIBUTES = require "world.principles.attributes"
M.ALIGNMENTS = require "world.principles.alignments"


return COMMON.read_only_recursive(M)


