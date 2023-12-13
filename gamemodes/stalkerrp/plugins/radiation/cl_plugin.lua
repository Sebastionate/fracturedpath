local rad = Material("daui/rad_icon_v6.png") 

function PLUGIN:HUDPaint()
	local lp = LocalPlayer()
	local char = lp:GetCharacter()
	if (!lp:GetCharacter() or !lp:Alive() or ix.gui.characterMenu:IsVisible()) then return end
	local rad = Material("vgui/hud/rad.png", "noclamp smooth") 
	local rad2 = Material("vgui/hud/rad2.png", "noclamp smooth") 
	local rad3 = Material("vgui/hud/rad3.png", "noclamp smooth") 
	local rad4 = Material("vgui/hud/rad4.png", "noclamp smooth")
	surface.SetMaterial(rad)

		-- Anything below 200 rads will not show up on HUD or any effects.
	if char:GetRads() < 199  then
		surface.SetMaterial(rad)
		surface.SetDrawColor(Color(0, 0, 0, 0))

		-- 200-399 Rads: Minor Rad Poisoning
	elseif char:GetRads() > 199 and char:GetRads() < 400 then
		surface.SetMaterial(rad)
		surface.SetDrawColor(Color(255, 255, 255, 255))

		-- 400-599 Rads: Advanced Rad Poisoning
	elseif char:GetRads() > 399 and char:GetRads() < 600 then
		surface.SetMaterial(rad2)
		surface.SetDrawColor(Color(255, 255, 255, 255))

		-- 600-799 Rads: Critical Rad Poisoning
	elseif char:GetRads() > 599 and char:GetRads() < 800 then
		surface.SetMaterial(rad3)
		surface.SetDrawColor(Color(255, 255, 255, 255))

		-- 800+ Rads: Deadly Rad Poisoning
	elseif char:GetRads() >= 800 then
		surface.SetMaterial(rad4)
		surface.SetDrawColor(Color(255, 255, 255, 255))
	end

	surface.DrawTexturedRect(ScrW()-80, ScrH()-300, 33, 35, Color(0, 255, 0, 255))
end