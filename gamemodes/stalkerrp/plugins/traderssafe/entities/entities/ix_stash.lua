ENT.Type = "anim"
ENT.PrintName = "Safe (Traders have an item for this)"
ENT.Author = "Black Tea"
ENT.Spawnable = true
ENT.AdminOnly = false
ENT.Category = "Helix"
ENT.RenderGroup 		= RENDERGROUP_BOTH

if (SERVER) then
	function ENT:Initialize()
		self:SetModel("models/hgn/srp/items/backpack-1.mdl")
		self:PhysicsInit(SOLID_VPHYSICS)
		self:SetMoveType(MOVETYPE_VPHYSICS)
		self:SetUseType(SIMPLE_USE)
		local physicsObject = self:GetPhysicsObject()

		if (IsValid(physicsObject)) then
			physicsObject:Wake()
		end
	end

	function ENT:OnRemove()
	end

	function ENT:Use(activator)
		requestStash(activator)
	end
else
	function ENT:Draw()
		self:DrawModel()
	end
	
	function ENT:onShouldDrawEntityInfo()
		return true
	end
	if (CLIENT) then
		function ENT:OnPopulateEntityInfo(tooltip)
			surface.SetFont("ixIconsSmall")
		
			local title = tooltip:AddRow("name")
			title:SetImportant()
			title:SetText("Personal Stash")
			title:SetBackgroundColor(ix.config.Get("color"))
			title:SizeToContents()    
		end
	end
end