local PLUGIN = PLUGIN
PLUGIN.name = "Extra Chat Commands"
PLUGIN.author = "Chancer"
PLUGIN.desc = "Screaming, long ranged /me, long ranged /it, etc."

--regular chat replacement
ix.chat.Register("ic", {
	format = "%s says \"%s\"",
	GetColor = function(speaker, text)
		-- If you are looking at the speaker, make it greener to easier identify who is talking.
		if (LocalPlayer():GetEyeTrace().Entity == speaker) then
			return ix.config.Get("chatListenColor")
		end

		-- Otherwise, use the normal chat color.
		return ix.config.Get("chatColor")
	end,
	CanHear = ix.config.Get("chatRange", 280),
	OnChatAdd = function( _, speaker, text)
		local suffix = string.sub(text, text:len())
		local teamColor = team.GetColor(speaker:GetChar():GetFaction())
		local speako = hook.Run("GetCharacterName", speaker, "ic") or (IsValid(speaker) and speaker:Name() or "Console")
		local pSay = string.upper(string.sub(text, 0, 1))..string.sub(text, 2)
		local pSayC = string.upper(string.sub(text, 0, 1))..string.sub(text, 2)-- fuck your period bullshit
		local nameCol = ix.config.Get("chatColor")
		nameCol = Color(nameCol.r + 50, nameCol.g + 50, nameCol.b + 50)
		if suffix == "?" then
			chat.AddText(nameCol, speako, ix.config.Get("chatColor"), " asks \""..pSay.."\"")
		elseif suffix == "!" then
			chat.AddText(nameCol, speako, ix.config.Get("chatColor"), " exclaims \""..pSay.."\"")
		elseif suffix == "." then
			chat.AddText(nameCol, speako, ix.config.Get("chatColor"), " says \""..pSay.."\"")
		else
			chat.AddText(ix.config.Get("chatColor"), speako, ix.config.Get("chatColor"), " says \""..pSayC.."\"")
		end
	end
})

-- scream out loud.
ix.chat.Register("s", {
	format = "%s screams \"%s\"",
	GetColor = function(speaker, text)
		return Color(200, 20, 20)
	end,
CanHear = ix.config.Get("chatRange", 280) * 4,
prefix = {"/s", "/scream"}
})
		
-- me close.
ix.chat.Register("meclose", {
	format = "**%s %s",
	GetColor = function(speaker, text)
		local color = ix.chat.classes.ic.GetColor(speaker, text)

		return Color(color.r - 35, color.g - 35, color.b - 35)
	end,
	CanHear = ix.config.Get("chatRange", 280) * 0.25,
	prefix = {"/meclose", "/actionw", "/mew"},
	font = "ixChatFontItalics",
	filter = "actions",
	deadCanChat = true
})
		
-- me far.
ix.chat.Register("mefar", {
	format = "**%s %s",
	GetColor = function(speaker, text)
		local color = ix.chat.classes.ic.GetColor(speaker, text)

		return Color(color.r + 35, color.g + 35, color.b + 35)
	end,
	CanHear = ix.config.Get("chatRange", 280) * 2,
	prefix = {"/mefar", "/actiony", "/mey"},
	font = "ixChatFontItalics",
	filter = "actions",
	deadCanChat = true
})

-- me far far.
ix.chat.Register("mefarfar", {
	format = "**%s %s",
	GetColor = function(speaker, text)
		local color = ix.chat.classes.ic.GetColor(speaker, text)

		return Color(color.r + 45, color.g + 45, color.b + 45)
	end,
	CanHear = ix.config.Get("chatRange", 280) * 4,
	prefix = {"/mefarfar", "/actionyy", "/meyy"},
	font = "ixChatFontItalics",
	filter = "actions",
	deadCanChat = true
})

-- it close.
ix.chat.Register("itclose", {
	OnChatAdd = function( _, speaker, text)
		local color = ix.chat.classes.ic.GetColor(speaker, text)
		chat.AddText(Color(color.r - 35, color.g - 35, color.b - 35), "**"..text)
	end,
	CanHear = ix.config.Get("chatRange", 280) * 0.25,
	prefix = {"/itclose", "itw"},
	font = "ixChatFontItalics",
	filter = "actions",
	deadCanChat = true
})

-- it far.
ix.chat.Register("itfar", {
	OnChatAdd = function( _, speaker, text)
		local color = ix.chat.classes.ic.GetColor(speaker, text)
		chat.AddText(Color(color.r + 35, color.g + 35, color.b + 35), "**"..text)
	end,
	CanHear = ix.config.Get("chatRange", 280) * 2,
	prefix = {"/itfar", "ity"},
	font = "ixChatFontItalics",
	filter = "actions",
	deadCanChat = true
})
		
-- it far far.
ix.chat.Register("itfarfar", {
	OnChatAdd = function( _, speaker, text)
		local color = ix.chat.classes.ic.GetColor(speaker, text)
		print(text)
		chat.AddText(Color(color.r + 45, color.g + 45, color.b + 45), "**"..text)
	end,
	CanHear = ix.config.Get("chatRange", 280) * 4,
	prefix = {"/itfarfar", "ityy"},
	font = "ixChatFontItalics",
	filter = "actions",
	deadCanChat = true
})

-- Private messages between players.
ix.chat.Register("pm", {
	format = "[PM] %s: %s",
	color = Color(249, 211, 89),
	filter = "pm",
	deadCanChat = true
})

-- Set name without notifying server
ix.command.Add("CharSetNameSilent", {
	description = "Set a character name without notifying other players.",
	adminOnly = true,
	arguments = {
		ix.type.character,
		bit.bor(ix.type.text, ix.type.optional)
	},
	OnRun = function(self, client, target, newName)
		-- display string request panel if no name was specified
		if (newName:len() == 0) then
			return client:RequestString("@chgName", "@chgNameDesc", function(text)
				ix.command.Run(client, "CharSetName", {target:GetName(), text})
			end, target:GetName())
		end
		target:SetName(newName:gsub("#", "#​"))
	end
})

ix.command.Add("PlyTransferSilent", {
	description = "Set a character's faction without notifying other players.",
	adminOnly = true,
	arguments = {
		ix.type.character,
		ix.type.text
	},
	OnRun = function(self, client, target, name)
		local faction = ix.faction.teams[name]

		if (!faction) then
			for _, v in pairs(ix.faction.indices) do
				if (ix.util.StringMatches(L(v.name, client), name)) then
					faction = v

					break
				end
			end
		end

		if (faction) then
			local bHasWhitelist = target:GetPlayer():HasWhitelist(faction.index)
			if (bHasWhitelist) then
				target.vars.faction = faction.uniqueID
				target:SetFaction(faction.index)

				if (faction.OnTransferred) then
					faction:OnTransferred(target)
				end
			else
				return "@charNotWhitelisted", target:GetName(), L(faction.name, client)
			end
		else
			return "@invalidFaction"
		end
	end
})