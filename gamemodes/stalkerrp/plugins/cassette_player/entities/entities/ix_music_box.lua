AddCSLuaFile()

ENT.Type = "anim"
ENT.PrintName = "Music Box"
ENT.Category = "Helix"
ENT.Spawnable = true
ENT.AdminOnly = true

if SERVER then
	function ENT:Initialize()
		self:SetModel("models/mosi/fallout4/props/junk/bobbypinbox.mdl")
		self:SetSolid(SOLID_VPHYSICS)
		self:PhysicsInit(SOLID_VPHYSICS)
		self:SetUseType(SIMPLE_USE)
		self:SetAngles(self:GetAngles() - Angle(0, 0, 0))
		self:DropToFloor()

		if IsValid(self:GetPhysicsObject()) then
			self:GetPhysicsObject():EnableMotion(false)
		end
	end

	function ENT:Use(activator, caller)
		if self.sound then
			self.sound:Stop()
			self:EmitSound("physics/metal/chain_impact_soft2.wav", 40)
		end
		self:SetData("IsPlaying", false)
	end

	function ENT:OnRemove()
		if self.sound then
			self.sound:Stop()
		end
	end
else
	ENT.PopulateEntityInfo = true

	function ENT:OnPopulateEntityInfo(container)
		local name = container:AddRow("name")
		name:SetImportant()
		name:SetText("Music Box")
		name:SizeToContents()

		local descriptionText = self:GetNetVar("Description", "A music box that plays a collection of songs.")
		if descriptionText then
			local description = container:AddRow("Description")
			description:SetText(descriptionText)
			description:SizeToContents()
		end
	end
end
