
local kStatusTranslationStringMap = debug.getupvaluex(Scoreboard_ReloadPlayerData, "kStatusTranslationStringMap")

kStatusTranslationStringMap[kPlayerStatus.Cannon]="Cannon"

debug.setupvaluex( Scoreboard_ReloadPlayerData, "kStatusTranslationStringMap", kStatusTranslationStringMap)