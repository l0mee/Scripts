

do
	local Accessories = {}

	local Aligns = {}

	local Attachments = {}

	local BindableEvent = nil

	local Blacklist = {}

	local CFrame = CFrame
	local CFrameidentity = CFrame.identity
	local CFramelookAt = CFrame.lookAt
	local CFramenew = CFrame.new

	local Character = nil

	local CurrentCamera = nil

	local Enum = Enum
	local Custom = Enum.CameraType.Custom
	local Health = Enum.CoreGuiType.Health
	local HumanoidRigType = Enum.HumanoidRigType
	local R6 = HumanoidRigType.R6
	local Dead = Enum.HumanoidStateType.Dead
	local LockCenter = Enum.MouseBehavior.LockCenter
	local UserInputType = Enum.UserInputType
	local MouseButton1 = UserInputType.MouseButton1
	local Touch = UserInputType.Touch

	local Exceptions = {}

	local game = game
	local Clone = game.Clone
	local Close = game.Close
	local Connect = Close.Connect
	local Disconnect = Connect(Close, function() end).Disconnect
	local Wait = Close.Wait
	local Destroy = game.Destroy
	local FindFirstAncestorOfClass = game.FindFirstAncestorOfClass
	local FindFirstAncestorWhichIsA = game.FindFirstAncestorWhichIsA
	local FindFirstChild = game.FindFirstChild
	local FindFirstChildOfClass = game.FindFirstChildOfClass
	local Players = FindFirstChildOfClass(game, "Players")
	local CreateHumanoidModelFromDescription = Players.CreateHumanoidModelFromDescription
	local GetPlayers = Players.GetPlayers
	local LocalPlayer = Players.LocalPlayer
	local CharacterAdded = LocalPlayer.CharacterAdded
	local ConnectDiedSignalBackend = LocalPlayer.ConnectDiedSignalBackend
	local Mouse = LocalPlayer:GetMouse()
	local Kill = LocalPlayer.Kill
	local RunService = FindFirstChildOfClass(game, "RunService")
	local PostSimulation = RunService.PostSimulation
	local PreRender = RunService.PreRender
	local PreSimulation = RunService.PreSimulation
	local StarterGui = FindFirstChildOfClass(game, "StarterGui")
	local GetCoreGuiEnabled = StarterGui.GetCoreGuiEnabled
	local SetCore = StarterGui.SetCore
	local SetCoreGuiEnabled = StarterGui.SetCoreGuiEnabled
	local Workspace = FindFirstChildOfClass(game, "Workspace")
	local FallenPartsDestroyHeight = Workspace.FallenPartsDestroyHeight
	local HatDropY = FallenPartsDestroyHeight - 0.7
	local FindFirstChildWhichIsA = game.FindFirstChildWhichIsA
	local UserInputService = FindFirstChildOfClass(game, "UserInputService")
	local InputBegan = UserInputService.InputBegan
	local IsMouseButtonPressed = UserInputService.IsMouseButtonPressed
	local GetChildren = game.GetChildren
	local GetDescendants = game.GetDescendants
	local GetPropertyChangedSignal = game.GetPropertyChangedSignal
	local CurrentCameraChanged = GetPropertyChangedSignal(Workspace, "CurrentCamera")
	local MouseBehaviorChanged = GetPropertyChangedSignal(UserInputService, "MouseBehavior")
	local IsA = game.IsA
	local IsDescendantOf = game.IsDescendantOf

	local Highlights = {}

	local Instancenew = Instance.new
	local R15Animation = Instancenew("Animation")
	local R6Animation = Instancenew("Animation")
	local HumanoidDescription = Instancenew("HumanoidDescription")
	local HumanoidModel = CreateHumanoidModelFromDescription(Players, HumanoidDescription, R6)
	local R15HumanoidModel = CreateHumanoidModelFromDescription(Players, HumanoidDescription, HumanoidRigType.R15)
	local SetAccessories = HumanoidDescription.SetAccessories
	local ModelBreakJoints = HumanoidModel.BreakJoints
	local Head = HumanoidModel.Head
	local BasePartBreakJoints = Head.BreakJoints
	local GetJoints = Head.GetJoints
	local IsGrounded = Head.IsGrounded
	local Humanoid = HumanoidModel.Humanoid
	local ApplyDescription = Humanoid.ApplyDescription
	local ChangeState = Humanoid.ChangeState
	local EquipTool = Humanoid.EquipTool
	local GetAppliedDescription = Humanoid.GetAppliedDescription
	local GetPlayingAnimationTracks = Humanoid.GetPlayingAnimationTracks
	local LoadAnimation = Humanoid.LoadAnimation
	local Move = Humanoid.Move
	local UnequipTools = Humanoid.UnequipTools
	local ScaleTo = HumanoidModel.ScaleTo

	local IsFirst = false
	local IsHealthEnabled = nil
	local IsLockCenter = false
	local IsRegistered = false
	local IsRunning = false

	local LastTime = nil

	local math = math
	local mathrandom = math.random
	local mathsin = math.sin

	local nan = 0 / 0

	local next = next

	local OptionsAccessories = nil
	local OptionsApplyDescription = nil
	local OptionsBreakJointsDelay = nil
	local OptionsClickFling = nil
	local OptionsDisableCharacterCollisions = nil
	local OptionsDisableHealthBar = nil
	local OptionsDisableRigCollisions = nil
	local OptionsDefaultFlingOptions = nil
	local OptionsHatDrop = nil
	local OptionsHideCharacter = nil
	local OptionsParentCharacter = nil
	local OptionsPermanentDeath = nil
	local OptionsRefit = nil
	local OptionsRigTransparency = nil
	local OptionsSetCameraSubject = nil
	local OptionsSetCameraType = nil
	local OptionsSetCharacter = nil
	local OptionsSetCollisionGroup = nil
	local OptionsSimulationRadius = nil
	local OptionsTeleportRadius = nil
	local OptionsUseServerBreakJoints

	local osclock = os.clock

	local PreRenderConnection = nil

	local RBXScriptConnections = {}

	local Refitting = false

	local replicatesignal = replicatesignal

	local Rig = nil
	local RigHumanoid = nil
	local RigHumanoidRootPart = nil

	local sethiddenproperty = sethiddenproperty
	local setscriptable = setscriptable

	local stringfind = string.find

	local table = table
	local tableclear = table.clear
	local tablefind = table.find
	local tableinsert = table.insert
	local tableremove = table.remove

	local Targets = {}

	local task = task
	local taskdefer = task.defer
	local taskspawn = task.spawn
	local taskwait = task.wait

	local Time = nil
	
	local Tools = {}

	local Vector3 = Vector3
	local Vector3new = Vector3.new
	local FlingVelocity = Vector3new(16384, 16384, 16384)
	local HatDropLinearVelocity = Vector3new(0, 28, 0)
	local HideCharacterOffset = Vector3new(0, - 30, 0)
	local Vector3one = Vector3.one
	local Vector3xzAxis = Vector3new(1, 0, 1)
	local Vector3zero = Vector3.zero
	local AntiSleep = Vector3zero

	R15Animation.AnimationId = "rbxassetid://507767968"
	R6Animation.AnimationId = "rbxassetid://180436148"

	Humanoid = nil

	Destroy(HumanoidDescription)
	HumanoidDescription = nil

	local FindFirstChildOfClassAndName = function(Parent, ClassName, Name)
		for Index, Child in next, GetChildren(Parent) do
			if IsA(Child, ClassName) and Child.Name == Name then
				return Child
			end
		end
	end

	local GetHandleFromTable = function(Table)
		for Index, Child in GetChildren(Character) do
			if IsA(Child, "Accoutrement") then
				local Handle = FindFirstChildOfClassAndName(Child, "BasePart", "Handle")

				if Handle then
					local MeshId = nil
					local TextureId = nil

					if IsA(Handle, "MeshPart") then
						MeshId = Handle.MeshId
						TextureId = Handle.TextureID
					else
						local SpecialMesh = FindFirstChildOfClass(Handle, "SpecialMesh")

						if SpecialMesh then
							MeshId = SpecialMesh.MeshId
							TextureId = SpecialMesh.TextureId
						end
					end

					if MeshId then
						if stringfind(MeshId, Table.MeshId) and stringfind(TextureId, Table.TextureId) then
							return Handle
						end
					end
				end
			end
		end
	end

	local NewIndex = function(self, Index, Value)
		self[Index] = Value
	end

	local DescendantAdded = function(Descendant)
		if IsA(Descendant, "Accoutrement") and OptionsHatDrop then
			if not pcall(NewIndex, Descendant, "BackendAccoutrementState", 0) then
				if sethiddenproperty then
					sethiddenproperty(Descendant, "BackendAccoutrementState", 0)
				elseif setscriptable then
					setscriptable(Descendant, "BackendAccoutrementState", true)

				end
			end
		elseif IsA(Descendant, "Attachment") then
			local Attachment = Attachments[Descendant.Name]

			if Attachment then
				local Parent = Descendant.Parent

				if IsA(Parent, "BasePart") then
					local MeshId = nil
					local TextureId = nil

					if IsA(Parent, "MeshPart") then
						MeshId = Parent.MeshId
						TextureId = Parent.TextureID
					else
						local SpecialMesh = FindFirstChildOfClass(Parent, "SpecialMesh")

						if SpecialMesh then
							MeshId = SpecialMesh.MeshId
							TextureId = SpecialMesh.TextureId
						end
					end

					if MeshId then
						for Index, Table in next, Accessories do
							if Table.MeshId == MeshId and Table.TextureId == TextureId then
								local Handle = Table.Handle

								tableinsert(Aligns, {
									LastPosition = Handle.Position,
									Offset = CFrameidentity,
									Part0 = Parent,
									Part1 = Handle
								})

								return
							end
						end

						for Index, Table in next, OptionsAccessories do
							if stringfind(MeshId, Table.MeshId) and stringfind(TextureId, Table.TextureId) then
								local Instance = nil
								local TableName = Table.Name
								local TableNames = Table.Names

								if TableName then
									Instance = FindFirstChildOfClassAndName(Rig, "BasePart", TableName)
								else
									for Index, TableName in next, TableNames do
										local Child = FindFirstChildOfClassAndName(Rig, "BasePart", TableName)

										if not ( TableNames[Index + 1] and Blacklist[Child] ) then
											Instance = Child
											break
										end
									end
								end

								if Instance then
									local Blacklisted = Blacklist[Instance]

									if not ( Blacklisted and Blacklisted.MeshId == MeshId and Blacklisted.TextureId == TextureId ) then
										tableinsert(Aligns, {
											Offset = Table.Offset,
											Part0 = Parent,
											Part1 = Instance
										})

										Blacklist[Instance] = { MeshId = MeshId, TextureId = TextureId }

										return
									end
								end
							end
						end

						local Accoutrement = FindFirstAncestorWhichIsA(Parent, "Accoutrement")

						if Accoutrement and IsA(Accoutrement, "Accoutrement") then
							local AccoutrementClone = Clone(Accoutrement)

							local HandleClone = FindFirstChildOfClassAndName(AccoutrementClone, "BasePart", "Handle")
							HandleClone.Transparency = OptionsRigTransparency

							for Index, Descendant in next, GetDescendants(HandleClone) do
								if IsA(Descendant, "JointInstance") then
									Destroy(Descendant)
								end
							end

							local AccessoryWeld = Instancenew("Weld")
							AccessoryWeld.C0 = Descendant.CFrame
							AccessoryWeld.C1 = Attachment.CFrame
							AccessoryWeld.Name = "AccessoryWeld"
							AccessoryWeld.Part0 = HandleClone
							AccessoryWeld.Part1 = Attachment.Parent
							AccessoryWeld.Parent = HandleClone

							AccoutrementClone.Parent = Rig

							tableinsert(Accessories, {
								Handle = HandleClone,
								MeshId = MeshId,
								TextureId = TextureId
							})
							tableinsert(Aligns, {
								Offset = CFrameidentity,
								Part0 = Parent,
								Part1 = HandleClone
							})
						end
					end
				end
			end
		end
	end

	local SetCameraSubject = function()
		local CameraCFrame = CurrentCamera.CFrame
		local Position = RigHumanoidRootPart.CFrame.Position

		CurrentCamera.CameraSubject = RigHumanoid
		Wait(PreRender)
		CurrentCamera.CFrame = CameraCFrame + RigHumanoidRootPart.CFrame.Position - Position
	end

	local OnCameraSubjectChanged = function()
		if CurrentCamera.CameraSubject ~= RigHumanoid then
			taskdefer(SetCameraSubject)
		end
	end

	local OnCameraTypeChanged = function()
		if CurrentCamera.CameraType ~= Custom then
			CurrentCamera.CameraType = Custom
		end
	end

	local OnCurrentCameraChanged = function()
		local Camera = Workspace.CurrentCamera

		if Camera and OptionsSetCameraSubject then
			CurrentCamera = Workspace.CurrentCamera

			taskspawn(SetCameraSubject)

			OnCameraSubjectChanged()
			tableinsert(RBXScriptConnections, Connect(GetPropertyChangedSignal(CurrentCamera, "CameraSubject"), OnCameraSubjectChanged))

			if OptionsSetCameraType then
				OnCameraTypeChanged()
				tableinsert(RBXScriptConnections, Connect(GetPropertyChangedSignal(CurrentCamera, "CameraType"), OnCameraTypeChanged))
			end
		end
	end

	local SetCharacter = function()
		LocalPlayer.Character = Rig
	end

	local SetSimulationRadius = function()
		LocalPlayer.SimulationRadius = OptionsSimulationRadius
	end

	local WaitForChildOfClass = function(Parent, ClassName)
		local Child = FindFirstChildOfClass(Parent, ClassName)

		while not Child do
			Wait(Parent.ChildAdded)
			Child = FindFirstChildOfClass(Parent, ClassName)
		end

		return Child
	end

	local WaitForChildOfClassAndName = function(Parent, ...)
		local Child = FindFirstChildOfClassAndName(Parent, ...)

		while not Child do
			Wait(Parent.ChildAdded)
			Child = FindFirstChildOfClassAndName(Parent, ...)
		end

		return Child
	end

	local Fling = function(Target, Options)
		if Target then
			local Highlight = Options.Highlight

			if IsA(Target, "Humanoid") then
				Target = Target.Parent
			end
			if IsA(Target, "Model") then
				Target = FindFirstChildOfClassAndName(Target, "BasePart", "HumanoidRootPart") or FindFirstChildWhichIsA(Character, "BasePart")
			end

			if not tablefind(Targets, Target) and IsA(Target, "BasePart") and not Target.Anchored and not IsDescendantOf(Character, Target) and not IsDescendantOf(Rig, Target) then
				local Model = FindFirstAncestorOfClass(Target, "Model")

				if Model and FindFirstChildOfClass(Model, "Humanoid") then
					Target = FindFirstChildOfClassAndName(Model, "BasePart", "HumanoidRootPart") or FindFirstChildWhichIsA(Character, "BasePart") or Target	
				else
					Model = Target
				end

				if Highlight then
					local HighlightObject = type(Highlight) == "boolean" and Highlight and Instancenew("Highlight") or Clone(Highlight)
					HighlightObject.Adornee = Model
					HighlightObject.Parent = Model

					Options.HighlightObject = HighlightObject
					tableinsert(Highlights, HighlightObject)
				end

				Targets[Target] = Options

				if not OptionsDefaultFlingOptions.HatFling and OptionsPermanentDeath and replicatesignal then
					replicatesignal(ConnectDiedSignalBackend)
				end
			end
		end
	end

	local OnCharacterAdded = function(NewCharacter)
		if NewCharacter ~= Rig then
			tableclear(Aligns)
			tableclear(Blacklist)

			Character = NewCharacter

			if OptionsSetCameraSubject then
				taskspawn(SetCameraSubject)
			end

			if OptionsSetCharacter then
				taskdefer(SetCharacter)
			end

			if OptionsParentCharacter then
				Character.Parent = Rig
			end

			for Index, Descendant in next, GetDescendants(Character) do
				taskspawn(DescendantAdded, Descendant)
			end

			tableinsert(RBXScriptConnections, Connect(Character.DescendantAdded, DescendantAdded))

			Humanoid = WaitForChildOfClass(Character, "Humanoid")
			local HumanoidRootPart = WaitForChildOfClassAndName(Character, "BasePart", "HumanoidRootPart")

			if IsFirst then
				if OptionsApplyDescription and Humanoid then
					local AppliedDescription = GetAppliedDescription(Humanoid)
					SetAccessories(AppliedDescription, {}, true)
					taskspawn(ApplyDescription, RigHumanoid, AppliedDescription)
				end

				if HumanoidRootPart then
					RigHumanoidRootPart.CFrame = HumanoidRootPart.CFrame

					if OptionsSetCollisionGroup then
						local CollisionGroup = HumanoidRootPart.CollisionGroup

						for Index, Descendant in next, GetDescendants(Rig) do
							if IsA(Descendant, "BasePart") then
								Descendant.CollisionGroup = CollisionGroup
							end
						end
					end
				end

				IsFirst = false
			end

			local IsAlive = true

			if HumanoidRootPart then
				for Target, Options in next, Targets do
					if IsDescendantOf(Target, Workspace) then
						local FirstPosition = Target.Position
						local PredictionFling = Options.PredictionFling
						local LastPosition = FirstPosition
						local Timeout = osclock() + Options.Timeout or 1

						if HumanoidRootPart then
							while IsDescendantOf(Target, Workspace) and osclock() < Timeout do
								local DeltaTime = taskwait()
								local Position = Target.Position

								if ( Position - FirstPosition ).Magnitude > 100 then
									break
								end

								local Offset = Vector3zero

								if PredictionFling then
									Offset = ( Position - LastPosition ) / DeltaTime * 0.13
								end

								HumanoidRootPart.AssemblyAngularVelocity = FlingVelocity
								HumanoidRootPart.AssemblyLinearVelocity = FlingVelocity

								HumanoidRootPart.CFrame = Target.CFrame + Offset
								LastPosition = Position
							end
						end
					end

					local HighlightObject = Options.HighlightObject

					if HighlightObject then
						Destroy(HighlightObject)
					end

					Targets[Target] = nil
				end

				HumanoidRootPart.AssemblyAngularVelocity = Vector3zero
				HumanoidRootPart.AssemblyLinearVelocity = Vector3zero

				if OptionsHatDrop then
					taskspawn(function()
						WaitForChildOfClassAndName(Character, "LocalScript", "Animate").Enabled = false

						for Index, AnimationTrack in next, GetPlayingAnimationTracks(Humanoid) do
							AnimationTrack:Stop()
						end

						LoadAnimation(Humanoid, Humanoid.RigType == R6 and R6Animation or R15Animation):Play(0)

						pcall(NewIndex, Workspace, "FallenPartsDestroyHeight", nan)

						local RootPartCFrame = RigHumanoidRootPart.CFrame
						RootPartCFrame = CFramenew(RootPartCFrame.X, HatDropY, RootPartCFrame.Z) * CFrame.Angles(math.pi * 0.5, 0, 0)
						while IsAlive do
							HumanoidRootPart.AssemblyAngularVelocity = Vector3zero
							HumanoidRootPart.AssemblyLinearVelocity = HatDropLinearVelocity
							HumanoidRootPart.CFrame = RootPartCFrame

							taskwait()
						end
					end)
				elseif OptionsHideCharacter then
					local HideCharacterOffset = typeof(OptionsHideCharacter) == "Vector3" and OptionsHideCharacter or HideCharacterOffset
					local RootPartCFrame = RigHumanoidRootPart.CFrame + HideCharacterOffset

					taskspawn(function()
						while IsAlive do
							HumanoidRootPart.AssemblyAngularVelocity = Vector3zero
							HumanoidRootPart.AssemblyLinearVelocity = Vector3zero
							HumanoidRootPart.CFrame = RootPartCFrame

							taskwait()
						end
					end)
				elseif OptionsTeleportRadius then
					HumanoidRootPart.CFrame = RigHumanoidRootPart.CFrame + Vector3new(mathrandom(- OptionsTeleportRadius, OptionsTeleportRadius), 0, mathrandom(- OptionsTeleportRadius, OptionsTeleportRadius))
				end
			end
			
			local ToolFling = OptionsDefaultFlingOptions.ToolFling
			local Tools2 = {}
			
			if ToolFling then
				local Backpack = FindFirstChildOfClass(LocalPlayer, "Backpack")
				
				tableclear(Tools)
				
				if type(ToolFling) == "string" then
					local Tool = FindFirstChildOfClassAndName(Backpack, "Tool", ToolFling)
					
					if Tool then
						Tool.Parent = Character
						tableinsert(Tools2, Tool)
					end
				else
					for Index, Tool in GetChildren(Backpack) do
						if IsA(Tool, "Tool") then
							Tool.Parent = Character
							tableinsert(Tools2, Tool)
						end
					end
				end
				
				UnequipTools(Humanoid)
			end

			if OptionsPermanentDeath and replicatesignal then
				replicatesignal(ConnectDiedSignalBackend)

				taskwait(Players.RespawnTime + 0.1)

				Refitting = false
				replicatesignal(Kill)
			else
				taskwait(OptionsBreakJointsDelay)
			end

			ModelBreakJoints(Character)

			if replicatesignal and OptionsUseServerBreakJoints then
				replicatesignal(Humanoid.ServerBreakJoints)
			end

			ChangeState(Humanoid, Dead)
			Wait(Humanoid.Died)
			
			for Index, Tool in Tools2 do
				local Handle = FindFirstChildOfClassAndName(Tool, "BasePart", "Handle")
				
				if Handle then
					Tool.Parent = Character
				else
					tableremove(Tools2, Index)
				end
			end
			
			Tools = Tools2
			UnequipTools(Humanoid)

			IsAlive = false

			if OptionsHatDrop then
				pcall(NewIndex, Workspace, "FallenPartsDestroyHeight", FallenPartsDestroyHeight)
			end
		end
	end
	
	local OnInputBegan = function(InputObject)
		local UserInputType = InputObject.UserInputType
		
		if UserInputType == MouseButton1 or UserInputType == Touch then
			local Target = Mouse.Target

			local HatFling = OptionsDefaultFlingOptions.HatFling
			local ToolFling = OptionsDefaultFlingOptions.ToolFling

			if HatFling and OptionsHatDrop then
				local Part = type(HatFling) == "table" and GetHandleFromTable(HatFling)

				if not Part then
					for Index, Child in GetChildren(Character) do
						if IsA(Child, "Accoutrement") then
							local Handle = FindFirstChildOfClassAndName(Child, "BasePart", "Handle")

							if Handle then
								Part = Handle
								break
							end
						end
					end
				end

				if Part then
					Exceptions[Part] = true

					while IsMouseButtonPressed(UserInputService, MouseButton1) do
						if Part.ReceiveAge == 0 then
							Part.AssemblyAngularVelocity = FlingVelocity
							Part.AssemblyLinearVelocity = FlingVelocity
							Part.CFrame = Mouse.Hit + AntiSleep
						end

						taskwait()
					end

					Exceptions[Part] = nil
				end
			elseif ToolFling then
				local Backpack = FindFirstChildOfClass(LocalPlayer, "Backpack")
				local Tool = nil

				if type(ToolFling) == "string" then
					Tool = FindFirstChild(Backpack, ToolFling) or FindFirstChild(Character, ToolFling)
				end

				if not Tool then
					Tool = FindFirstChildOfClass(Backpack, "Tool") or FindFirstChildOfClass(Character, "Tool")
				end

				if Tool then
					local Handle = FindFirstChildOfClassAndName(Tool, "BasePart", "Handle") or FindFirstChildWhichIsA(Tool, "BasePart")

					if Handle then
						Tool.Parent = Character
						
						while IsMouseButtonPressed(UserInputService, MouseButton1) do
							if Handle.ReceiveAge == 0 then
								Handle.AssemblyAngularVelocity = FlingVelocity
								Handle.AssemblyLinearVelocity = FlingVelocity
								Handle.CFrame = Mouse.Hit + AntiSleep
							end

							taskwait()
						end
						
						UnequipTools(Humanoid)

						Handle.AssemblyAngularVelocity = Vector3zero
						Handle.AssemblyLinearVelocity = Vector3zero
						Handle.CFrame = RigHumanoidRootPart.CFrame
					end
				end
			else
				Fling(Target, OptionsDefaultFlingOptions)
			end
		end
	end
	
	local OnPostSimulation = function()
		Time = osclock()
		local DeltaTime = Time - LastTime
		LastTime = Time

		if not OptionsSetCharacter and IsLockCenter then
			local Position = RigHumanoidRootPart.Position
			RigHumanoidRootPart.CFrame = CFramelookAt(Position, Position + CurrentCamera.CFrame.LookVector * Vector3xzAxis)
		end

		if OptionsSimulationRadius then
			pcall(SetSimulationRadius)
		end

		AntiSleep = mathsin(Time * 15) * 0.0015 * Vector3one
		local Axis = 27 + mathsin(Time)

		for Index, Table in next, Aligns do
			local Part0 = Table.Part0

			if not Exceptions[Part0] then
				if Part0.ReceiveAge == 0 then
					if IsDescendantOf(Part0, Workspace) and not GetJoints(Part0)[1] and not IsGrounded(Part0) then
						local Part1 = Table.Part1

						Part0.AssemblyAngularVelocity = Vector3zero

						local LinearVelocity = Part1.AssemblyLinearVelocity * Axis
						Part0.AssemblyLinearVelocity = Vector3new(LinearVelocity.X, Axis, LinearVelocity.Z)

						Part0.CFrame = Part1.CFrame * Table.Offset + AntiSleep
					end
				else
					local Frames = Table.Frames or - 1
					Frames = Frames + 1
					Table.Frames = Frames

					if Frames > 15 and OptionsPermanentDeath and OptionsRefit and replicatesignal then
						Refitting = false
						replicatesignal(ConnectDiedSignalBackend)
					end
				end
			end
		end

		if not OptionsSetCharacter and Humanoid then
			Move(RigHumanoid, Humanoid.MoveDirection)
			RigHumanoid.Jump = Humanoid.Jump
		end
	end

	local OnPreRender = function()
		local Position = RigHumanoidRootPart.Position
		RigHumanoidRootPart.CFrame = CFramelookAt(Position, Position + CurrentCamera.CFrame.LookVector * Vector3xzAxis)

		for Index, Table in next, Aligns do
			local Part0 = Table.Part0

			if Part0.ReceiveAge == 0 and IsDescendantOf(Part0, Workspace) and not GetJoints(Part0)[1] and not IsGrounded(Part0) then
				Part0.CFrame = Table.Part1.CFrame * Table.Offset
			end
		end
	end

	local OnMouseBehaviorChanged = function()
		IsLockCenter = UserInputService.MouseBehavior == LockCenter

		if IsLockCenter then
			PreRenderConnection = Connect(PreRender, OnPreRender)
			tableinsert(RBXScriptConnections, PreRenderConnection)
		elseif PreRenderConnection then
			Disconnect(PreRenderConnection)
			tableremove(RBXScriptConnections, tablefind(RBXScriptConnections, PreRenderConnection))
		end
	end

	local OnPreSimulation = function()
		if OptionsDisableCharacterCollisions and Character then
			for Index, Descendant in next, GetDescendants(Character) do
				if IsA(Descendant, "BasePart") then
					Descendant.CanCollide = false
				end
			end
		end
		
		if OptionsDisableRigCollisions then
			for Index, Descendant in next, GetChildren(Rig) do
				if IsA(Descendant, "BasePart") then
					Descendant.CanCollide = false
				end
			end
		end
	end
	
	local Register = function()
		repeat
			IsRegistered = pcall(SetCore, StarterGui, "ResetButtonCallback", BindableEvent)
			taskwait()
		until IsRegistered
	end

	Start = function(Options)
		if not IsRunning then
			IsFirst = true
			IsRunning = true

			Options = Options or {}
			OptionsAccessories = Options.Accessories or {}
			OptionsApplyDescription = Options.ApplyDescription
			OptionsBreakJointsDelay = Options.BreakJointsDelay or 0
			OptionsClickFling = Options.ClickFling
			OptionsDisableCharacterCollisions = Options.DisableCharacterCollisions
			OptionsDisableHealthBar = Options.DisableHealthBar
			OptionsDisableRigCollisions = Options.DisableRigCollisions
			OptionsDefaultFlingOptions = Options.DefaultFlingOptions or {}
			OptionsHatDrop = Options.HatDrop
			OptionsHideCharacter = Options.HideCharacter
			OptionsParentCharacter = Options.ParentCharacter
			OptionsPermanentDeath = Options.PermanentDeath
			OptionsRefit = Options.Refit
			local OptionsRigSize = Options.RigSize
			OptionsRigTransparency = Options.RigTransparency or 1
			OptionsSetCameraSubject = Options.SetCameraSubject
			OptionsSetCameraType = Options.SetCameraType
			OptionsSetCharacter = Options.SetCharacter
			OptionsSetCollisionGroup = Options.SetCollisionGroup
			OptionsSimulationRadius = Options.SimulationRadius
			OptionsTeleportRadius = Options.TeleportRadius
			OptionsUseServerBreakJoints = Options.UseServerBreakJoints
			
			if OptionsDisableHealthBar then
				IsHealthEnabled = GetCoreGuiEnabled(StarterGui, Health)
				SetCoreGuiEnabled(StarterGui, Health, false)
			end

			BindableEvent = Instancenew("BindableEvent")
			tableinsert(RBXScriptConnections, Connect(BindableEvent.Event, Stop))

			Rig = Options.R15 and Clone(R15HumanoidModel) or Clone(HumanoidModel)
			Rig.Name = LocalPlayer.Name
			RigHumanoid = Rig.Humanoid
			RigHumanoidRootPart = Rig.HumanoidRootPart
			Rig.Parent = Workspace
            
			for Index, Descendant in next, GetDescendants(Rig) do
				if IsA(Descendant, "Attachment") then
					Attachments[Descendant.Name] = Descendant
				elseif IsA(Descendant, "BasePart") or IsA(Descendant, "Decal") then
					Descendant.Transparency = OptionsRigTransparency
				end
			end

			if OptionsRigSize then
				ScaleTo(Rig, OptionsRigSize)

				RigHumanoid.JumpPower = 50
				RigHumanoid.WalkSpeed = 16
			end

			OnCurrentCameraChanged()
			tableinsert(RBXScriptConnections, Connect(CurrentCameraChanged, OnCurrentCameraChanged))

			if OptionsClickFling then
				tableinsert(RBXScriptConnections, Connect(InputBegan, OnInputBegan))
			end

			local Character = LocalPlayer.Character

			if Character then
				OnCharacterAdded(Character)
			end

			tableinsert(RBXScriptConnections, Connect(CharacterAdded, OnCharacterAdded))

			LastTime = osclock()
			tableinsert(RBXScriptConnections, Connect(PostSimulation, OnPostSimulation))

			if not OptionsSetCharacter then
				OnMouseBehaviorChanged()
				tableinsert(RBXScriptConnections, Connect(MouseBehaviorChanged, OnMouseBehaviorChanged))
			end

			if OptionsDisableCharacterCollisions or OptionsDisableRigCollisions then
				OnPreSimulation()
				tableinsert(RBXScriptConnections, Connect(PreSimulation, OnPreSimulation))
			end

			IsRegistered = pcall(SetCore, StarterGui, "ResetButtonCallback", BindableEvent)

			if not IsRegistered then
				taskspawn(Register)
			end

			return {
				BindableEvent = BindableEvent,
				Fling = Fling,
				Rig = Rig
			}
		end
	end

	Stop = function()
		if IsRunning then
			IsFirst = false
			IsRunning = false

			for Index, Highlight in Highlights do
				Destroy(Highlight)
			end

			tableclear(Highlights)

			for Index, RBXScriptConnection in next, RBXScriptConnections do
				Disconnect(RBXScriptConnection)
			end

			tableclear(RBXScriptConnections)

			Destroy(BindableEvent)

			if Character.Parent == Rig then
				Character.Parent = Workspace
			end

			if Humanoid then
				ChangeState(Humanoid, Dead)
			end

			Destroy(Rig)

			if OptionsPermanentDeath and replicatesignal then
				replicatesignal(ConnectDiedSignalBackend)
			end

			if OptionsDisableHealthBar and not GetCoreGuiEnabled(StarterGui, Health) then
				SetCoreGuiEnabled(StarterGui, Health, IsHealthEnabled)
			end

			if IsRegistered then
				pcall(SetCore, StarterGui, "ResetButtonCallback", true)
			else
				IsRegistered = pcall(SetCore, StarterGui, "ResetButtonCallback", true)
			end
		end
	end
