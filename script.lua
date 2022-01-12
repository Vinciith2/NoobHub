
local URL = "https://solarishub.dev/games"

local games = {
	[292439477] = "Phantom Forces",
}

for i,v in next, games do
	games[i] = table.concat(v:split(' '), '_')
end

local name = games[game.PlaceId] or games[game.GameId]

return loadstring(game:HttpGet(URL .. "/" .. (name or "Universal") .. ".lua", true))()