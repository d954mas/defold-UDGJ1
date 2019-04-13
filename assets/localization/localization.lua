local I18N = require "libs.i18n.init"
local COMMON = require "libs.common"
local TAG = "LOCALIZATION"
local LOCALES ={"en","ru"}
local DEFAULT = "en"
local FALLBACK = "ru"

---@class Localization
local M = {
	--region RACE
	race_dwarf = {ru = "дворф",en="dwarf"},
	race_dwarf_description = {ru = "могу копать, могу не копать",en="dwarf"},
	race_human = {ru = "человек",en="human"},
	race_human_description = {ru = "я человек",en="human"},
	race_elf = {ru = "эльф",en="elf"},
	race_elf_description = {ru = "я эльф",en="elf"},
	--endregion
	--region CLASS
	class_warrior = {ru = "воин","warrior"},
	class_warrior_description = {ru = "бить врагов",en="warrior"},
	class_mage = {ru = "маг",en="mage"},
	class_mage_description = {ru = "кастовать магию",en="mage"},
	class_thief = {ru = "вор",en="thief"},
	class_thief_description = {ru = "убивать в спину",en="thief"},
	--endregion
	--region ALIGNMENT
	alignment_good = {ru = "добро",en="good"},
	alignment_good_description = {ru = "я добро",en="good"},
	alignment_neutral = {ru = "нейтрал",en="neutral"},
	alignment_neutral_description = {ru = "я нейтрал",en="neutral"},
	alignment_evil = {ru = "зло",en="evil"},
	alignment_evil_description = {ru = "я зло",en="evil"},
	--endregion
	--region COMMON
	common_not_selected =  {ru = "не выбрано",en="not selected"},
	hp = {ru = "HP:%{hp}"},
	unit_base_info = {ru = "ATK:%{atk}\nDEF:%{def}\nARM:%{arm}"},
	--endregion
	create_hero_total =  {ru = "Раса: %{race}\n\nКласс: %{class}\n\nМировозрение: %{alignment}",
						  en = "Race: %{race}\n\nClass: %{class}\n\nAlignment: %{alignment}"},
	--region ENEMIES
	enemy_wolf = {ru = "волк",en = "wolf"},
	enemy_adder = {ru = "гадюка",en = "adder"},
	enemy_anaconda = {ru = "анаконда",en = "anaconda"},
	enemy_crab = {ru = "краб",en = "crab"},
	enemy_bee = {ru = "пчела",en = "bee"},
	enemy_turtle = {ru = "черепаха",en = "turtle"},
	--endregion
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

--return key if value not founded
local t  = setmetatable( {__VALUE = M,}, {
	__index = function(_, k)
		local result = M[k]
		if not result then
			COMMON.w("no key:" .. k,TAG )
			result = function() return k end
			M[k] = result
		end
		return result
	end,
	__newindex = function() error( "table is readonly", 2 ) end,
} )

--fix cycle dependencies
COMMON.LOCALE = t

return t