end

Empyrean = Start({
	Accessories = {
		--{ MeshId = "", Name = "", Offset = CFrame.identity, TextureId = "" },		{ MeshId = "126825022897778", Name = "Torso", Offset = CFrame.identity, TextureId = "125975972015302" },--95290698984301
		
		{ MeshId = "85098143716871", Names = { "Right Leg" }, Offset = CFrame.identity, TextureId = "80509066368666" }, -- right leg
		{ MeshId = "121468048114178", Names = { "Left Leg" }, Offset = CFrame.identity, TextureId = "94611746507550" }, -- left leg 
		{ MeshId = "86498193529635", Names = { "Left Arm" }, Offset = CFrame.identity, TextureId = "136658153388070" }, -- left arm   
		{ MeshId = "85798708972047", Names = { "Right Arm" }, Offset = CFrame.identity, TextureId = "90203757676985" }, -- right arm
		{ MeshId = "115043791745610", Name = "Torso", Offset = CFrame.identity, TextureId = "135393186912221" }, -- torso 
	},
	ApplyDescription = true,
	BreakJointsDelay = 0.2,
	ClickFling = true,
	DefaultFlingOptions = {
		HatFling = true,--{ MeshId="", TextureId = ""},
		Highlight = true,
		PredictionFling = true,
		Timeout = 1,
		ToolFling = true,"Laptop",
	},
	DisableCharacterCollisions = true,
	DisableHealthBar = true,
	DisableRigCollisions = true,
	HatDrop = false,
	HideCharacter = Vector3.new(0, - 35, 0),
	ParentCharacter = true,
	PermanentDeath = true,
	Refit = false,
	RigSize = 1,
	RigTransparency = 1,
	R15 = false,
	SetCameraSubject = true,
	SetCameraType = true,
	SetCharacter = false,
	SetCollisionGroup = true,
	SimulationRadius = 2147483647,
	TeleportRadius = 12,
	UseServerBreakJoints = true,
})
wait(0.2)


