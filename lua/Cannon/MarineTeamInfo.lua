
--local kTrackedMarineGadgets = debug.getupvaluex(MarineTeamInfo.UpdateUserTrackers, "kTrackedMarineGadgets")
--table.insert(kTrackedMarineGadgets, Cannon.kMapName)
--networkVars[TeamInfo_GetUserTrackerNetvarName(Cannon.kMapName)] = string.format("integer (0 to %d)", kMaxPlayers - 1)

local kTrackedMarineGadgets =
{
    Pistol.kMapName,
    Rifle.kMapName,
    Axe.kMapName,
    Welder.kMapName,
    Shotgun.kMapName,
    GrenadeLauncher.kMapName,
    Flamethrower.kMapName,
    HeavyMachineGun.kMapName,
    GasGrenadeThrower.kMapName,
    ClusterGrenadeThrower.kMapName,
    PulseGrenadeThrower.kMapName,
    LayMines.kMapName,
    Jetpack.kMapName,
    Cannon.kMapName,
}
local userTrackerNetVarDef = string.format("integer (0 to %d)", kMaxPlayers - 1)
local networkVars =
{
    numInfantryPortals = string.format("integer (0 to %d)", kMarineTeamInfoMaxInfantryPortalCount),
}
local kTrackedExoLayouts = IterableDict()
kTrackedExoLayouts[string.format("%s+%s", Minigun.kMapName, Minigun.kMapName)] = 1
kTrackedExoLayouts[string.format("%s+%s", Railgun.kMapName, Railgun.kMapName)] = 1

do
    for i = 1, #kTrackedMarineGadgets do
        networkVars[TeamInfo_GetUserTrackerNetvarName(kTrackedMarineGadgets[i])] = userTrackerNetVarDef
    end

    for k, _ in pairs(kTrackedExoLayouts) do

        local netvarName = TeamInfo_GetUserTrackerNetvarName(k)
        networkVars[netvarName] = userTrackerNetVarDef
    end
end


local origUserTracker = MarineTeamInfo.UpdateUserTrackers
function MarineTeamInfo:UpdateUserTrackersUpdateUserTrackers()
	Print("MarineTeamInfo")
	origUserTracker(self)
end



Shared.LinkClassToMap("MarineTeamInfo", MarineTeamInfo.kMapName, networkVars)