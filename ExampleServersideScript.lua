local ReplicatedStorage = game:GetService('ReplicatedStorage')
local NotificationService = require(ReplicatedStorage.NotificationService)

game.Players.PlayerAdded:Connect(function(player)
	NotificationService:doHideWhileDead()
	NotificationService:CreateServerMessage("Test",
		"Test", 
		"This is a test")
	wait(1)
	NotificationService:CreateMessage("Test Message", 
		"Test Message Body", 
		player)
	wait(1)
	NotificationService:CreateWarning("Test Warning", 
		"", 
		"Test Warning Body", 
		player)
	wait(1)
	NotificationService:Create({
		Header = "Test CreateMessage", 
		Body = "Test CreateMessageBody", 
		Player = player})
end)