-- FIXED AND CONVERTED WITHOUT OTHER REANIMS.. LOL
IT = Instance.new
CF = CFrame.new
VT = Vector3.new
RAD = math.rad
C3 = Color3.new
UD2 = UDim2.new
BRICKC = BrickColor.new
ANGLES = CFrame.Angles
EULER = CFrame.fromEulerAnglesXYZ
COS = math.cos
ACOS = math.acos
SIN = math.sin
ASIN = math.asin
ABS = math.abs
MRANDOM = math.random
FLOOR = math.floor


speed = 1
sine = 1
srv = game:GetService('RunService')

function hatset(yes,part,c1,c0,nm)
	reanim[yes].Handle.AccessoryWeld.Part1=reanim[part]
	reanim[yes].Handle.AccessoryWeld.C1=c1 or CFrame.new()
	reanim[yes].Handle.AccessoryWeld.C0=c0 or CFrame.new()--3bbb322dad5929d0d4f25adcebf30aa5
	if nm==true then
		for i,v in next, workspace[game.Players.LocalPlayer.Name][yes].Handle:GetDescendants() do
			if v:IsA('Mesh') or v:IsA('SpecialMesh') then
				v:Remove() -- useless cuz rcd :troll:
			end
		end
	end
end

function setuptrail(parent,Pos1,Pos2,Color,LT,LE,Texture)
	IT = Instance.new
	local Part1 = parent
	local A1 = IT("Attachment",Part1)
	A1.Position = Pos1
	A1.Name = "ATH10"
	local B1 = IT("Attachment",Part1)
	B1.Position = Pos2
	B1.Name = "ATH11"
	local Trail1 = IT("Trail",Part1)
	Trail1.Name = "Nexo Trail"
	Trail1.Color = Color
	Trail1.Attachment0 = B1
	Trail1.Attachment1 = A1
	Trail1.Lifetime = LT
	Trail1.LightEmission = LE
	Trail1.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0),NumberSequenceKeypoint.new(1, 1)})
	Trail1.Texture = Texture
	Trail1.Enabled = true
end

--                          |
--put the setup trail below v

--put the hat script converted below

char = workspace.DuskySpoon
reanim = workspace.DuskySpoon
char.SwordAccessory.Name = "Meshes/MeshPartAccessory (1)Accessory" -- RENAMER SO IT CAN FIX ITSELF.. LOL
RJ = reanim.HumanoidRootPart.RootJoint
RS = reanim.Torso['Right Shoulder']
LS = reanim.Torso['Left Shoulder']
RH = reanim.Torso['Right Hip']
LH = reanim.Torso['Left Hip']
Root = reanim.HumanoidRootPart
NECK = reanim.Torso.Neck
NECK.C0 = CF(0,1,0)*ANGLES(RAD(0),RAD(0),RAD(0))
NECK.C1 = CF(0,-0.5,0)*ANGLES(RAD(0),RAD(0),RAD(0))
RJ.C1 = CF(0,-1,0)*ANGLES(RAD(0),RAD(0),RAD(0))
RJ.C0 = CF(0,0,0)*ANGLES(RAD(0),RAD(0),RAD(0))
RS.C1 = CF(0,0.5,0)*ANGLES(RAD(0),RAD(0),RAD(0))
LS.C1 = CF(0,0.5,0)*ANGLES(RAD(0),RAD(0),RAD(0))
RH.C1 = CF(0,1,0)*ANGLES(RAD(0),RAD(0),RAD(0))
LH.C1 = CF(0,1,0)*ANGLES(RAD(0),RAD(0),RAD(0))
RH.C0 = CF(0,0,0)*ANGLES(RAD(0),RAD(0),RAD(0))
LH.C0 = CF(0,0,0)*ANGLES(RAD(0),RAD(0),RAD(0))
RS.C0 = CF(0,0,0)*ANGLES(RAD(0),RAD(0),RAD(0))
LS.C0 = CF(0,0,0)*ANGLES(RAD(0),RAD(0),RAD(0))

Mode='1'

mousechanger=game.Players.LocalPlayer:GetMouse().KeyDown:Connect(function(k)
	if k == 'q' then-- first mode
		Mode='1'
	elseif k == 'z' then-- second mode
		Mode='2'
	elseif k == 'x' then-- third mode
		Mode='3'
	elseif k == 'c' then-- fourth mode
		Mode='4'
	elseif k == 'v' then-- fourth mode
		Mode='5'
	elseif k == 'f' then-- fourth mode
		Mode='6'
	end
end)

