--// Services
local ServerScriptService = game:WaitForChild("ServerScriptService")

--// Modules
local EnemyHandler = require(ServerScriptService.EnemyHandler)

local enemy = EnemyHandler.new("Farmer")
enemy:spawn(Vector3.new(0, 10, 0))  --SPAWNS

