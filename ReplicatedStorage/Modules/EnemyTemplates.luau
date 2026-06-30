local ss = game:GetService("ServerStorage")
local enemyFolder = ss:WaitForChild("Enemies")

local enemyTemplates = {
	Dummy = {
		health = 100,
		speed = 16,
		damage = 5,
		attackRange = 5,
		sightRange = 50,
		behaviorType = "Dummy",
		respawnTime = 20, -- To prevent it from respawning, remove this line
		--attackAnimation = 115067823846471, (Uncomment this an add your own attack aninamation)
		
		model = enemyFolder.Dummy
	},
	RangedDummy = {
		health = 80,
		speed = 12,
		damage = 5,
		attackRange = 20,
		sightRange = 50,
		behaviorType = "Ranged",
		respawnTime = 20, -- To prevent it from respawning, remove this line
		--attackAnimation = 115067823846471, (Uncomment this an add your own attack aninamation)

		model = enemyFolder["Ranged Dummy"]
	},
	Farmer = {
		health = 80,
		speed = 30,
		damage = 5,
		attackRange = 5,
		sightRange = 50,
		behaviorType = "Farmer",
		respawnTime = 20, -- To prevent it from respawning, remove this line
		--attackAnimation = 115067823846471, (Uncomment this an add your own attack aninamation)

		model = enemyFolder["Farmer"]
	}
	
}

return enemyTemplates