coroutine.wrap(function()
	while true do -- anim changer
		if HumanDied then mousechanger:Disconnect() break end
		sine = sine + speed
		local rlegray = Ray.new(reanim["Right Leg"].Position + Vector3.new(0, 0.5, 0), Vector3.new(0, -2, 0))
		local rlegpart, rlegendPoint = workspace:FindPartOnRay(rlegray, char)
		local llegray = Ray.new(reanim["Left Leg"].Position + Vector3.new(0, 0.5, 0), Vector3.new(0, -2, 0))
		local llegpart, llegendPoint = workspace:FindPartOnRay(llegray, char)
		local rightvector = (Root.Velocity * Root.CFrame.rightVector).X + (Root.Velocity * Root.CFrame.rightVector).Z
		local lookvector = (Root.Velocity * Root.CFrame.lookVector).X + (Root.Velocity * Root.CFrame.lookVector).Z
		if lookvector > reanim.Humanoid.WalkSpeed then
			lookvector = reanim.Humanoid.WalkSpeed
		end
		if lookvector < -reanim.Humanoid.WalkSpeed then
			lookvector = -reanim.Humanoid.WalkSpeed
		end
		if rightvector > reanim.Humanoid.WalkSpeed then
			rightvector = reanim.Humanoid.WalkSpeed
		end
		if rightvector < -reanim.Humanoid.WalkSpeed then
			rightvector = -reanim.Humanoid.WalkSpeed
		end
		local lookvel = lookvector / reanim.Humanoid.WalkSpeed
		local rightvel = rightvector / reanim.Humanoid.WalkSpeed
		if Mode == '1' then
			if Root.Velocity.y > 1 then -- jump
				hatset('Meshes/MeshPartAccessory (1)Accessory','HumanoidRootPart',CFrame.new(0,-1,-3.5),reanim['Meshes/MeshPartAccessory (1)Accessory'].Handle.AccessoryWeld.C0:Lerp(CF(0+0*math.cos(sine/13),0+0.3*math.sin(sine/13),0+0*math.cos(sine/13))*ANGLES(RAD(-90+0*math.cos(sine/13)),RAD(70+-5*math.cos(sine/13)),RAD(90+0*math.cos(sine/13))),1),false)
				reanim['Meshes/MeshPartAccessory (1)Accessory'].Handle.AccessoryWeld.C0 = reanim['Meshes/MeshPartAccessory (1)Accessory'].Handle.AccessoryWeld.C0:Lerp(CF(0+0*math.cos(sine/13),0+0.3*math.sin(sine/13),0+0*math.sin(sine/13))*ANGLES(RAD(-90+0*math.cos(sine/13)),RAD(70+-5*math.sin(sine/13)),RAD(90+0*math.sin(sine/13))),.3)
				NECK.C0=NECK.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),1+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(-40+3*math.sin(sine/25)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.sin(sine/10))),.2) 
				RJ.C0=RJ.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),-2.5+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(85+3*math.cos(sine/25)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10))),.2) 
				RS.C0=RS.C0:Lerp(CFrame.new(1.5+0*math.cos(sine/10),0.5+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+0*math.cos(sine/10)),math.rad(-10+5*math.cos(sine/25)),math.rad(100+0*math.cos(sine/10))),.2) 
				LS.C0=LS.C0:Lerp(CFrame.new(-1.5+0*math.cos(sine/10),0.5+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+0*math.cos(sine/10)),math.rad(10+-5*math.cos(sine/25)),math.rad(-100+0*math.cos(sine/10))),.2) 
				RH.C0=RH.C0:Lerp(CFrame.new(0.5+0*math.cos(sine/10),-1+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+-3*math.cos(sine/25)),math.rad(0+0*math.cos(sine/10)),math.rad(40+0*math.cos(sine/10))),.2) 
				LH.C0=LH.C0:Lerp(CFrame.new(-0.5+0*math.cos(sine/10),-1+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+-3*math.cos(sine/25)),math.rad(0+0*math.cos(sine/10)),math.rad(-40+0*math.cos(sine/10))),.2)
			elseif Root.Velocity.y < -1 then -- fall
				hatset('Meshes/MeshPartAccessory (1)Accessory','HumanoidRootPart',CFrame.new(0,-1,-3.5),reanim['Meshes/MeshPartAccessory (1)Accessory'].Handle.AccessoryWeld.C0:Lerp(CF(0+0*math.cos(sine/13),0+0.3*math.sin(sine/13),0+0*math.cos(sine/13))*ANGLES(RAD(-90+0*math.cos(sine/13)),RAD(70+-5*math.cos(sine/13)),RAD(90+0*math.cos(sine/13))),1),false)
				reanim['Meshes/MeshPartAccessory (1)Accessory'].Handle.AccessoryWeld.C0 = reanim['Meshes/MeshPartAccessory (1)Accessory'].Handle.AccessoryWeld.C0:Lerp(CF(0+0*math.cos(sine/13),0+0.3*math.sin(sine/13),0+0*math.sin(sine/13))*ANGLES(RAD(-90+0*math.cos(sine/13)),RAD(70+-5*math.sin(sine/13)),RAD(90+0*math.sin(sine/13))),.3)
				NECK.C0=NECK.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),1+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(-40+3*math.sin(sine/25)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.sin(sine/10))),.2) 
				RJ.C0=RJ.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),-2.5+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(85+3*math.cos(sine/25)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10))),.2) 
				RS.C0=RS.C0:Lerp(CFrame.new(1.5+0*math.cos(sine/10),0.5+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+0*math.cos(sine/10)),math.rad(-10+5*math.cos(sine/25)),math.rad(100+0*math.cos(sine/10))),.2) 
				LS.C0=LS.C0:Lerp(CFrame.new(-1.5+0*math.cos(sine/10),0.5+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+0*math.cos(sine/10)),math.rad(10+-5*math.cos(sine/25)),math.rad(-100+0*math.cos(sine/10))),.2) 
				RH.C0=RH.C0:Lerp(CFrame.new(0.5+0*math.cos(sine/10),-1+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+-3*math.cos(sine/25)),math.rad(0+0*math.cos(sine/10)),math.rad(40+0*math.cos(sine/10))),.2) 
				LH.C0=LH.C0:Lerp(CFrame.new(-0.5+0*math.cos(sine/10),-1+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+-3*math.cos(sine/25)),math.rad(0+0*math.cos(sine/10)),math.rad(-40+0*math.cos(sine/10))),.2)
			elseif Root.Velocity.Magnitude < 2 then -- idle
				hatset('Meshes/MeshPartAccessory (1)Accessory','HumanoidRootPart',CFrame.new(0,-1,-3.5),reanim['Meshes/MeshPartAccessory (1)Accessory'].Handle.AccessoryWeld.C0:Lerp(CF(0+0*math.cos(sine/13),0+0.3*math.sin(sine/13),0+0*math.cos(sine/13))*ANGLES(RAD(-90+0*math.cos(sine/13)),RAD(70+-5*math.cos(sine/13)),RAD(90+0*math.cos(sine/13))),1),false)
				reanim['Meshes/MeshPartAccessory (1)Accessory'].Handle.AccessoryWeld.C0 = reanim['Meshes/MeshPartAccessory (1)Accessory'].Handle.AccessoryWeld.C0:Lerp(CF(0+0*math.cos(sine/13),0+0.3*math.sin(sine/13),0+0*math.sin(sine/13))*ANGLES(RAD(-90+0*math.cos(sine/13)),RAD(70+-5*math.sin(sine/13)),RAD(90+0*math.sin(sine/13))),.3)
				NECK.C0=NECK.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),1+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(-40+3*math.sin(sine/25)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.sin(sine/10))),.2) 
				RJ.C0=RJ.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),-2.5+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(85+3*math.cos(sine/25)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10))),.2) 
				RS.C0=RS.C0:Lerp(CFrame.new(1.5+0*math.cos(sine/10),0.5+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+0*math.cos(sine/10)),math.rad(-10+5*math.cos(sine/25)),math.rad(100+0*math.cos(sine/10))),.2) 
				LS.C0=LS.C0:Lerp(CFrame.new(-1.5+0*math.cos(sine/10),0.5+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+0*math.cos(sine/10)),math.rad(10+-5*math.cos(sine/25)),math.rad(-100+0*math.cos(sine/10))),.2) 
				RH.C0=RH.C0:Lerp(CFrame.new(0.5+0*math.cos(sine/10),-1+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+-3*math.cos(sine/25)),math.rad(0+0*math.cos(sine/10)),math.rad(40+0*math.cos(sine/10))),.2) 
				LH.C0=LH.C0:Lerp(CFrame.new(-0.5+0*math.cos(sine/10),-1+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+-3*math.cos(sine/25)),math.rad(0+0*math.cos(sine/10)),math.rad(-40+0*math.cos(sine/10))),.2)
			elseif Root.Velocity.Magnitude < 51 then -- walk
				hatset('Meshes/MeshPartAccessory (1)Accessory','HumanoidRootPart',CFrame.new(0,-1,-3.5),reanim['Meshes/MeshPartAccessory (1)Accessory'].Handle.AccessoryWeld.C0:Lerp(CF(0+0*math.cos(sine/13),0+0.3*math.sin(sine/13),0+0*math.cos(sine/13))*ANGLES(RAD(-90+0*math.cos(sine/13)),RAD(70+-5*math.cos(sine/13)),RAD(90+0*math.cos(sine/13))),1),false)
				reanim['Meshes/MeshPartAccessory (1)Accessory'].Handle.AccessoryWeld.C0 = reanim['Meshes/MeshPartAccessory (1)Accessory'].Handle.AccessoryWeld.C0:Lerp(CF(0+0*math.cos(sine/13),0+0.3*math.sin(sine/13),0+0*math.sin(sine/13))*ANGLES(RAD(-90+0*math.cos(sine/13)),RAD(70+-5*math.sin(sine/13)),RAD(90+0*math.sin(sine/13))),.3)
				NECK.C0=NECK.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),1+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(-40+3*math.sin(sine/25)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.sin(sine/10))),.2) 
				RJ.C0=RJ.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),-2.5+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(85+3*math.cos(sine/25)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10))),.2) 
				RS.C0=RS.C0:Lerp(CFrame.new(1.5+0*math.cos(sine/10),0.5+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+0*math.cos(sine/10)),math.rad(-10+5*math.cos(sine/25)),math.rad(100+0*math.cos(sine/10))),.2) 
				LS.C0=LS.C0:Lerp(CFrame.new(-1.5+0*math.cos(sine/10),0.5+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+0*math.cos(sine/10)),math.rad(10+-5*math.cos(sine/25)),math.rad(-100+0*math.cos(sine/10))),.2) 
				RH.C0=RH.C0:Lerp(CFrame.new(0.5+0*math.cos(sine/10),-1+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+-3*math.cos(sine/25)),math.rad(0+0*math.cos(sine/10)),math.rad(40+0*math.cos(sine/10))),.2) 
				LH.C0=LH.C0:Lerp(CFrame.new(-0.5+0*math.cos(sine/10),-1+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+-3*math.cos(sine/25)),math.rad(0+0*math.cos(sine/10)),math.rad(-40+0*math.cos(sine/10))),.2)
			elseif Root.Velocity.Magnitude > 20 then -- run
				--run clerp here
			end
		elseif Mode == '2' then
			if Root.Velocity.y > 1 then -- jump
				hatset('Meshes/MeshPartAccessory (1)Accessory','HumanoidRootPart',CFrame.new(0,-1.75,-2.3),reanim['Meshes/MeshPartAccessory (1)Accessory'].Handle.AccessoryWeld.C0:Lerp(CF(0+1*math.cos(sine/5),0+0.15*math.cos(sine/5),0+0*math.cos(sine/5))*ANGLES(RAD(-90+0*math.cos(sine/5)),RAD(75+-10*math.cos(sine/5)),RAD(90+0*math.cos(sine/5))),1),false)
				reanim['Meshes/MeshPartAccessory (1)Accessory'].Handle.AccessoryWeld.C0 = reanim['Meshes/MeshPartAccessory (1)Accessory'].Handle.AccessoryWeld.C0:Lerp(CF(0+1*math.cos(sine/5),0+0.15*math.sin(sine/5),0+0*math.sin(sine/13))*ANGLES(RAD(-90+0*math.cos(sine/5)),RAD(75+-10*math.sin(sine/5)),RAD(90+0*math.sin(sine/5))),.3)
				NECK.C0=NECK.C0:Lerp(CFrame.new(0+0*math.cos(sine/5),1+0*math.cos(sine/5),0+0*math.cos(sine/5))*CFrame.Angles(math.rad(-30+10*math.sin(sine/5)),math.rad(0+0*math.cos(sine/5)),math.rad(0+0*math.sin(sine/5))),.2) 
				RJ.C0=RJ.C0:Lerp(CFrame.new(0+0*math.cos(sine/5),-2+-0.5*math.cos(sine/5),0+0*math.cos(sine/5))*CFrame.Angles(math.rad(110+-10*math.cos(sine/5)),math.rad(0+0*math.cos(sine/5)),math.rad(0+0*math.cos(sine/5))),.2) 
				RS.C0=RS.C0:Lerp(CFrame.new(1.5+0*math.cos(sine/5),0.5+0*math.cos(sine/5),0+0*math.cos(sine/5))*CFrame.Angles(math.rad(-30+5*math.cos(sine/5)),math.rad(-10+10*math.cos(sine/5)),math.rad(100+0*math.cos(sine/5))),.2) 
				LS.C0=LS.C0:Lerp(CFrame.new(-1.5+0*math.cos(sine/5),0.5+0*math.cos(sine/5),0+0*math.cos(sine/5))*CFrame.Angles(math.rad(-30+5*math.cos(sine/5)),math.rad(10+-10*math.cos(sine/5)),math.rad(-100+0*math.cos(sine/5))),.2) 
				RH.C0=RH.C0:Lerp(CFrame.new(0.5+0*math.cos(sine/5),-1+0*math.cos(sine/5),0+0*math.cos(sine/5))*CFrame.Angles(math.rad(-40+30*math.cos(sine/5)),math.rad(0+0*math.cos(sine/5)),math.rad(40+0*math.cos(sine/5))),.2) 
				LH.C0=LH.C0:Lerp(CFrame.new(-0.5+0*math.cos(sine/5),-1+0*math.cos(sine/5),0+0*math.cos(sine/5))*CFrame.Angles(math.rad(-40+30*math.cos(sine/5)),math.rad(0+0*math.cos(sine/5)),math.rad(-40+0*math.cos(sine/5))),.2)
			elseif Root.Velocity.y < -1 then -- fall
				hatset('Meshes/MeshPartAccessory (1)Accessory','HumanoidRootPart',CFrame.new(0,-1.75,-2.3),reanim['Meshes/MeshPartAccessory (1)Accessory'].Handle.AccessoryWeld.C0:Lerp(CF(0+1*math.cos(sine/5),0+0.15*math.cos(sine/5),0+0*math.cos(sine/5))*ANGLES(RAD(-90+0*math.cos(sine/5)),RAD(75+-10*math.cos(sine/5)),RAD(90+0*math.cos(sine/5))),1),false)
				reanim['Meshes/MeshPartAccessory (1)Accessory'].Handle.AccessoryWeld.C0 = reanim['Meshes/MeshPartAccessory (1)Accessory'].Handle.AccessoryWeld.C0:Lerp(CF(0+1*math.cos(sine/5),0+0.15*math.sin(sine/5),0+0*math.sin(sine/13))*ANGLES(RAD(-90+0*math.cos(sine/5)),RAD(75+-10*math.sin(sine/5)),RAD(90+0*math.sin(sine/5))),.3)
				NECK.C0=NECK.C0:Lerp(CFrame.new(0+0*math.cos(sine/5),1+0*math.cos(sine/5),0+0*math.cos(sine/5))*CFrame.Angles(math.rad(-30+10*math.sin(sine/5)),math.rad(0+0*math.cos(sine/5)),math.rad(0+0*math.sin(sine/5))),.2) 
				RJ.C0=RJ.C0:Lerp(CFrame.new(0+0*math.cos(sine/5),-2+-0.5*math.cos(sine/5),0+0*math.cos(sine/5))*CFrame.Angles(math.rad(110+-10*math.cos(sine/5)),math.rad(0+0*math.cos(sine/5)),math.rad(0+0*math.cos(sine/5))),.2) 
				RS.C0=RS.C0:Lerp(CFrame.new(1.5+0*math.cos(sine/5),0.5+0*math.cos(sine/5),0+0*math.cos(sine/5))*CFrame.Angles(math.rad(-30+5*math.cos(sine/5)),math.rad(-10+10*math.cos(sine/5)),math.rad(100+0*math.cos(sine/5))),.2) 
				LS.C0=LS.C0:Lerp(CFrame.new(-1.5+0*math.cos(sine/5),0.5+0*math.cos(sine/5),0+0*math.cos(sine/5))*CFrame.Angles(math.rad(-30+5*math.cos(sine/5)),math.rad(10+-10*math.cos(sine/5)),math.rad(-100+0*math.cos(sine/5))),.2) 
				RH.C0=RH.C0:Lerp(CFrame.new(0.5+0*math.cos(sine/5),-1+0*math.cos(sine/5),0+0*math.cos(sine/5))*CFrame.Angles(math.rad(-40+30*math.cos(sine/5)),math.rad(0+0*math.cos(sine/5)),math.rad(40+0*math.cos(sine/5))),.2) 
				LH.C0=LH.C0:Lerp(CFrame.new(-0.5+0*math.cos(sine/5),-1+0*math.cos(sine/5),0+0*math.cos(sine/5))*CFrame.Angles(math.rad(-40+30*math.cos(sine/5)),math.rad(0+0*math.cos(sine/5)),math.rad(-40+0*math.cos(sine/5))),.2)
			elseif Root.Velocity.Magnitude < 2 then -- idle
				hatset('Meshes/MeshPartAccessory (1)Accessory','HumanoidRootPart',CFrame.new(0,-1.75,-2.3),reanim['Meshes/MeshPartAccessory (1)Accessory'].Handle.AccessoryWeld.C0:Lerp(CF(0+1*math.cos(sine/5),0+0.15*math.cos(sine/5),0+0*math.cos(sine/5))*ANGLES(RAD(-90+0*math.cos(sine/5)),RAD(75+-10*math.cos(sine/5)),RAD(90+0*math.cos(sine/5))),1),false)
				reanim['Meshes/MeshPartAccessory (1)Accessory'].Handle.AccessoryWeld.C0 = reanim['Meshes/MeshPartAccessory (1)Accessory'].Handle.AccessoryWeld.C0:Lerp(CF(0+1*math.cos(sine/5),0+0.15*math.sin(sine/5),0+0*math.sin(sine/13))*ANGLES(RAD(-90+0*math.cos(sine/5)),RAD(75+-10*math.sin(sine/5)),RAD(90+0*math.sin(sine/5))),.3)
				NECK.C0=NECK.C0:Lerp(CFrame.new(0+0*math.cos(sine/5),1+0*math.cos(sine/5),0+0*math.cos(sine/5))*CFrame.Angles(math.rad(-30+10*math.sin(sine/5)),math.rad(0+0*math.cos(sine/5)),math.rad(0+0*math.sin(sine/5))),.2) 
				RJ.C0=RJ.C0:Lerp(CFrame.new(0+0*math.cos(sine/5),-2+-0.5*math.cos(sine/5),0+0*math.cos(sine/5))*CFrame.Angles(math.rad(110+-10*math.cos(sine/5)),math.rad(0+0*math.cos(sine/5)),math.rad(0+0*math.cos(sine/5))),.2) 
				RS.C0=RS.C0:Lerp(CFrame.new(1.5+0*math.cos(sine/5),0.5+0*math.cos(sine/5),0+0*math.cos(sine/5))*CFrame.Angles(math.rad(-30+5*math.cos(sine/5)),math.rad(-10+10*math.cos(sine/5)),math.rad(100+0*math.cos(sine/5))),.2) 
				LS.C0=LS.C0:Lerp(CFrame.new(-1.5+0*math.cos(sine/5),0.5+0*math.cos(sine/5),0+0*math.cos(sine/5))*CFrame.Angles(math.rad(-30+5*math.cos(sine/5)),math.rad(10+-10*math.cos(sine/5)),math.rad(-100+0*math.cos(sine/5))),.2) 
				RH.C0=RH.C0:Lerp(CFrame.new(0.5+0*math.cos(sine/5),-1+0*math.cos(sine/5),0+0*math.cos(sine/5))*CFrame.Angles(math.rad(-40+30*math.cos(sine/5)),math.rad(0+0*math.cos(sine/5)),math.rad(40+0*math.cos(sine/5))),.2) 
				LH.C0=LH.C0:Lerp(CFrame.new(-0.5+0*math.cos(sine/5),-1+0*math.cos(sine/5),0+0*math.cos(sine/5))*CFrame.Angles(math.rad(-40+30*math.cos(sine/5)),math.rad(0+0*math.cos(sine/5)),math.rad(-40+0*math.cos(sine/5))),.2)
			elseif Root.Velocity.Magnitude < 51 then -- walk
				hatset('Meshes/MeshPartAccessory (1)Accessory','HumanoidRootPart',CFrame.new(0,-1.75,-2.3),reanim['Meshes/MeshPartAccessory (1)Accessory'].Handle.AccessoryWeld.C0:Lerp(CF(0+1*math.cos(sine/5),0+0.15*math.cos(sine/5),0+0*math.cos(sine/5))*ANGLES(RAD(-90+0*math.cos(sine/5)),RAD(75+-10*math.cos(sine/5)),RAD(90+0*math.cos(sine/5))),1),false)
				reanim['Meshes/MeshPartAccessory (1)Accessory'].Handle.AccessoryWeld.C0 = reanim['Meshes/MeshPartAccessory (1)Accessory'].Handle.AccessoryWeld.C0:Lerp(CF(0+1*math.cos(sine/5),0+0.15*math.sin(sine/5),0+0*math.sin(sine/13))*ANGLES(RAD(-90+0*math.cos(sine/5)),RAD(75+-10*math.sin(sine/5)),RAD(90+0*math.sin(sine/5))),.3)
				NECK.C0=NECK.C0:Lerp(CFrame.new(0+0*math.cos(sine/5),1+0*math.cos(sine/5),0+0*math.cos(sine/5))*CFrame.Angles(math.rad(-30+10*math.sin(sine/5)),math.rad(0+0*math.cos(sine/5)),math.rad(0+0*math.sin(sine/5))),.2) 
				RJ.C0=RJ.C0:Lerp(CFrame.new(0+0*math.cos(sine/5),-2+-0.5*math.cos(sine/5),0+0*math.cos(sine/5))*CFrame.Angles(math.rad(110+-10*math.cos(sine/5)),math.rad(0+0*math.cos(sine/5)),math.rad(0+0*math.cos(sine/5))),.2) 
				RS.C0=RS.C0:Lerp(CFrame.new(1.5+0*math.cos(sine/5),0.5+0*math.cos(sine/5),0+0*math.cos(sine/5))*CFrame.Angles(math.rad(-30+5*math.cos(sine/5)),math.rad(-10+10*math.cos(sine/5)),math.rad(100+0*math.cos(sine/5))),.2) 
				LS.C0=LS.C0:Lerp(CFrame.new(-1.5+0*math.cos(sine/5),0.5+0*math.cos(sine/5),0+0*math.cos(sine/5))*CFrame.Angles(math.rad(-30+5*math.cos(sine/5)),math.rad(10+-10*math.cos(sine/5)),math.rad(-100+0*math.cos(sine/5))),.2) 
				RH.C0=RH.C0:Lerp(CFrame.new(0.5+0*math.cos(sine/5),-1+0*math.cos(sine/5),0+0*math.cos(sine/5))*CFrame.Angles(math.rad(-40+30*math.cos(sine/5)),math.rad(0+0*math.cos(sine/5)),math.rad(40+0*math.cos(sine/5))),.2) 
				LH.C0=LH.C0:Lerp(CFrame.new(-0.5+0*math.cos(sine/5),-1+0*math.cos(sine/5),0+0*math.cos(sine/5))*CFrame.Angles(math.rad(-40+30*math.cos(sine/5)),math.rad(0+0*math.cos(sine/5)),math.rad(-40+0*math.cos(sine/5))),.2)
			elseif Root.Velocity.Magnitude > 20 then -- run
				--run clerp here
			end
		elseif Mode == '3' then
			if Root.Velocity.y > 1 then -- jump
				hatset('Meshes/MeshPartAccessory (1)Accessory','HumanoidRootPart',CFrame.new(0,0.3,-2.5),reanim['Meshes/MeshPartAccessory (1)Accessory'].Handle.AccessoryWeld.C0:Lerp(CF(0+2*math.cos(sine/5),0+1*math.cos(sine/5),0+0*math.cos(sine/5))*ANGLES(RAD(-90+0*math.cos(sine/5)),RAD(60+20*math.cos(sine/5)),RAD(90+0*math.cos(sine/5))),1),false)
				reanim['Meshes/MeshPartAccessory (1)Accessory'].Handle.AccessoryWeld.C0 = reanim['Meshes/MeshPartAccessory (1)Accessory'].Handle.AccessoryWeld.C0:Lerp(CF(0+2*math.cos(sine/5),0+1*math.sin(sine/5),0+0*math.sin(sine/5))*ANGLES(RAD(-90+0*math.cos(sine/5)),RAD(60+20*math.sin(sine/5)),RAD(90+0*math.sin(sine/5))),.3)
				NECK.C0=NECK.C0:Lerp(CFrame.new(0+0*math.cos(sine/5),1+0*math.cos(sine/5),0+0*math.cos(sine/5))*CFrame.Angles(math.rad(100+-15*math.sin(sine/5)),math.rad(0+0*math.cos(sine/5)),math.rad(0+0*math.sin(sine/5))),.2) 
				RJ.C0=RJ.C0:Lerp(CFrame.new(0+0*math.cos(sine/5),-1.1+0*math.cos(sine/5),0+-0.5*math.cos(sine/5))*CFrame.Angles(math.rad(140+0*math.cos(sine/5)),math.rad(-180+0*math.cos(sine/5)),math.rad(0+0*math.cos(sine/5))),.2) 
				RS.C0=RS.C0:Lerp(CFrame.new(1.5+0*math.cos(sine/5),1.3+0*math.cos(sine/5),0.3+0*math.cos(sine/5))*CFrame.Angles(math.rad(230+0*math.cos(sine/5)),math.rad(0+0*math.cos(sine/5)),math.rad(30+-10*math.cos(sine/5))),.2) 
				LS.C0=LS.C0:Lerp(CFrame.new(-1.5+0*math.cos(sine/5),1.3+0*math.cos(sine/5),0.3+0*math.cos(sine/5))*CFrame.Angles(math.rad(230+0*math.cos(sine/5)),math.rad(0+0*math.cos(sine/5)),math.rad(-30+10*math.cos(sine/5))),.2) 
				RH.C0=RH.C0:Lerp(CFrame.new(0.5+0*math.cos(sine/5),-1+0*math.cos(sine/5),0+0*math.cos(sine/5))*CFrame.Angles(math.rad(130+15*math.cos(sine/5)),math.rad(-5+0*math.cos(sine/5)),math.rad(10+0*math.cos(sine/5))),.2) 
				LH.C0=LH.C0:Lerp(CFrame.new(-0.5+0*math.cos(sine/5),-1+0*math.cos(sine/5),0+0*math.cos(sine/5))*CFrame.Angles(math.rad(130+15*math.cos(sine/5)),math.rad(5+0*math.cos(sine/5)),math.rad(-10+0*math.cos(sine/5))),.2)
			elseif Root.Velocity.y < -1 then -- fall
				hatset('Meshes/MeshPartAccessory (1)Accessory','HumanoidRootPart',CFrame.new(0,0.3,-2.5),reanim['Meshes/MeshPartAccessory (1)Accessory'].Handle.AccessoryWeld.C0:Lerp(CF(0+2*math.cos(sine/5),0+1*math.cos(sine/5),0+0*math.cos(sine/5))*ANGLES(RAD(-90+0*math.cos(sine/5)),RAD(60+20*math.cos(sine/5)),RAD(90+0*math.cos(sine/5))),1),false)
				reanim['Meshes/MeshPartAccessory (1)Accessory'].Handle.AccessoryWeld.C0 = reanim['Meshes/MeshPartAccessory (1)Accessory'].Handle.AccessoryWeld.C0:Lerp(CF(0+2*math.cos(sine/5),0+1*math.sin(sine/5),0+0*math.sin(sine/5))*ANGLES(RAD(-90+0*math.cos(sine/5)),RAD(60+20*math.sin(sine/5)),RAD(90+0*math.sin(sine/5))),.3)
				NECK.C0=NECK.C0:Lerp(CFrame.new(0+0*math.cos(sine/5),1+0*math.cos(sine/5),0+0*math.cos(sine/5))*CFrame.Angles(math.rad(100+-15*math.sin(sine/5)),math.rad(0+0*math.cos(sine/5)),math.rad(0+0*math.sin(sine/5))),.2) 
				RJ.C0=RJ.C0:Lerp(CFrame.new(0+0*math.cos(sine/5),-1.1+0*math.cos(sine/5),0+-0.5*math.cos(sine/5))*CFrame.Angles(math.rad(140+0*math.cos(sine/5)),math.rad(-180+0*math.cos(sine/5)),math.rad(0+0*math.cos(sine/5))),.2) 
				RS.C0=RS.C0:Lerp(CFrame.new(1.5+0*math.cos(sine/5),1.3+0*math.cos(sine/5),0.3+0*math.cos(sine/5))*CFrame.Angles(math.rad(230+0*math.cos(sine/5)),math.rad(0+0*math.cos(sine/5)),math.rad(30+-10*math.cos(sine/5))),.2) 
				LS.C0=LS.C0:Lerp(CFrame.new(-1.5+0*math.cos(sine/5),1.3+0*math.cos(sine/5),0.3+0*math.cos(sine/5))*CFrame.Angles(math.rad(230+0*math.cos(sine/5)),math.rad(0+0*math.cos(sine/5)),math.rad(-30+10*math.cos(sine/5))),.2) 
				RH.C0=RH.C0:Lerp(CFrame.new(0.5+0*math.cos(sine/5),-1+0*math.cos(sine/5),0+0*math.cos(sine/5))*CFrame.Angles(math.rad(130+15*math.cos(sine/5)),math.rad(-5+0*math.cos(sine/5)),math.rad(10+0*math.cos(sine/5))),.2) 
				LH.C0=LH.C0:Lerp(CFrame.new(-0.5+0*math.cos(sine/5),-1+0*math.cos(sine/5),0+0*math.cos(sine/5))*CFrame.Angles(math.rad(130+15*math.cos(sine/5)),math.rad(5+0*math.cos(sine/5)),math.rad(-10+0*math.cos(sine/5))),.2)
			elseif Root.Velocity.Magnitude < 2 then -- idle
				hatset('Meshes/MeshPartAccessory (1)Accessory','HumanoidRootPart',CFrame.new(0,0.3,-2.5),reanim['Meshes/MeshPartAccessory (1)Accessory'].Handle.AccessoryWeld.C0:Lerp(CF(0+2*math.cos(sine/5),0+1*math.cos(sine/5),0+0*math.cos(sine/5))*ANGLES(RAD(-90+0*math.cos(sine/5)),RAD(60+20*math.cos(sine/5)),RAD(90+0*math.cos(sine/5))),1),false)
				reanim['Meshes/MeshPartAccessory (1)Accessory'].Handle.AccessoryWeld.C0 = reanim['Meshes/MeshPartAccessory (1)Accessory'].Handle.AccessoryWeld.C0:Lerp(CF(0+2*math.cos(sine/5),0+1*math.sin(sine/5),0+0*math.sin(sine/5))*ANGLES(RAD(-90+0*math.cos(sine/5)),RAD(60+20*math.sin(sine/5)),RAD(90+0*math.sin(sine/5))),.3)
				NECK.C0=NECK.C0:Lerp(CFrame.new(0+0*math.cos(sine/5),1+0*math.cos(sine/5),0+0*math.cos(sine/5))*CFrame.Angles(math.rad(100+-15*math.sin(sine/5)),math.rad(0+0*math.cos(sine/5)),math.rad(0+0*math.sin(sine/5))),.2) 
				RJ.C0=RJ.C0:Lerp(CFrame.new(0+0*math.cos(sine/5),-1.1+0*math.cos(sine/5),0+-0.5*math.cos(sine/5))*CFrame.Angles(math.rad(140+0*math.cos(sine/5)),math.rad(-180+0*math.cos(sine/5)),math.rad(0+0*math.cos(sine/5))),.2) 
				RS.C0=RS.C0:Lerp(CFrame.new(1.5+0*math.cos(sine/5),1.3+0*math.cos(sine/5),0.3+0*math.cos(sine/5))*CFrame.Angles(math.rad(230+0*math.cos(sine/5)),math.rad(0+0*math.cos(sine/5)),math.rad(30+-10*math.cos(sine/5))),.2) 
				LS.C0=LS.C0:Lerp(CFrame.new(-1.5+0*math.cos(sine/5),1.3+0*math.cos(sine/5),0.3+0*math.cos(sine/5))*CFrame.Angles(math.rad(230+0*math.cos(sine/5)),math.rad(0+0*math.cos(sine/5)),math.rad(-30+10*math.cos(sine/5))),.2) 
				RH.C0=RH.C0:Lerp(CFrame.new(0.5+0*math.cos(sine/5),-1+0*math.cos(sine/5),0+0*math.cos(sine/5))*CFrame.Angles(math.rad(130+15*math.cos(sine/5)),math.rad(-5+0*math.cos(sine/5)),math.rad(10+0*math.cos(sine/5))),.2) 
				LH.C0=LH.C0:Lerp(CFrame.new(-0.5+0*math.cos(sine/5),-1+0*math.cos(sine/5),0+0*math.cos(sine/5))*CFrame.Angles(math.rad(130+15*math.cos(sine/5)),math.rad(5+0*math.cos(sine/5)),math.rad(-10+0*math.cos(sine/5))),.2)
			elseif Root.Velocity.Magnitude < 51 then -- walk
				hatset('Meshes/MeshPartAccessory (1)Accessory','HumanoidRootPart',CFrame.new(0,0.3,-2.5),reanim['Meshes/MeshPartAccessory (1)Accessory'].Handle.AccessoryWeld.C0:Lerp(CF(0+2*math.cos(sine/5),0+1*math.cos(sine/5),0+0*math.cos(sine/5))*ANGLES(RAD(-90+0*math.cos(sine/5)),RAD(60+20*math.cos(sine/5)),RAD(90+0*math.cos(sine/5))),1),false)
				reanim['Meshes/MeshPartAccessory (1)Accessory'].Handle.AccessoryWeld.C0 = reanim['Meshes/MeshPartAccessory (1)Accessory'].Handle.AccessoryWeld.C0:Lerp(CF(0+2*math.cos(sine/5),0+1*math.sin(sine/5),0+0*math.sin(sine/5))*ANGLES(RAD(-90+0*math.cos(sine/5)),RAD(60+20*math.sin(sine/5)),RAD(90+0*math.sin(sine/5))),.3)
				NECK.C0=NECK.C0:Lerp(CFrame.new(0+0*math.cos(sine/5),1+0*math.cos(sine/5),0+0*math.cos(sine/5))*CFrame.Angles(math.rad(100+-15*math.sin(sine/5)),math.rad(0+0*math.cos(sine/5)),math.rad(0+0*math.sin(sine/5))),.2) 
				RJ.C0=RJ.C0:Lerp(CFrame.new(0+0*math.cos(sine/5),-1.1+0*math.cos(sine/5),0+-0.5*math.cos(sine/5))*CFrame.Angles(math.rad(140+0*math.cos(sine/5)),math.rad(-180+0*math.cos(sine/5)),math.rad(0+0*math.cos(sine/5))),.2) 
				RS.C0=RS.C0:Lerp(CFrame.new(1.5+0*math.cos(sine/5),1.3+0*math.cos(sine/5),0.3+0*math.cos(sine/5))*CFrame.Angles(math.rad(230+0*math.cos(sine/5)),math.rad(0+0*math.cos(sine/5)),math.rad(30+-10*math.cos(sine/5))),.2) 
				LS.C0=LS.C0:Lerp(CFrame.new(-1.5+0*math.cos(sine/5),1.3+0*math.cos(sine/5),0.3+0*math.cos(sine/5))*CFrame.Angles(math.rad(230+0*math.cos(sine/5)),math.rad(0+0*math.cos(sine/5)),math.rad(-30+10*math.cos(sine/5))),.2) 
				RH.C0=RH.C0:Lerp(CFrame.new(0.5+0*math.cos(sine/5),-1+0*math.cos(sine/5),0+0*math.cos(sine/5))*CFrame.Angles(math.rad(130+15*math.cos(sine/5)),math.rad(-5+0*math.cos(sine/5)),math.rad(10+0*math.cos(sine/5))),.2) 
				LH.C0=LH.C0:Lerp(CFrame.new(-0.5+0*math.cos(sine/5),-1+0*math.cos(sine/5),0+0*math.cos(sine/5))*CFrame.Angles(math.rad(130+15*math.cos(sine/5)),math.rad(5+0*math.cos(sine/5)),math.rad(-10+0*math.cos(sine/5))),.2)
			elseif Root.Velocity.Magnitude > 20 then -- run
				--run clerp here
			end
		elseif Mode == '4' then
			if Root.Velocity.y > 1 then -- jump
				hatset('Meshes/MeshPartAccessory (1)Accessory','HumanoidRootPart',CFrame.new(0,1,-0.2),reanim['Meshes/MeshPartAccessory (1)Accessory'].Handle.AccessoryWeld.C0:Lerp(CF(0+2*math.cos(sine/5),0+-0.5*math.cos(sine/5),0+0*math.cos(sine/5))*ANGLES(RAD(-90+0*math.cos(sine/5)),RAD(0+-20*math.cos(sine/5)),RAD(-90+0*math.cos(sine/5))),1),false)
				reanim['Meshes/MeshPartAccessory (1)Accessory'].Handle.AccessoryWeld.C0 = reanim['Meshes/MeshPartAccessory (1)Accessory'].Handle.AccessoryWeld.C0:Lerp(CF(0+2*math.cos(sine/5),0+-0.5*math.sin(sine/5),0+0*math.sin(sine/5))*ANGLES(RAD(-90+0*math.cos(sine/5)),RAD(0+-20*math.sin(sine/5)),RAD(-90+0*math.sin(sine/5))),.3)
				NECK.C0=NECK.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),1+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(30+-25*math.sin(sine/5)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.sin(sine/10))),.2) 
				RJ.C0=RJ.C0:Lerp(CFrame.new(0+0*math.cos(sine/5),3+-1.5*math.cos(sine/5),0+-0.3*math.cos(sine/5))*CFrame.Angles(math.rad(30+-10*math.cos(sine/5)),math.rad(0+0*math.cos(sine/5)),math.rad(0+0*math.cos(sine/10))),.2) 
				RS.C0=RS.C0:Lerp(CFrame.new(1.5+0*math.cos(sine/10),0.5+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(-30+25*math.sin(sine/5)),math.rad(-10+30*math.cos(sine/5)),math.rad(10+0*math.sin(sine/5))),.2) 
				LS.C0=LS.C0:Lerp(CFrame.new(-1.5+0*math.cos(sine/10),0.5+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(-30+25*math.sin(sine/5)),math.rad(10+-30*math.cos(sine/5)),math.rad(-10+0*math.cos(sine/5))),.2) 
				RH.C0=RH.C0:Lerp(CFrame.new(0.5+0*math.cos(sine/10),-1+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(-30+25*math.sin(sine/5)),math.rad(-20+-30*math.cos(sine/5)),math.rad(20+0*math.cos(sine/10))),.2) 
				LH.C0=LH.C0:Lerp(CFrame.new(-0.5+0*math.cos(sine/10),-1+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(-30+25*math.sin(sine/5)),math.rad(20+30*math.cos(sine/5)),math.rad(-20+0*math.cos(sine/5))),.2)
			elseif Root.Velocity.y < -1 then -- fall
				hatset('Meshes/MeshPartAccessory (1)Accessory','HumanoidRootPart',CFrame.new(0,1,-0.2),reanim['Meshes/MeshPartAccessory (1)Accessory'].Handle.AccessoryWeld.C0:Lerp(CF(0+2*math.cos(sine/5),0+-0.5*math.cos(sine/5),0+0*math.cos(sine/5))*ANGLES(RAD(-90+0*math.cos(sine/5)),RAD(0+-20*math.cos(sine/5)),RAD(-90+0*math.cos(sine/5))),1),false)
				reanim['Meshes/MeshPartAccessory (1)Accessory'].Handle.AccessoryWeld.C0 = reanim['Meshes/MeshPartAccessory (1)Accessory'].Handle.AccessoryWeld.C0:Lerp(CF(0+2*math.cos(sine/5),0+-0.5*math.sin(sine/5),0+0*math.sin(sine/5))*ANGLES(RAD(-90+0*math.cos(sine/5)),RAD(0+-20*math.sin(sine/5)),RAD(-90+0*math.sin(sine/5))),.3)
				NECK.C0=NECK.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),1+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(30+-25*math.sin(sine/5)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.sin(sine/10))),.2) 
				RJ.C0=RJ.C0:Lerp(CFrame.new(0+0*math.cos(sine/5),3+-1.5*math.cos(sine/5),0+-0.3*math.cos(sine/5))*CFrame.Angles(math.rad(30+-10*math.cos(sine/5)),math.rad(0+0*math.cos(sine/5)),math.rad(0+0*math.cos(sine/10))),.2) 
				RS.C0=RS.C0:Lerp(CFrame.new(1.5+0*math.cos(sine/10),0.5+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(-30+25*math.sin(sine/5)),math.rad(-10+30*math.cos(sine/5)),math.rad(10+0*math.sin(sine/5))),.2) 
				LS.C0=LS.C0:Lerp(CFrame.new(-1.5+0*math.cos(sine/10),0.5+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(-30+25*math.sin(sine/5)),math.rad(10+-30*math.cos(sine/5)),math.rad(-10+0*math.cos(sine/5))),.2) 
				RH.C0=RH.C0:Lerp(CFrame.new(0.5+0*math.cos(sine/10),-1+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(-30+25*math.sin(sine/5)),math.rad(-20+-30*math.cos(sine/5)),math.rad(20+0*math.cos(sine/10))),.2) 
				LH.C0=LH.C0:Lerp(CFrame.new(-0.5+0*math.cos(sine/10),-1+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(-30+25*math.sin(sine/5)),math.rad(20+30*math.cos(sine/5)),math.rad(-20+0*math.cos(sine/5))),.2)
			elseif Root.Velocity.Magnitude < 2 then -- idle
				hatset('Meshes/MeshPartAccessory (1)Accessory','HumanoidRootPart',CFrame.new(0,1,-0.2),reanim['Meshes/MeshPartAccessory (1)Accessory'].Handle.AccessoryWeld.C0:Lerp(CF(0+2*math.cos(sine/5),0+-0.5*math.cos(sine/5),0+0*math.cos(sine/5))*ANGLES(RAD(-90+0*math.cos(sine/5)),RAD(0+-20*math.cos(sine/5)),RAD(-90+0*math.cos(sine/5))),1),false)
				reanim['Meshes/MeshPartAccessory (1)Accessory'].Handle.AccessoryWeld.C0 = reanim['Meshes/MeshPartAccessory (1)Accessory'].Handle.AccessoryWeld.C0:Lerp(CF(0+2*math.cos(sine/5),0+-0.5*math.sin(sine/5),0+0*math.sin(sine/5))*ANGLES(RAD(-90+0*math.cos(sine/5)),RAD(0+-20*math.sin(sine/5)),RAD(-90+0*math.sin(sine/5))),.3)
				NECK.C0=NECK.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),1+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(30+-25*math.sin(sine/5)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.sin(sine/10))),.2) 
				RJ.C0=RJ.C0:Lerp(CFrame.new(0+0*math.cos(sine/5),3+-1.5*math.cos(sine/5),0+-0.3*math.cos(sine/5))*CFrame.Angles(math.rad(30+-10*math.cos(sine/5)),math.rad(0+0*math.cos(sine/5)),math.rad(0+0*math.cos(sine/10))),.2) 
				RS.C0=RS.C0:Lerp(CFrame.new(1.5+0*math.cos(sine/10),0.5+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(-30+25*math.sin(sine/5)),math.rad(-10+30*math.cos(sine/5)),math.rad(10+0*math.sin(sine/5))),.2) 
				LS.C0=LS.C0:Lerp(CFrame.new(-1.5+0*math.cos(sine/10),0.5+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(-30+25*math.sin(sine/5)),math.rad(10+-30*math.cos(sine/5)),math.rad(-10+0*math.cos(sine/5))),.2) 
				RH.C0=RH.C0:Lerp(CFrame.new(0.5+0*math.cos(sine/10),-1+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(-30+25*math.sin(sine/5)),math.rad(-20+-30*math.cos(sine/5)),math.rad(20+0*math.cos(sine/10))),.2) 
				LH.C0=LH.C0:Lerp(CFrame.new(-0.5+0*math.cos(sine/10),-1+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(-30+25*math.sin(sine/5)),math.rad(20+30*math.cos(sine/5)),math.rad(-20+0*math.cos(sine/5))),.2)
			elseif Root.Velocity.Magnitude < 51 then -- walk
				hatset('Meshes/MeshPartAccessory (1)Accessory','HumanoidRootPart',CFrame.new(0,1,-0.2),reanim['Meshes/MeshPartAccessory (1)Accessory'].Handle.AccessoryWeld.C0:Lerp(CF(0+2*math.cos(sine/5),0+-0.5*math.cos(sine/5),0+0*math.cos(sine/5))*ANGLES(RAD(-90+0*math.cos(sine/5)),RAD(0+-20*math.cos(sine/5)),RAD(-90+0*math.cos(sine/5))),1),false)
				reanim['Meshes/MeshPartAccessory (1)Accessory'].Handle.AccessoryWeld.C0 = reanim['Meshes/MeshPartAccessory (1)Accessory'].Handle.AccessoryWeld.C0:Lerp(CF(0+2*math.cos(sine/5),0+-0.5*math.sin(sine/5),0+0*math.sin(sine/5))*ANGLES(RAD(-90+0*math.cos(sine/5)),RAD(0+-20*math.sin(sine/5)),RAD(-90+0*math.sin(sine/5))),.3)
				NECK.C0=NECK.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),1+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(30+-25*math.sin(sine/5)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.sin(sine/10))),.2) 
				RJ.C0=RJ.C0:Lerp(CFrame.new(0+0*math.cos(sine/5),3+-1.5*math.cos(sine/5),0+-0.3*math.cos(sine/5))*CFrame.Angles(math.rad(30+-10*math.cos(sine/5)),math.rad(0+0*math.cos(sine/5)),math.rad(0+0*math.cos(sine/10))),.2) 
				RS.C0=RS.C0:Lerp(CFrame.new(1.5+0*math.cos(sine/10),0.5+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(-30+25*math.sin(sine/5)),math.rad(-10+30*math.cos(sine/5)),math.rad(10+0*math.sin(sine/5))),.2) 
				LS.C0=LS.C0:Lerp(CFrame.new(-1.5+0*math.cos(sine/10),0.5+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(-30+25*math.sin(sine/5)),math.rad(10+-30*math.cos(sine/5)),math.rad(-10+0*math.cos(sine/5))),.2) 
				RH.C0=RH.C0:Lerp(CFrame.new(0.5+0*math.cos(sine/10),-1+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(-30+25*math.sin(sine/5)),math.rad(-20+-30*math.cos(sine/5)),math.rad(20+0*math.cos(sine/10))),.2) 
				LH.C0=LH.C0:Lerp(CFrame.new(-0.5+0*math.cos(sine/10),-1+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(-30+25*math.sin(sine/5)),math.rad(20+30*math.cos(sine/5)),math.rad(-20+0*math.cos(sine/5))),.2)
			elseif Root.Velocity.Magnitude > 20 then -- run
				--run clerp here
			end
		elseif Mode == '5' then
			if Root.Velocity.y > 1 then -- jump
				hatset('Meshes/MeshPartAccessory (1)Accessory','HumanoidRootPart',CFrame.new(0,-2.1,0.3),reanim['Meshes/MeshPartAccessory (1)Accessory'].Handle.AccessoryWeld.C0:Lerp(CF(0+-1*math.cos(sine/5),0+0*math.sin(sine/5),0+0*math.sin(sine/5))*ANGLES(RAD(90+0*math.cos(sine/5)),RAD(-105+0*math.sin(sine/5)),RAD(90+0*math.sin(sine/5))),1),false)

				reanim['Meshes/MeshPartAccessory (1)Accessory'].Handle.AccessoryWeld.C0 = reanim['Meshes/MeshPartAccessory (1)Accessory'].Handle.AccessoryWeld.C0:Lerp(CF(0+-1*math.cos(sine/5),0+0*math.sin(sine/5),0+0*math.sin(sine/5))*ANGLES(RAD(90+0*math.cos(sine/5)),RAD(-105+0*math.sin(sine/5)),RAD(90+0*math.sin(sine/5))),.3)
				NECK.C0=NECK.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),1+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(80+-20*math.sin(sine/5)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.sin(sine/10))),.2) 
				RJ.C0=RJ.C0:Lerp(CFrame.new(0+0*math.cos(sine/5),-2+0*math.cos(sine/5),0+0.5*math.cos(sine/5))*CFrame.Angles(math.rad(-80+0*math.cos(sine/5)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10))),.2) 
				RS.C0=RS.C0:Lerp(CFrame.new(1.5+0*math.cos(sine/10),1+0*math.cos(sine/10),-0.5+0*math.cos(sine/10))*CFrame.Angles(math.rad(140+10*math.cos(sine/5)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10))),.2) 
				LS.C0=LS.C0:Lerp(CFrame.new(-1.5+0*math.cos(sine/10),1+0*math.cos(sine/10),-0.5+0*math.cos(sine/10))*CFrame.Angles(math.rad(140+10*math.cos(sine/5)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10))),.2) 
				RH.C0=RH.C0:Lerp(CFrame.new(0.5+0*math.cos(sine/5),-0.5+0.5*math.cos(sine/5),-0.7+-0.1*math.cos(sine/5))*CFrame.Angles(math.rad(-10+0*math.cos(sine/5)),math.rad(0+0*math.cos(sine/5)),math.rad(0+0*math.cos(sine/5))),.2) 
				LH.C0=LH.C0:Lerp(CFrame.new(-0.5+0*math.cos(sine/5),-0.5+0.5*math.cos(sine/5),-0.7+-0.1*math.cos(sine/5))*CFrame.Angles(math.rad(-10+0*math.cos(sine/5)),math.rad(0+0*math.cos(sine/5)),math.rad(0+0*math.cos(sine/5))),.2)
			elseif Root.Velocity.y < -1 then -- fall
				hatset('Meshes/MeshPartAccessory (1)Accessory','HumanoidRootPart',CFrame.new(0,-2.1,0.3),reanim['Meshes/MeshPartAccessory (1)Accessory'].Handle.AccessoryWeld.C0:Lerp(CF(0+-1*math.cos(sine/5),0+0*math.sin(sine/5),0+0*math.sin(sine/5))*ANGLES(RAD(90+0*math.cos(sine/5)),RAD(-105+0*math.sin(sine/5)),RAD(90+0*math.sin(sine/5))),1),false)
				reanim['Meshes/MeshPartAccessory (1)Accessory'].Handle.AccessoryWeld.C0 = reanim['Meshes/MeshPartAccessory (1)Accessory'].Handle.AccessoryWeld.C0:Lerp(CF(0+-1*math.cos(sine/5),0+0*math.sin(sine/5),0+0*math.sin(sine/5))*ANGLES(RAD(90+0*math.cos(sine/5)),RAD(-105+0*math.sin(sine/5)),RAD(90+0*math.sin(sine/5))),.3)
				NECK.C0=NECK.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),1+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(80+-20*math.sin(sine/5)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.sin(sine/10))),.2) 
				RJ.C0=RJ.C0:Lerp(CFrame.new(0+0*math.cos(sine/5),-2+0*math.cos(sine/5),0+0.5*math.cos(sine/5))*CFrame.Angles(math.rad(-80+0*math.cos(sine/5)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10))),.2) 
				RS.C0=RS.C0:Lerp(CFrame.new(1.5+0*math.cos(sine/10),1+0*math.cos(sine/10),-0.5+0*math.cos(sine/10))*CFrame.Angles(math.rad(140+10*math.cos(sine/5)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10))),.2) 
				LS.C0=LS.C0:Lerp(CFrame.new(-1.5+0*math.cos(sine/10),1+0*math.cos(sine/10),-0.5+0*math.cos(sine/10))*CFrame.Angles(math.rad(140+10*math.cos(sine/5)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10))),.2) 
				RH.C0=RH.C0:Lerp(CFrame.new(0.5+0*math.cos(sine/5),-0.5+0.5*math.cos(sine/5),-0.7+-0.1*math.cos(sine/5))*CFrame.Angles(math.rad(-10+0*math.cos(sine/5)),math.rad(0+0*math.cos(sine/5)),math.rad(0+0*math.cos(sine/5))),.2) 
				LH.C0=LH.C0:Lerp(CFrame.new(-0.5+0*math.cos(sine/5),-0.5+0.5*math.cos(sine/5),-0.7+-0.1*math.cos(sine/5))*CFrame.Angles(math.rad(-10+0*math.cos(sine/5)),math.rad(0+0*math.cos(sine/5)),math.rad(0+0*math.cos(sine/5))),.2)
			elseif Root.Velocity.Magnitude < 2 then
				hatset('Meshes/MeshPartAccessory (1)Accessory','HumanoidRootPart',CFrame.new(0,-2.1,0.3),reanim['Meshes/MeshPartAccessory (1)Accessory'].Handle.AccessoryWeld.C0:Lerp(CF(0+-1*math.cos(sine/5),0+0*math.cos(sine/5),0+0*math.cos(sine/5))*ANGLES(RAD(90+0*math.cos(sine/5)),RAD(-105+0*math.cos(sine/5)),RAD(90+0*math.cos(sine/5))),1),false)
				reanim['Meshes/MeshPartAccessory (1)Accessory'].Handle.AccessoryWeld.C0 = reanim['Meshes/MeshPartAccessory (1)Accessory'].Handle.AccessoryWeld.C0:Lerp(CF(0+-1*math.cos(sine/5),0+0*math.sin(sine/5),0+0*math.sin(sine/5))*ANGLES(RAD(90+0*math.cos(sine/5)),RAD(-105+0*math.sin(sine/5)),RAD(90+0*math.sin(sine/5))),.3)
				NECK.C0=NECK.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),1+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(80+-20*math.sin(sine/5)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.sin(sine/10))),.2) 
				RJ.C0=RJ.C0:Lerp(CFrame.new(0+0*math.cos(sine/5),-2+0*math.cos(sine/5),0+0.5*math.cos(sine/5))*CFrame.Angles(math.rad(-80+0*math.cos(sine/5)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10))),.2) 
				RS.C0=RS.C0:Lerp(CFrame.new(1.5+0*math.cos(sine/10),1+0*math.cos(sine/10),-0.5+0*math.cos(sine/10))*CFrame.Angles(math.rad(140+10*math.cos(sine/5)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10))),.2) 
				LS.C0=LS.C0:Lerp(CFrame.new(-1.5+0*math.cos(sine/10),1+0*math.cos(sine/10),-0.5+0*math.cos(sine/10))*CFrame.Angles(math.rad(140+10*math.cos(sine/5)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10))),.2) 
				RH.C0=RH.C0:Lerp(CFrame.new(0.5+0*math.cos(sine/5),-0.5+0.5*math.cos(sine/5),-0.7+-0.1*math.cos(sine/5))*CFrame.Angles(math.rad(-10+0*math.cos(sine/5)),math.rad(0+0*math.cos(sine/5)),math.rad(0+0*math.cos(sine/5))),.2) 
				LH.C0=LH.C0:Lerp(CFrame.new(-0.5+0*math.cos(sine/5),-0.5+0.5*math.cos(sine/5),-0.7+-0.1*math.cos(sine/5))*CFrame.Angles(math.rad(-10+0*math.cos(sine/5)),math.rad(0+0*math.cos(sine/5)),math.rad(0+0*math.cos(sine/5))),.2)
			elseif Root.Velocity.Magnitude < 20 then -- walk
				hatset('Meshes/MeshPartAccessory (1)Accessory','HumanoidRootPart',CFrame.new(0,-2.1,0.3),reanim['Meshes/MeshPartAccessory (1)Accessory'].Handle.AccessoryWeld.C0:Lerp(CF(0+-1*math.cos(sine/5),0+0*math.sin(sine/5),0+0*math.sin(sine/5))*ANGLES(RAD(90+0*math.cos(sine/5)),RAD(-105+0*math.sin(sine/5)),RAD(90+0*math.sin(sine/5))),1),false)

				reanim['Meshes/MeshPartAccessory (1)Accessory'].Handle.AccessoryWeld.C0 = reanim['Meshes/MeshPartAccessory (1)Accessory'].Handle.AccessoryWeld.C0:Lerp(CF(0+-1*math.cos(sine/5),0+0*math.sin(sine/5),0+0*math.sin(sine/5))*ANGLES(RAD(90+0*math.cos(sine/5)),RAD(-105+0*math.sin(sine/5)),RAD(90+0*math.sin(sine/5))),.3)
				NECK.C0=NECK.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),1+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(80+-20*math.sin(sine/5)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.sin(sine/10))),.2) 
				RJ.C0=RJ.C0:Lerp(CFrame.new(0+0*math.cos(sine/5),-2+0*math.cos(sine/5),0+0.5*math.cos(sine/5))*CFrame.Angles(math.rad(-80+0*math.cos(sine/5)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10))),.2) 
				RS.C0=RS.C0:Lerp(CFrame.new(1.5+0*math.cos(sine/10),1+0*math.cos(sine/10),-0.5+0*math.cos(sine/10))*CFrame.Angles(math.rad(140+10*math.cos(sine/5)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10))),.2) 
				LS.C0=LS.C0:Lerp(CFrame.new(-1.5+0*math.cos(sine/10),1+0*math.cos(sine/10),-0.5+0*math.cos(sine/10))*CFrame.Angles(math.rad(140+10*math.cos(sine/5)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10))),.2) 
				RH.C0=RH.C0:Lerp(CFrame.new(0.5+0*math.cos(sine/5),-0.5+0.5*math.cos(sine/5),-0.7+-0.1*math.cos(sine/5))*CFrame.Angles(math.rad(-10+0*math.cos(sine/5)),math.rad(0+0*math.cos(sine/5)),math.rad(0+0*math.cos(sine/5))),.2) 
				LH.C0=LH.C0:Lerp(CFrame.new(-0.5+0*math.cos(sine/5),-0.5+0.5*math.cos(sine/5),-0.7+-0.1*math.cos(sine/5))*CFrame.Angles(math.rad(-10+0*math.cos(sine/5)),math.rad(0+0*math.cos(sine/5)),math.rad(0+0*math.cos(sine/5))),.2)
			elseif Root.Velocity.Magnitude > 20 then
				--run clerp here
			end
		elseif Mode == '6' then
			if Root.Velocity.y > 1 then -- jump
				hatset('Meshes/MeshPartAccessory (1)Accessory','HumanoidRootPart',CFrame.new(0,2.5,-3),reanim['Meshes/MeshPartAccessory (1)Accessory'].Handle.AccessoryWeld.C0:Lerp(CF(0+1.5*math.cos(sine/5),0+0*math.cos(sine/5),0+0*math.cos(sine/5))*ANGLES(RAD(90+0*math.cos(sine/5)),RAD(145+10*math.cos(sine/5)),RAD(-90+0*math.cos(sine/13))),1),false)
				reanim['Meshes/MeshPartAccessory (1)Accessory'].Handle.AccessoryWeld.C0 = reanim['Meshes/MeshPartAccessory (1)Accessory'].Handle.AccessoryWeld.C0:Lerp(CF(0+1.5*math.cos(sine/5),0+0*math.sin(sine/5),0+0*math.sin(sine/5))*ANGLES(RAD(90+0*math.cos(sine/5)),RAD(145+10*math.sin(sine/5)),RAD(-90+0*math.sin(sine/5))),.3)
				NECK.C0=NECK.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),1+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(60+-10*math.sin(sine/5)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.sin(sine/10))),.2) 
				RJ.C0=RJ.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),-2+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(-30+-15*math.cos(sine/5)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10))),.2) 
				RS.C0=RS.C0:Lerp(CFrame.new(1.5+0*math.cos(sine/5),0+0.245*math.cos(sine/5),-1+0.245*math.cos(sine/5))*CFrame.Angles(math.rad(50+15*math.cos(sine/5)),math.rad(0+0*math.cos(sine/5)),math.rad(0+0*math.cos(sine/10))),.2) 
				LS.C0=LS.C0:Lerp(CFrame.new(-1.5+0*math.cos(sine/5),0+0.245*math.cos(sine/5),-1+0.245*math.cos(sine/5))*CFrame.Angles(math.rad(50+15*math.cos(sine/5)),math.rad(0+0*math.cos(sine/5)),math.rad(0+0*math.cos(sine/5))),.2) 
				RH.C0=RH.C0:Lerp(CFrame.new(0.5+0*math.cos(sine/5),-1+0.3*math.cos(sine/5),-1+0*math.cos(sine/5))*CFrame.Angles(math.rad(-60+15*math.cos(sine/5)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10))),.2) 
				LH.C0=LH.C0:Lerp(CFrame.new(-0.5+0*math.cos(sine/5),-1+0.3*math.cos(sine/5),-1+0*math.cos(sine/5))*CFrame.Angles(math.rad(-60+15*math.cos(sine/5)),math.rad(0+0*math.cos(sine/5)),math.rad(0+0*math.cos(sine/5))),.2)
			elseif Root.Velocity.y < -1 then -- fall
				hatset('Meshes/MeshPartAccessory (1)Accessory','HumanoidRootPart',CFrame.new(0,2.5,-3),reanim['Meshes/MeshPartAccessory (1)Accessory'].Handle.AccessoryWeld.C0:Lerp(CF(0+1.5*math.cos(sine/5),0+0*math.cos(sine/5),0+0*math.cos(sine/5))*ANGLES(RAD(90+0*math.cos(sine/5)),RAD(145+10*math.cos(sine/5)),RAD(-90+0*math.cos(sine/13))),1),false)
				reanim['Meshes/MeshPartAccessory (1)Accessory'].Handle.AccessoryWeld.C0 = reanim['Meshes/MeshPartAccessory (1)Accessory'].Handle.AccessoryWeld.C0:Lerp(CF(0+1.5*math.cos(sine/5),0+0*math.sin(sine/5),0+0*math.sin(sine/5))*ANGLES(RAD(90+0*math.cos(sine/5)),RAD(145+10*math.sin(sine/5)),RAD(-90+0*math.sin(sine/5))),.3)
				NECK.C0=NECK.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),1+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(60+-10*math.sin(sine/5)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.sin(sine/10))),.2) 
				RJ.C0=RJ.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),-2+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(-30+-15*math.cos(sine/5)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10))),.2) 
				RS.C0=RS.C0:Lerp(CFrame.new(1.5+0*math.cos(sine/5),0+0.245*math.cos(sine/5),-1+0.245*math.cos(sine/5))*CFrame.Angles(math.rad(50+15*math.cos(sine/5)),math.rad(0+0*math.cos(sine/5)),math.rad(0+0*math.cos(sine/10))),.2) 
				LS.C0=LS.C0:Lerp(CFrame.new(-1.5+0*math.cos(sine/5),0+0.245*math.cos(sine/5),-1+0.245*math.cos(sine/5))*CFrame.Angles(math.rad(50+15*math.cos(sine/5)),math.rad(0+0*math.cos(sine/5)),math.rad(0+0*math.cos(sine/5))),.2) 
				RH.C0=RH.C0:Lerp(CFrame.new(0.5+0*math.cos(sine/5),-1+0.3*math.cos(sine/5),-1+0*math.cos(sine/5))*CFrame.Angles(math.rad(-60+15*math.cos(sine/5)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10))),.2) 
				LH.C0=LH.C0:Lerp(CFrame.new(-0.5+0*math.cos(sine/5),-1+0.3*math.cos(sine/5),-1+0*math.cos(sine/5))*CFrame.Angles(math.rad(-60+15*math.cos(sine/5)),math.rad(0+0*math.cos(sine/5)),math.rad(0+0*math.cos(sine/5))),.2)
			elseif Root.Velocity.Magnitude < 2 then -- idle
				hatset('Meshes/MeshPartAccessory (1)Accessory','HumanoidRootPart',CFrame.new(0,2.5,-3),reanim['Meshes/MeshPartAccessory (1)Accessory'].Handle.AccessoryWeld.C0:Lerp(CF(0+1.5*math.cos(sine/5),0+0*math.cos(sine/5),0+0*math.cos(sine/5))*ANGLES(RAD(90+0*math.cos(sine/5)),RAD(145+10*math.cos(sine/5)),RAD(-90+0*math.cos(sine/13))),1),false)
				reanim['Meshes/MeshPartAccessory (1)Accessory'].Handle.AccessoryWeld.C0 = reanim['Meshes/MeshPartAccessory (1)Accessory'].Handle.AccessoryWeld.C0:Lerp(CF(0+1.5*math.cos(sine/5),0+0*math.sin(sine/5),0+0*math.sin(sine/5))*ANGLES(RAD(90+0*math.cos(sine/5)),RAD(145+10*math.sin(sine/5)),RAD(-90+0*math.sin(sine/5))),.3)
				NECK.C0=NECK.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),1+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(60+-10*math.sin(sine/5)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.sin(sine/10))),.2) 
				RJ.C0=RJ.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),-2+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(-30+-15*math.cos(sine/5)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10))),.2) 
				RS.C0=RS.C0:Lerp(CFrame.new(1.5+0*math.cos(sine/5),0+0.245*math.cos(sine/5),-1+0.245*math.cos(sine/5))*CFrame.Angles(math.rad(50+15*math.cos(sine/5)),math.rad(0+0*math.cos(sine/5)),math.rad(0+0*math.cos(sine/10))),.2) 
				LS.C0=LS.C0:Lerp(CFrame.new(-1.5+0*math.cos(sine/5),0+0.245*math.cos(sine/5),-1+0.245*math.cos(sine/5))*CFrame.Angles(math.rad(50+15*math.cos(sine/5)),math.rad(0+0*math.cos(sine/5)),math.rad(0+0*math.cos(sine/5))),.2) 
				RH.C0=RH.C0:Lerp(CFrame.new(0.5+0*math.cos(sine/5),-1+0.3*math.cos(sine/5),-1+0*math.cos(sine/5))*CFrame.Angles(math.rad(-60+15*math.cos(sine/5)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10))),.2) 
				LH.C0=LH.C0:Lerp(CFrame.new(-0.5+0*math.cos(sine/5),-1+0.3*math.cos(sine/5),-1+0*math.cos(sine/5))*CFrame.Angles(math.rad(-60+15*math.cos(sine/5)),math.rad(0+0*math.cos(sine/5)),math.rad(0+0*math.cos(sine/5))),.2)
			elseif Root.Velocity.Magnitude < 20 then -- walk
				hatset('Meshes/MeshPartAccessory (1)Accessory','HumanoidRootPart',CFrame.new(0,2.5,-3),reanim['Meshes/MeshPartAccessory (1)Accessory'].Handle.AccessoryWeld.C0:Lerp(CF(0+1.5*math.cos(sine/5),0+0*math.cos(sine/5),0+0*math.cos(sine/5))*ANGLES(RAD(90+0*math.cos(sine/5)),RAD(145+10*math.cos(sine/5)),RAD(-90+0*math.cos(sine/13))),1),false)
				reanim['Meshes/MeshPartAccessory (1)Accessory'].Handle.AccessoryWeld.C0 = reanim['Meshes/MeshPartAccessory (1)Accessory'].Handle.AccessoryWeld.C0:Lerp(CF(0+1.5*math.cos(sine/5),0+0*math.sin(sine/5),0+0*math.sin(sine/5))*ANGLES(RAD(90+0*math.cos(sine/5)),RAD(145+10*math.sin(sine/5)),RAD(-90+0*math.sin(sine/5))),.3)
				NECK.C0=NECK.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),1+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(60+-10*math.sin(sine/5)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.sin(sine/10))),.2) 
				RJ.C0=RJ.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),-2+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(-30+-15*math.cos(sine/5)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10))),.2) 
				RS.C0=RS.C0:Lerp(CFrame.new(1.5+0*math.cos(sine/5),0+0.245*math.cos(sine/5),-1+0.245*math.cos(sine/5))*CFrame.Angles(math.rad(50+15*math.cos(sine/5)),math.rad(0+0*math.cos(sine/5)),math.rad(0+0*math.cos(sine/10))),.2) 
				LS.C0=LS.C0:Lerp(CFrame.new(-1.5+0*math.cos(sine/5),0+0.245*math.cos(sine/5),-1+0.245*math.cos(sine/5))*CFrame.Angles(math.rad(50+15*math.cos(sine/5)),math.rad(0+0*math.cos(sine/5)),math.rad(0+0*math.cos(sine/5))),.2) 
				RH.C0=RH.C0:Lerp(CFrame.new(0.5+0*math.cos(sine/5),-1+0.3*math.cos(sine/5),-1+0*math.cos(sine/5))*CFrame.Angles(math.rad(-60+15*math.cos(sine/5)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10))),.2) 
				LH.C0=LH.C0:Lerp(CFrame.new(-0.5+0*math.cos(sine/5),-1+0.3*math.cos(sine/5),-1+0*math.cos(sine/5))*CFrame.Angles(math.rad(-60+15*math.cos(sine/5)),math.rad(0+0*math.cos(sine/5)),math.rad(0+0*math.cos(sine/5))),.2)
			elseif Root.Velocity.Magnitude > 20 then -- run
				--run clerp here
			end
		end
		srv.RenderStepped:Wait()
	end
