local PLUGIN = PLUGIN
PLUGIN.name = "Reputation"
PLUGIN.author = "Verne?"
PLUGIN.desc = "Reputation System"

ix.char.RegisterVar("SkillPoints", {
    field = "skillpoints",
    fieldType = ix.type.number,
    default = 0,
    isLocal = true,
    bNoDisplay = true
})


PLUGIN.repDefs = {
	{"Tourist", 0},
	{"Rookie 1", 1000},
	{"Rookie 2", 2000},
	{"Rookie 3", 3000},
	{"Experienced 1", 6000},
    {"Experienced 2", 8500},
	{"Experienced 3", 10000},
	{"Professional 1", 20000},
    {"Professional 2", 25000},
	{"Professional 3", 30000},
	{"Veteran 1", 45000},
    {"Veteran 2", 60000},
	{"Veteran 3", 80000},
	{"Expert 1", 100000},
	{"Expert 2", 125000},
    {"Expert 3", 175000},
	{"Master", 300000},
}

local playerMeta = FindMetaTable("Player")
local entityMeta = FindMetaTable("Entity")

function playerMeta:getReputation()
	return (self:GetNetVar("reputation")) or 0
end

function playerMeta:getRepName()
	return (self:GetNetVar("repOverride")) or 0
end

function playerMeta:addReputation(amount)
	self:SetNetVar("reputation", self:getReputation() + amount)
end

function playerMeta:setReputation(amount)
	self:SetNetVar("reputation", amount)
end

