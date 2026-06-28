local BehaviorTree = require(script.Parent.BehaviorTree)
local Selector = require(script.Parent.Nodes.Composite_Selector)
local Sequence = require(script.Parent.Nodes.Composite_Sequence)
local CanSeePlayer = require(script.Parent.Nodes.Condition_CanSeePlayer)
local MoveTo = require(script.Parent.Nodes.Action_MoveTo)
local FaceTarget = require(script.Parent.Nodes.Action_FaceTarget)
local Attack = require(script.Parent.Nodes.Action_Attack)
local Idle = require(script.Parent.Nodes.Action_Idle)

return function(damage, attackRange, sightRange, attackAnimation)
	local root = Selector.new({
		Sequence.new({
			CanSeePlayer.new(sightRange),
			MoveTo.new(attackRange),
			FaceTarget.new(),
			Attack.new(damage, attackRange, 0.8, attackAnimation)
		}),
		Idle.new()
	})
	return BehaviorTree.new(root)
end