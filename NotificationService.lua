-- Services
local TweenService = game:GetService('TweenService')
local ReplicatedStorage = game:GetService('ReplicatedStorage')
local Players = game:GetService('Players')

-- Variables
--local NotificationGui = ReplicatedStorage:WaitForChild('Notifications')
local currentTween

-- Object
local Notifications = {
	Instances = {},
	HideWhileDead = false
}

-- Functions
local function slideDownNotifications(Notification, player)
	local slideDownTweenInfo = TweenInfo.new(.5, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
	local newPos = 0.807 - .192 * (table.find(Notifications[player].Instances, Notification) - 1)
	local slideDownTween = TweenService:Create(Notification, slideDownTweenInfo, {Position = UDim2.new(0.029, 0, newPos, 0)})
	slideDownTween:Play()
end

-- Custom Messages
	
local function CreateNotification(Message)
	
	-- Set up:
	local Frame
	if not Message.Player.PlayerGui:WaitForChild('Notifications', .1) then
		local Notifications = Instance.new("ScreenGui")
		Frame = Instance.new("Frame")
		
		Notifications.Name = "Notifications"
		Notifications.Parent = Message.Player.PlayerGui
		Notifications.ResetOnSpawn = false

		Frame.Parent = Notifications
		Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Frame.BackgroundTransparency = 1.000
		Frame.BorderSizePixel = 0
		Frame.Position = UDim2.new(0.830768883, 0, 0, 0)
		Frame.Size = UDim2.new(0.169231057, 0, 0.999833107, 0)
	else
		Frame = Message.Player.PlayerGui.Notifications.Frame
	end
	
	-- Objects:
	
	local Notification = Instance.new("TextLabel")
	local Header = Instance.new("TextLabel")
	local DropShadow = Instance.new("Frame")
	local DropShadow_2 = Instance.new("Frame")
	local SubHeader = Instance.new("TextLabel")
	local Body = Instance.new("TextLabel")
	local Close = Instance.new("TextButton")

	--Properties:

	Notification.Name = "Notification"
	Notification.Parent = Frame
	Notification.BackgroundColor3 = Color3.fromRGB(48, 48, 48)
	Notification.BorderSizePixel = 0
	Notification.Position = UDim2.new(1.529, 0, (0.807 -  #Notifications[Message.Player.Name].Instances * .192), 0)
	Notification.Size = UDim2.new(.94, 0, .179, 0)
	Notification.ZIndex = 3
	Notification.Font = Enum.Font.SourceSans
	Notification.Text = ""
	Notification.TextColor3 = Color3.fromRGB(255, 255, 255)
	Notification.TextSize = 14.000

	Header.Name = "Header"
	Header.Parent = Notification
	Header.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Header.BackgroundTransparency = 1.000
	Header.BorderColor3 = Color3.fromRGB(29, 29, 29)
	Header.Size = UDim2.new(1, 0, 0.231999993, 0)
	Header.ZIndex = 3
	Header.Font = Enum.Font.SourceSansBold
	Header.Text = Message.Header
	Header.TextColor3 =  Message.HeaderColor or Color3.fromRGB(255, 255, 255)
	Header.TextSize = 20.000

	DropShadow.Name = "DropShadow"
	DropShadow.Parent = Notification
	DropShadow.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
	DropShadow.BorderSizePixel = 0
	DropShadow.Position = UDim2.new(0, 2, 0, 2)
	DropShadow.Size = UDim2.new(1, 0, 1, 0)
	DropShadow.ZIndex = 2

	DropShadow_2.Name = "DropShadow"
	DropShadow_2.Parent = DropShadow
	DropShadow_2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	DropShadow_2.BorderSizePixel = 0
	DropShadow_2.Position = UDim2.new(0, 2, 0, 2)
	DropShadow_2.Size = UDim2.new(1, 0, 1, 0)

	SubHeader.Name = "SubHeader"
	SubHeader.Parent = Notification
	SubHeader.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	SubHeader.BackgroundTransparency = 1.000
	SubHeader.BorderColor3 = Color3.fromRGB(29, 29, 29)
	SubHeader.Position = UDim2.new(0, 0, 0.103999987, 0)
	SubHeader.Size = UDim2.new(1, 0, 0.231999993, 0)
	SubHeader.ZIndex = 3
	SubHeader.Font = Enum.Font.SourceSansBold
	SubHeader.Text = "" or Message.SubHeader
	SubHeader.TextColor3 = Message.SubHeaderColor or Color3.fromRGB(255, 255, 255)
	SubHeader.TextSize = 16.000
	SubHeader.TextTransparency = 0.300

	Body.Name = "Body"
	Body.Parent = Notification
	Body.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Body.BackgroundTransparency = 1.000
	Body.BorderColor3 = Color3.fromRGB(29, 29, 29)
	Body.Position = UDim2.new(0.0307692308, 0, 0.287999988, 0)
	Body.Size = UDim2.new(0.952000022, 0, 0.712000012, 0)
	Body.ZIndex = 3
	Body.Font = Enum.Font.SourceSans
	Body.Text = Message.Body
	Body.TextColor3 = Message.BodyColor or Color3.fromRGB(255, 255, 255)
	Body.TextSize = 14.000
	Body.TextWrapped = true
	Body.TextXAlignment = Enum.TextXAlignment.Left
	Body.TextYAlignment = Enum.TextYAlignment.Top
	
	Close.Name = "Close"
	Close.Parent = Notification
	Close.BackgroundColor3 = Color3.fromRGB(48, 48, 48)
	Close.BorderColor3 = Color3.fromRGB(29, 29, 29)
	Close.Position = UDim2.new(-0.0130000003, 0, -0.0280000009, 0)
	Close.Size = UDim2.new(0.074832201, 0, 0.159469754, 0)
	Close.ZIndex = 3
	Close.Font = Enum.Font.SourceSansBold
	Close.Text = "X"
	Close.TextColor3 = Color3.fromRGB(255, 255, 255)
	Close.TextSize = 22.000
	Close.TextWrapped = true
	
	-- Add to instances
	
	table.insert(Notifications[Message.Player.Name].Instances, Notification)
	
	-- Tween
	
	local EasingStyle = Message.EasingStyle or Enum.EasingStyle.Linear
	local EasingDirection = Message.EasingDirection or Enum.EasingDirection.In
	local tInfo = TweenInfo.new(1, EasingStyle, EasingDirection)
	local slideInTween = TweenService:Create(Notification, tInfo, {Position = UDim2.new(0.029, 0, 0.807 - ((#Notifications[Message.Player.Name].Instances - 1) * .192), 0 )})
	slideInTween:Play()
	
	-- Close
	local player = Message.Player.Name
	
	Close.MouseButton1Click:Connect(function()
		local notificationIndex = table.find(Notifications[player].Instances, Notification) -- currently not working sometimes?
		Notification:Destroy()
		table.remove(Notifications[player].Instances, notificationIndex)
		for index = notificationIndex, #Notifications[player].Instances do
			slideDownNotifications(Notifications[player].Instances[index], player) 
		end
	end)
	
end

function Notifications:Create(Message)

	-- Pre-Assignments / Functions:
	if Message.GroupNotification then
		for _, player in pairs(game.Players:GetChildren()) do
			if not Notifications[player.Name] then
				Notifications[player.Name] = {['Instances'] = {}}
			end
			Message.Player = player
			CreateNotification(Message)
		end	
	elseif Message.Player then
		if not Notifications[Message.Player.Name] then
			Notifications[Message.Player.Name] = {['Instances'] = {}}
		end
		CreateNotification(Message)
	elseif not Message.Player and not Message.GroupNotification then
		warn("Couldn't create a notification: No player defined. Did you include a player or group in your command?")
	end

end

-- Presets

function Notifications:CreateServerMessage(Header, SubHeader, Body)
	Notifications:Create({
		Header = 'SERVER: '.. Header, 
		SubHeader = SubHeader,
		Body = Body,
		GroupNotification = true,
	})
end

function Notifications:CreateWarning(Header, SubHeader, Body, Player)
	Notifications:Create({
		Header = Header, 
		SubHeader = SubHeader,
		Body = Body,
		Player = Player,
		HeaderColor  = Color3.fromRGB(170, 0, 0)
	})
end

function Notifications:CreateMessage(Header, Body, Player)
	Notifications:Create({
		Header = Header, 
		Body = Body,
		Player = Player,
	})
end

function Notifications:doHideWhileDead()
	Notifications.HideWhileDead = true
	for _, player in pairs(Players:GetChildren()) do -- set each current player's notifications to be invisible when the player is dead
		task.spawn(function()
			local PlayerNotifications = player.PlayerGui:WaitForChild('Notifications')
			local character = player.Character or player.CharacterAdded:Wait()
			local humanoid = character:WaitForChild("Humanoid")
			-- whenever the character dies for the first time, do this
			humanoid.Died:Connect(function()
				if Notifications.HideWhileDead == true then
					PlayerNotifications.Enabled = false
				end
			end)
			-- the function needs to be reconnected to by doing so whenever the character is added whenever the player dies since the character is destroyed
			player.CharacterAdded:Connect(function()
				PlayerNotifications.Enabled = true
				humanoid.Died:Connect(function()
					if Notifications.HideWhileDead == true then -- final check
						PlayerNotifications.Enabled = false
					end
				end)
			end)
		end)
	end
	
	game.Players.PlayerAdded:Connect(function(player) -- set each future player's notifications to be invisible when the player is dead
		task.spawn(function()
			local PlayerNotifications = player.PlayerGui:WaitForChild('Notifications')
			local character = player.Character or player.CharacterAdded:Wait()
			local humanoid = character:WaitForChild("Humanoid")
			-- whenever the character dies for the first time, do this
			humanoid.Died:Connect(function()
				if Notifications.HideWhileDead == true then
					PlayerNotifications.Enabled = false
				end
			end)
			-- the function needs to be reconnected to by doing so whenever the character is added whenever the player dies since the character is destroyed
			player.CharacterAdded:Connect(function()
				PlayerNotifications.Enabled = true
				humanoid.Died:Connect(function()
					if Notifications.HideWhileDead == true then -- final check
						PlayerNotifications.Enabled = false
					end
				end)
			end)

		end)
	end)
end

function Notifications:doShowWhileDead()
	Notifications.HideWhileDead = false
end

return Notifications
