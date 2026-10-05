local BASE = "https://raw.githubusercontent.com/Ornzora/Xclusive-UI/main/Games/"

local function fetch(url)
	local ok, body = pcall(game.HttpGet, game, url)
	return ok and body or nil
end

local function exec(body)
	if body then
		local fn = loadstring(body)
		if fn then pcall(fn) end
	end
end

exec(fetch(BASE .. tostring(game.GameId) .. ".lua") or fetch(BASE .. "Universal.lua"))