end)()
    wait(0.2)
-- NOW FOR BOOBA PART.. LOL
local Character = workspace.DuskySpoon
local S = {
	fattiddie = Character:WaitForChild("Blue Spherekin"),
	fatiddie = Character:WaitForChild("BlueRoundNoobHead")
}

local Torso = Character:WaitForChild("Torso")

local Jiggle_R = Instance.new("Attachment", Torso)
Jiggle_R.Name = "Jiggle_R"
Jiggle_R.Position = Vector3.new(0.7, -1, 1) 
local Collider_R = Instance.new("Part", Torso)
Collider_R.Size = Vector3.new(0.1, 0.1, 0.1)
Collider_R.Transparency = 1
Collider_R.CanCollide = true
Collider_R.Anchored = false
Collider_R.Massless = true
Collider_R.Position = Torso.Position + Jiggle_R.Position
local Weld_R = Instance.new("Weld", Torso)
Weld_R.Part0 = Torso
Weld_R.Part1 = Collider_R
Weld_R.C0 = CFrame.new(Jiggle_R.Position)

local Jiggle_L = Instance.new("Attachment", Torso)
Jiggle_L.Name = "Jiggle_L"
Jiggle_L.Position = Vector3.new(-0.7, -1, 1) 
local Collider_L = Instance.new("Part", Torso)
Collider_L.Size = Vector3.new(0.1, 0.1, 0.1)
Collider_L.Transparency = 1
Collider_L.CanCollide = true
Collider_L.Anchored = false
Collider_L.Massless = true
Collider_L.Position = Torso.Position + Jiggle_L.Position
local Weld_L = Instance.new("Weld", Torso)
Weld_L.Part0 = Torso
Weld_L.Part1 = Collider_L
Weld_L.C0 = CFrame.new(Jiggle_L.Position)

