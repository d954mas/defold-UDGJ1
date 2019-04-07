local I18N = require "libs.i18n.init"
local COMMON = require "libs.common"
local TAG = "LOCALIZATION"
local LOCALES ={"en","ru"}
local DEFAULT = "ru"
local FALLBACK = "ru"

---@class Localization
local M = {
	--region RACE
	race_dwarf = {ru = "дворф",en="dwarf"},
	race_dwarf_description = {ru = "могу копать, могу не копать"},
	race_human = {ru = "человек"},
	race_human_description = {ru = "я человек"},
	race_elf = {ru = "эльф"},
	race_elf_description = {ru = "я эльф"},
	--endregion
	--region CLASS
	class_warrior = {ru = "воин"},
	class_warrior_description = {ru = "бить врагов"},
	class_mage = {ru = "маг"},
	class_mage_description = {ru = "кастовать магию"},
	class_thief = {ru = "вор"},
	class_thief_description = {ru = "убивать в спину"},
	--endregion
	--region ALIGNMENT
	alignment_good = {ru = "добро"},
	alignment_good_description = {ru = "я добро"},
	alignment_neutral = {ru = "нейтрал"},
	alignment_neutral_description = {ru = "я нейтрал"},
	alignment_evil = {ru = "зло"},
	alignment_evil_description = {ru = "я зло"},
	--endregion
	--region COMMON
	common_not_selected =  {ru = "не выбрано"},
	--endregion
	create_hero_total =  {ru = "Раса: %{race}\n\nКласс: %{class}\n\nМировозрение: %{alignment}"},

}

function M:locale_exist(key)
	local locale = self[key]
	if not locale then
		COMMON.w("key:" .. key .. " not found",TAG)
	end
end

I18N.setFallbackLocale(FALLBACK)
I18N.setLocale(DEFAULT)

for _,locale in ipairs(LOCALES)do
	local table ={}
	for k,v in pairs(M)do
		if type(v)~= "function" then
			table[k] = v[locale]
		end
	end
	I18N.load({[locale]=table})
end

for k,v in pairs(M)do
	if type(v)~= "function" then
		M[k] = function(data)
			return I18N(k,data)
		end
	end
end


--fix cycle dependencies
local t = COMMON.read_only(M)
COMMON.LOCALE = t

return t
