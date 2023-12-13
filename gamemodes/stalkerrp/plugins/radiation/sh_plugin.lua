local PLUGIN = PLUGIN
PLUGIN.name = "Radiation"
PLUGIN.author = "Modified by Scrat"
PLUGIN.desc = "Radiation System"

ix.util.Include("cl_plugin.lua")

local playerMeta = FindMetaTable("Player")
local entityMeta = FindMetaTable("Entity")

ix.char.RegisterVar("Rads", {
    field = "rads",
    fieldType = ix.type.number,
    default = 0,
    isLocal = true,
    bNoDisplay = true
})

ix.char.RegisterVar("RadImmune", {
    field = "radimmune",
    fieldType = ix.type.boolean,
    default = false,
    isLocal = true,
    bNoDisplay = true
})

function playerMeta:GetRads()
	return self:GetCharacter():GetRads()
end

function playerMeta:GetRadsPercent()
	return math.Clamp(self:GetCharacter():GetRads()/100, 0 ,1)
end

function playerMeta:addRadiation(amount)
	local curRadiation = self:GetCharacter():GetRads()
	self:setRadiation(math.Clamp(math.min(curRadiation) + amount, 0, 1000))
end


function playerMeta:radDebuffHandler(debuff)
	char = self:GetCharacter()
	-- Handle all buffs/debuffs here and call in each rad level check further down.
	if debuff == "NONE" then
		char:RemoveBoost("minorrad", "fortitude")
		char:RemoveBoost("minorrad", "reflex")
		char:RemoveBoost("minorrad", "strength")

		char:RemoveBoost("advancedrad", "fortitude")
		char:RemoveBoost("advancedrad", "reflex")
		char:RemoveBoost("advancedrad", "strength")

		char:RemoveBoost("criticalrad", "fortitude")
		char:RemoveBoost("criticalrad", "reflex")
		char:RemoveBoost("criticalrad", "strength")

		char:RemoveBoost("deadlyrad", "fortitude")
		char:RemoveBoost("deadlyrad", "reflex")
		char:RemoveBoost("deadlyrad", "strength")
		char:RemoveBoost("deadlyrad", "observation")
	end

	if debuff == "MINOR" then
		char:AddBoost("minorrad", "fortitude", -10)
		char:AddBoost("minorrad", "reflex", -10)
		char:AddBoost("minorrad", "strength", -10)

		char:RemoveBoost("advancedrad", "fortitude")
		char:RemoveBoost("advancedrad", "reflex")
		char:RemoveBoost("advancedrad", "strength")

		char:RemoveBoost("criticalrad", "fortitude")
		char:RemoveBoost("criticalrad", "reflex")
		char:RemoveBoost("criticalrad", "strength")

		char:RemoveBoost("deadlyrad", "fortitude")
		char:RemoveBoost("deadlyrad", "reflex")
		char:RemoveBoost("deadlyrad", "strength")
		char:RemoveBoost("deadlyrad", "observation")
	end

	if debuff == "ADVANCED" then
		char:RemoveBoost("minorrad", "fortitude")
		char:RemoveBoost("minorrad", "reflex")
		char:RemoveBoost("minorrad", "strength")

		char:AddBoost("advancedrad", "fortitude", -20)
		char:AddBoost("advancedrad", "reflex", -20)
		char:AddBoost("advancedrad", "strength", -20)

		char:RemoveBoost("criticalrad", "fortitude")
		char:RemoveBoost("criticalrad", "reflex")
		char:RemoveBoost("criticalrad", "strength")
		
		char:RemoveBoost("deadlyrad", "fortitude")
		char:RemoveBoost("deadlyrad", "reflex")
		char:RemoveBoost("deadlyrad", "strength")
		char:RemoveBoost("deadlyrad", "observation")
	end

	if debuff == "CRITICAL" then
		char:RemoveBoost("minorrad", "fortitude")
		char:RemoveBoost("minorrad", "reflex")
		char:RemoveBoost("minorrad", "strength")

		char:RemoveBoost("advancedrad", "fortitude")
		char:RemoveBoost("advancedrad", "reflex")
		char:RemoveBoost("advancedrad", "strength")

		char:AddBoost("criticalrad", "fortitude", -40)
		char:AddBoost("criticalrad", "reflex", -40)
		char:AddBoost("criticalrad", "strength", -40)

		char:RemoveBoost("deadlyrad", "fortitude")
		char:RemoveBoost("deadlyrad", "reflex")
		char:RemoveBoost("deadlyrad", "strength")
		char:RemoveBoost("deadlyrad", "observation")
	end

	if debuff == "DEADLY" then
		char:RemoveBoost("minorrad", "fortitude")

		char:RemoveBoost("advancedrad", "fortitude")
		char:RemoveBoost("advancedrad", "reflex")

		char:RemoveBoost("criticalrad", "fortitude")
		char:RemoveBoost("criticalrad", "reflex")
		char:RemoveBoost("criticalrad", "strength")

		char:AddBoost("deadlyrad", "fortitude", -40)
		char:AddBoost("deadlyrad", "reflex", -40)
		char:AddBoost("deadlyrad", "strength", -40)
		char:AddBoost("deadlyrad", "observation", -40)
	end


end

