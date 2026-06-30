local RunService = game:GetService("RunService")
local Camera = workspace.CurrentCamera

-- Configuration
local TIME_WINDOW = 2 -- Seconds allowed to complete the turn and back
local turnCounter = 0

-- Tracking variables
local originalLookVector = Camera.CFrame.LookVector
local reachedOpposite = false
local turnStartTime = 0

RunService.RenderStepped:Connect(function()
	local currentLookVector = Camera.CFrame.LookVector
	

	-- calculate how aligned the current and orignal vectors are (+1 being similar, -1 being not similar)
	local alignment = currentLookVector:Dot(originalLookVector)
	--print(alignment)

	--
	if not reachedOpposite and alignment < 0 then
		reachedOpposite = true
		turnStartTime = os.clock() -- Mark the exact	 time	 they turned around
	end

	-- State 2: Player has turned BACK to the original direction (Close to 1)
	if reachedOpposite and alignment > 0 then
		local timeTaken = os.clock() - turnStartTime

		if timeTaken <= TIME_WINDOW then
			turnCounter = turnCounter + 1
			print("player turn back Total:", turnCounter)

			-- Fire a RemoteEvent here if the server needs to know (e.g., giving points or a badge)
		else
			print("turn took too long:", timeTaken, "seconds. resetting.")
		end

		-- Reset tracking for the next check
		reachedOpposite = false
		originalLookVector = currentLookVector
	end

	-- If they start turning but take too long to turn back, reset their origin anchor
	if reachedOpposite and (os.clock() - turnStartTime > TIME_WINDOW) then
		reachedOpposite = false
		originalLookVector = currentLookVector
	end

	-- Gradually update the origin anchor if they are just panning slowly
	if not reachedOpposite and alignment < 0.95 then
		-- They are moving normally, update the baseline direction
		originalLookVector = originalLookVector:Lerp(currentLookVector, 0.1)
		print("a")
	end
end)