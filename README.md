NOISYAIDAN1022 // March 2023:


How to use:

	Step 1) Place the NotificationService module script in ServerScriptService
	Step 2) Create a script or require the NotificationService from an existant script in the ServerScriptService (Or use the included Test script, make sure to place it in ServerScriptService)
		Step 2b) If you are confused at this step, visit [  https://create.roblox.com/docs/education/coding-6/intro-to-module-scripts  ] to understand module scripts better
	Step 3) From that server script in ServerScriptService, use one of the create commands to create a notification for a player

Information:

The six commands included right now are:
	---> Create Commands
	Create:
		Info:
			- The create command is your go-to command when you need something specific, however it is a little bit harder to use. If you have no or little scripting knowledge, stick to the other create commands.
			- Create should be formatted like this:
			VariableName:Create({Header = "Example", Body = "Example", Player = playervariable})
			- VariableName at the start should be replaced with the name of the variable you used to require the module script, example in the following code:
				local NotificationService = require(script.NotificationService)
				This would only work if NotificationService is a child of the script your requiring it from
		Required Parameters:
			- Header
			- Body
			- Player OR GroupNotification
	CreateServerMessage:
		Info:
			- The CreateServerMessage command creates a message with the prefix "SERVER: " before the header and sends to all players.
		Required Parameters:
			- Header
			- Subheader
			- Body
	CreateMessage:
		Info:
			- The CreateMessage command creates a message.
		Required Parameters:
			- Header
			- Body
			- Player
	CreateWarning:
		Info:
			- The CreateWarning command creates a message with a red colored header.
		Required Parameters:
			- Header
			- Subheader
			- Body
			- Player
	---> Show/Hide commands /// If you are creating notifications from the client side these only work for that client
	doHideWhileDead:
		Hides all notification UI while the player is dead
	doShowWhileDead
		Shows all notification UI while the player is dead <<< THIS COMES PREENABLED, YOU MUST USE doHideWhileDead TO HIDE THE UI WHILE THE PLAYER IS DEAD
		
Parameters Reference (CASE SENSITIVE)
	- Header
		> The header of the notification, takes a string value
	- HeaderColor, default is White
		> The color of the text of the header, takes a RGB value
	- SubHeader
		> The subheader of the notification, takes a string value
	- SubHeaderColor, default is White 
		> The color of the text of the subheader, takes a RGB value
	- Body
		> The body of the notification, takes a string value
	- BodyColor, default is White
		> The color of the text of the body, takes a RGB value
	- Player
		> The player who will recieve the notification, takes a player as the input
	- EasingStyle
		> The Enum easing style for the tween that plays whenever the notification appears, default is Linear
	- EasingDirection
		> The Enum easing direction for the tween that plays whenever the notification appears, default is InOut
	- GroupNotification
		> Defines if the message should be sent to all players  or just one, takes a boolean value and is not required
