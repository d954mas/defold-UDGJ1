local I18N = require "libs.i18n.init"
local COMMON = require "libs.common"

local LOCALES ={"en","ru"}
local DEFAULT = "ru"
local FALLBACK = "ru"

---@class Localization
local M = {
	race_dwarf = {ru = "дворф",en="dwarf"},
	race_dwarf_description = {ru = "Могу копать, могу не копать"},
	race_human = {ru = "человек"},
	race_human_description = {ru = "Я человек"},
	race_elf = {ru = "эльф"},
	race_elf_description = {ru = "Я эльф"},
}

I18N.setFallbackLocale(FALLBACK)
I18N.setLocale(DEFAULT)

for _,locale in ipairs(LOCALES)do
	local table ={}
	for k,v in pairs(M)do
		table[k] = v[locale]
	end
	I18N.load({[locale]=table})
end

for k,v in pairs(M)do
	M[k] = function(data)
		return I18N(k,data)
	end
end

--fix cycle dependencies
local t = COMMON.read_only(M)
COMMON.LOCALE = t

return t
