--Set up the networkvar so that GUIMarineBuyMenu can track the number of cannons.

if Server then
	local kTrackedMarineGadgets = debug.getupvaluex(MarineTeamInfo.UpdateUserTrackers, "kTrackedMarineGadgets")
	table.insert(kTrackedMarineGadgets, Cannon.kMapName)
end

local networkVars =
{
}

networkVars[TeamInfo_GetUserTrackerNetvarName(Cannon.kMapName)] = string.format("integer (0 to %d)", kMaxPlayers - 1)

Shared.LinkClassToMap("MarineTeamInfo", MarineTeamInfo.kMapName, networkVars)