local Jiggle_M = Instance.new("Attachment", Torso)
Jiggle_M.Name = "Jiggle_M"
Jiggle_M.Position = Vector3.new(0, 1.5, 1)

local function boing(handle)
	for _, weld in pairs(handle:GetChildren()) do
		if weld:IsA("Weld") and weld.Name == "AccessoryWeld" then
			weld:Destroy()
		end
	end

	local Jiggle1 = Instance.new("Attachment", handle)
	Jiggle1.Name = "Jiggle1"

	local Jiggle2 = Instance.new("Attachment", handle)
	Jiggle2.Name = "Jiggle2"

	local AP = Instance.new("AlignPosition", handle)
	AP.Attachment0 = Jiggle1
	AP.Attachment1 = Jiggle2
	AP.MaxForce = 100000
	AP.MaxVelocity = 50
	AP.Responsiveness = 200

	local AO = Instance.new("AlignOrientation", handle)
	AO.Attachment0 = Jiggle1
	AO.Attachment1 = Jiggle2
	AO.MaxTorque = 100000
	AO.MaxAngularVelocity = 50
	AO.Responsiveness = 200

	return Jiggle1, Jiggle2
end

local Jig1_R, Jig2_R = boing(S.fattiddie.Handle)
local Jig1_L, Jig2_L = boing(S.fatiddie.Handle)

