print('script_server:hello world')
local MovePlatform = require "script_server.MovePlatform"

local Map = World:GetStaticMap("map001")

local timer = Timer.new(160, function()
    MovePlatform:Start(map)
    
  end)

timer:Start()
