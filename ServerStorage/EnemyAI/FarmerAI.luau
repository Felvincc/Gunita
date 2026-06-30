local BehaviorTree = require(script.Parent.Parent.BehaviorTrees)
local Selector = require(script.Parent.Parent.BehaviorTrees.Nodes.Composite_Selector)
local Sequence = require(script.Parent.Parent.BehaviorTrees.Nodes.Composite_Sequence)
local CanSeePlayer = require(script.Parent.Parent.BehaviorTrees.Nodes.Condition_CanSeePlayer)
local MoveTo = require(script.Parent.Parent.BehaviorTrees.Nodes.Action_MoveTo)
local FaceTarget = require(script.Parent.Parent.BehaviorTrees.Nodes.Action_FaceTarget)
local Attack = require(script.Parent.Parent.BehaviorTrees.Nodes.Action_Attack)
local Idle = require(script.Parent.Parent.BehaviorTrees.Nodes.Action_Idle)

return function(damage, attackRange, sightRange, attackAnimation)
	local root = Selector.new({
		Sequence.new({
			CanSeePlayer.new(sightRange),
			FaceTarget.new(),
			Attack.new(damage, attackRange, 0.5, attackAnimation)
		}),
		Idle.new()
	})
	return BehaviorTree.new(root)
end