local Spring_R = Instance.new("SpringConstraint")
Spring_R.Name = "Spring_R"
Spring_R.Parent = Torso
Spring_R.Damping = 150 
Spring_R.FreeLength = 0.1 
Spring_R.Stiffness = 4400
Spring_R.Attachment0 = Jiggle_R
Spring_R.Attachment1 = Jig1_R

local Spring_L = Instance.new("SpringConstraint")
Spring_L.Name = "Spring_L"
Spring_L.Parent = Torso
Spring_L.Damping = 150 
Spring_L.FreeLength = 0.1  
Spring_L.Stiffness = 4400
Spring_L.Attachment0 = Jiggle_L
Spring_L.Attachment1 = Jig1_L

local Spring_R2 = Instance.new("SpringConstraint")
Spring_R2.Name = "Spring_R2"
Spring_R2.Parent = Torso
Spring_R2.Damping = 2.5
Spring_R2.FreeLength = 1.5
Spring_R2.Stiffness = 0
Spring_R2.Attachment0 = Jiggle_M
Spring_R2.Attachment1 = Jig2_R

local Spring_L2 = Instance.new("SpringConstraint")
Spring_L2.Name = "Spring_L2"
Spring_L2.Parent = Torso
Spring_L2.Damping = 2.5
Spring_L2.FreeLength = 1.5
Spring_L2.Stiffness = 0
Spring_L2.Attachment0 = Jiggle_M
Spring_L2.Attachment1 = Jig2_L