function playerMeta:getCurrentRankName()
	local rep = self:GetNetVar("reputation") or 0

	if self:getRepName() != 0 then
		return self:getRepName()
	end
	
	for i = 1, #PLUGIN.repDefs do
		if PLUGIN.repDefs[i][2] > rep then
			return PLUGIN.repDefs[i-1][1]
		end
	end

	return PLUGIN.repDefs[#PLUGIN.repDefs][1]
end

function playerMeta:getArbitraryRankName(rep)
	for i = 1, #PLUGIN.repDefs do
		if PLUGIN.repDefs[i][2] > rep then
			return PLUGIN.repDefs[i-1][1]
		end
	end

	return PLUGIN.repDefs[#PLUGIN.repDefs][1]
end

function PLUGIN:PopulateCharacterInfo(client, character, container)
	local repnametext = container:AddRow("reputation")
	repnametext:SetText(client:getCurrentRankName())
	repnametext:SetTextColor(Color(138, 43, 226))
	repnametext:SizeToContents()
end

-- Register HUD Bars.
if (SERVER) then
	local PLUGIN = PLUGIN
	
	function PLUGIN:CharacterPreSave(character)
		character:SetData("reputation", character.player:getReputation())
		character:SetData("repOverride", character.player:getRepName())
	end

	function PLUGIN:PlayerLoadedCharacter(client, character, lastChar)	
		if (character:GetData("reputation")) then
			client:SetNetVar("reputation", character:GetData("reputation"))
		else
			client:SetNetVar("reputation", 0)
		end

		if (character:GetData("repOverride")) then
			client:SetNetVar("repOverride", character:GetData("repOverride"))
		else
			client:SetNetVar("repOverride", 0)
		end
	end
end

ix.command.Add("charsetreputation", {
	adminOnly = true,
	arguments = {
		ix.type.string,
		ix.type.number
	},
	OnRun = function(self, client, target, reputation)
		local target = ix.util.FindPlayer(target)
		local reputation = tonumber(reputation)

		target:setReputation(reputation)

		if client == target then
            client:Notify("You have set your reputation to "..reputation)
        else
            client:Notify("You have set "..target:Name().."'s reputation to "..reputation)
            target:Notify(client:Name().." has set your reputation to "..reputation)
        end
	end
})

ix.command.Add("charaddreputation", {
	adminOnly = true,
	arguments = {
		ix.type.string,
		ix.type.number
	},
	OnRun = function(self, client, target, reputation)
		local target = ix.util.FindPlayer(target)
		local initiallevel = 0
		local newlevel = 0
		local reputation = tonumber(reputation)
		

		local oldrank = target:getCurrentRankName()
		target:addReputation(reputation)
		local newrank = target:getCurrentRankName()

		
		if client == target then
            client:Notify("You have added "..reputation.." to your reputation.")
        else
            client:Notify("You have added "..reputation.." to "..target:Name().."'s reputation.")
            target:Notify(client:Name().." has added "..reputation.." to your reputation.")
        end


		if newrank != oldrank then 
			target:Notify("You've reached the rank of " .. newrank .. " and gained 5 skillpoints!")
			target:GetCharacter():SetSkillPoints(target:GetCharacter():GetSkillPoints() + 5)

		end 
	end
})

ix.command.Add("charcheckreputation", {
	adminOnly = true,
	arguments = {
		ix.type.string,
	},
	OnRun = function(self, client, target)
		local target = ix.util.FindPlayer(target)

		if target then 
        	client:Notify(target:Name() .. " has "..target:getReputation().." reputation.")
    	else
            client:Notify("Player not found")
        end
	end
})

ix.command.Add("charrepnameset", {
	adminOnly = true,
	arguments = {
		ix.type.string,
		ix.type.string
	},
	OnRun = function(self, client, target, name)
		local target = ix.util.FindPlayer(target)
		local reputation = name

		target:SetNetVar("repOverride", reputation)

		if client == target then
            client:Notify("Custom rankname set.")
        else
            client:Notify("Custom rankname set.")
            target:Notify(client:Name().." has set your repname.")
        end
	end
})

ix.command.Add("charrepnameremove", {
	adminOnly = true,
	arguments = {
		ix.type.string,
	},
	OnRun = function(self, client, target)
		local target = ix.util.FindPlayer(target)

		target:SetNetVar("repOverride", 0)

		if client == target then
            client:Notify("Custom rankname removed.")
        else
            client:Notify("Custom rankname removed.")
            target:Notify(client:Name().." has removed your repname.")
        end
	end
}) 


ix.command.Add("CharAddSkillpoints", {
    description = "Add skill points to a character.",
    adminOnly = true,
    arguments = {
    ix.type.character, 
    ix.type.number},
    OnRun = function(self, client, target, points)
        local currentpoints = target:GetSkillPoints()
        target:SetSkillPoints(currentpoints + points)
        client:Notify(target:GetName() .. " now has " .. tostring(currentpoints + points .. " skill points."))
    end
})

ix.command.Add("SpendSkillpoints", {
    description = "Spend some of your skill points on your attributes.",
    arguments = {
    ix.type.string, 
    ix.type.number},
    OnRun = function(self, client, skill, pointstospend)
        char = client:GetCharacter()
        currentpoints = char:GetSkillPoints()
        skill = string.upper(skill)

        if (currentpoints == 0) then
            client:Notify("You don't have any skillpoints to spend.")
            return
        end 

        if (pointstospend < 0) then
            client:Notify("Cannot spend a negative number of points.")
            return
        end 

        if (currentpoints < pointstospend) then
            client:Notify("You don't have enough skillpoints to upgrade your skill to that level.")
            return
        end 

        if (skill == "STRENGTH") then
            currentlevel = char:GetAttribute("strength")
            if (currentlevel >= 50) then
                client:Notify("That attribute is already at max level!")
                return
            end 
            if (currentlevel + pointstospend > 50) then
                client:Notify("You cannot raise an attribute above 50.")
                return
            end 
            char:UpdateAttrib("strength", pointstospend)
            char:SetSkillPoints(currentpoints - pointstospend)
            client:Notify("Successfully upgraded Strength from " .. currentlevel .. " to " .. char:GetAttribute("strength") .. ".\n Skillpoints remaining: " .. char:GetSkillPoints())
            return
        end 

        if (skill == "FORTITUDE") then
            currentlevel = char:GetAttribute("fortitude")
            if (currentlevel >= 50) then
                client:Notify("That attribute is already at max level!")
                return
            end 
            if (currentlevel + pointstospend > 50) then
                client:Notify("You cannot raise an attribute above 50.")
                return
            end 
            char:UpdateAttrib("fortitude", pointstospend)
            char:SetSkillPoints(currentpoints - pointstospend)
            client:Notify("Successfully upgraded Fortitude from " .. currentlevel .. " to " .. char:GetAttribute("fortitude") .. ".\n Skillpoints remaining: " .. char:GetSkillPoints())
            return
        end 

        if (skill == "FORTUNE") then
            currentlevel = char:GetAttribute("fortune")
            if (currentlevel >= 50) then
                client:Notify("That attribute is already at max level!")
                return
            end 
            if (currentlevel + pointstospend > 50) then
                client:Notify("You cannot raise an attribute above 50.")
                return
            end 
            char:UpdateAttrib("fortune", pointstospend)
            char:SetSkillPoints(currentpoints - pointstospend)
            client:Notify("Successfully upgraded Fortune from " .. currentlevel .. " to " .. char:GetAttribute("fortune") .. ".\n Skillpoints remaining: " .. char:GetSkillPoints())
            return
        end 

        if (skill == "REFLEX") then
            currentlevel = char:GetAttribute("reflex")
            if (currentlevel >= 50) then
                client:Notify("That attribute is already at max level!")
                return
            end 
            if (currentlevel + pointstospend > 50) then
                client:Notify("You cannot raise an attribute above 50.")
                return
            end 
            char:UpdateAttrib("reflex", pointstospend)
            char:SetSkillPoints(currentpoints - pointstospend)
            client:Notify("Successfully upgraded Reflex from " .. currentlevel .. " to " .. char:GetAttribute("reflex") .. ".\n Skillpoints remaining: " .. char:GetSkillPoints())
            return
        end 


        if (skill == "OBSERVATION") then
            currentlevel = char:GetAttribute("observation")
            if (currentlevel >= 50) then
                client:Notify("That attribute is already at max level!")
                return
            end 
            if (currentlevel + pointstospend > 50) then
                client:Notify("You cannot raise an attribute above 50.")
                return
            end 
            char:UpdateAttrib("observation", pointstospend)
            char:SetSkillPoints(currentpoints - pointstospend)
            client:Notify("Successfully upgraded Observation from " .. currentlevel .. " to " .. char:GetAttribute("observation") .. ".\n Skillpoints remaining: " .. char:GetSkillPoints())
            return
        end 

        client:Notify("That attribute doesn't exist! Valid Options: Strength, Reflex, Observation, Fortune, Fortitude")
        return

    end
})

ix.command.Add("MyProgress", {
	description = "View your current level, skill points, and progress.",
	OnRun = function(self, client)
		local str = ""
        local char = client:GetCharacter()
        local rep = client:getReputation()

	
	
        
        str = str .. "Rank: " .. client:getCurrentRankName() .. "\n"
        str = str .. "Total Reputation: " .. client:getReputation()  .. "\n"
        str = str .. "Skillpoints: " ..char:GetSkillPoints() .. " \n"
        return str
	end
})