function playerMeta:setRadiation(amount)
	local char = self:GetCharacter()


	if char:GetRadImmune() == true then
		amount = 0
	end

	char:SetRads((math.Clamp(amount, 0, 1000)))

		-- Less than 200 rads, no effects, make sure to remove all debuffs related to rad posioning.
	if char:GetRads() < 200 then
		self:radDebuffHandler("NONE")
		

		-- 200-399 Rads: Minor Rad Poisoning, -1 END
	elseif char:GetRads() > 199 and char:GetRads() < 400 then
		self:radDebuffHandler("MINOR")
		char:GetPlayer():Notify("You are sick with Minor Radiation Poisoning.")

		-- 400-599 Rads: Advanced Rad Poisoning, -2 END, -1 AGI
	elseif char:GetRads() > 399 and char:GetRads() < 600 then
		self:radDebuffHandler("ADVANCED")
		char:GetPlayer():Notify("You are sick with Advanced Radiation Poisoning.")

		-- 600-799 Rads: Critical Rad Poisoning, -3 END, -2 AGI, -1 STR
	elseif char:GetRads() > 599 and char:GetRads() < 800 then
		self:radDebuffHandler("CRITICAL")
		char:GetPlayer():Notify("You are sick with Critical Radiation Poisoning.")

		-- 800+ Rads: Deadly Rad Poisoning -3 END, -2 AGI, -2 STR
	elseif char:GetRads() >= 800 then
		self:radDebuffHandler("DEADLY")
		char:GetPlayer():Notify("You are sick with Deadly Radiation Poisoning.")
	end

end

function playerMeta:hasGeiger()
	local char = self:GetChar()
	local geigercounter = self:GetNetVar("ixhasgeiger")

	if !geigercounter then
		return false
	else
		return true
	end
end

function PLUGIN:PostPlayerLoadout(client)
	if client:GetData("ixhasgeiger", false) then
		client:SetNetVar("ixhasgeiger", true)
	end
end





-- Register HUD Bars.
if (CLIENT) then
	local char = LocalPlayer():GetCharacter()
	local color = Color(39, 174, 96)
	function PLUGIN:RenderScreenspaceEffects()
			-- Advanced Poisoning.
		if char:GetRads() > 399 and char:GetRads() < 600 then
			DrawMotionBlur(0.05, 0.25, 0.001)

			-- Critical Poisoning.
		elseif char:GetRads() > 599 and char:GetRads() < 800 then
			DrawMotionBlur(0.05, 0.25, 0.001)

			-- Deadly Poisoning.
		elseif char:GetRads() >= 800 then
			DrawMotionBlur(0.1, 0.35, 0.001)
		end
    end
else
	local PLUGIN = PLUGIN
	
	function PLUGIN:CharacterPreSave(character)
		local savedRads = math.Clamp(character.player:GetRads(), 0, 1000)
		character:SetData("radiation", savedRads)
	end

	function PLUGIN:PostPlayerLoadout(client)
		if (client:GetCharacter():GetRads()) then
			client:GetCharacter():SetRads(client:GetRads())
		else
			client:SetRads(0)
		end
	end

	function PLUGIN:PlayerDeath(client)
		client.resetRads = false
	end

	function PLUGIN:PlayerSpawn(client)
		if (client.resetRads) then
			client:SetRads(0)
			client.resetRads = false
		end
	end
end

ix.command.Add("CharSetRadiation", {
	description = "Set target rads to given number.",
	adminOnly = true,
	arguments = {
		ix.type.character,
		ix.type.number,
	},
	OnRun = function(self, client, target, radiation)
		local radiation = tonumber(radiation)

		if target:GetRadImmune() == true then
			return client:Notify(target:GetName() .. " is set to be immune to radiation.")
		end

		target:GetPlayer():setRadiation(radiation)

		if client == target:GetPlayer() then
            client:Notify("You have set your radiation to "..radiation)
        else
            client:Notify("You have set "..target:GetName().."'s radiation to "..radiation)
            target:Notify(client:Name().." has set your radiation to "..radiation)
        end
	end
})

ix.command.Add("CharAddRadiation", {
	description = "Add rads to a player.",
	adminOnly = true,
	arguments = {
		ix.type.character,
		ix.type.number,
	},
	OnRun = function(self, client, target, radiation)
		local radiation = tonumber(radiation)

		if target:GetRadImmune() == true then
			return client:Notify(target:GetName() .. " is set to be immune to radiation.")
		end

		target:GetPlayer():addRadiation(radiation)

		if client == target:GetPlayer() then
            client:Notify("You have added "..radiation.. " Rads to yourself. You now have " .. target:GetRads() .. " Rads.")
        else
            client:Notify("You have added "..radiation.. " to " .. target:GetName() .. ". They now have " .. target:GetRads() .. " Rads.")
        end
	end
})

ix.command.Add("CharSetRadImmune", {
	description = "Set a character as fully immune to radiation.",
	adminOnly = true,
	arguments = {
		ix.type.character,
		ix.type.bool,
	},
	OnRun = function(self, client, target, radimmune)
		
		target:SetRadImmune(radimmune)
		
		if (target:GetRadImmune() == true) then
			target:SetRads(0)
			return client:Notify(target:GetName() .. "has been set to be immune to radiation.")
		end

		if (target:GetRadImmune() == false) then
			return client:Notify(target:GetName() .. "has been set to be vulnerable to radiation.")
		end
	end
})


ix.command.Add("CharCheckRadiation", {
	description = "Get character's current rad level.",
	adminOnly = true,
	arguments = {
		ix.type.character,
	},
	OnRun = function(self, client, target)
		return target:GetName() .. " has " .. target:GetRads() .. " rads."

	end
})