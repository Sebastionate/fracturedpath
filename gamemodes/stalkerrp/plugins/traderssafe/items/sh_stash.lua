ITEM.name = "Personal Stash"
ITEM.model = "models/hgn/srp/items/backpack-1.mdl"
ITEM.width = 2
ITEM.description = "A secure stash."
ITEM.longdesc = "A backpack with a combination lock, discrete and easily hidden. Can be placed somewhere to create a useful hiding spot for yourself and/or your friends."
ITEM.height = 2
ITEM.price = 2000
ITEM.flag = "1"
ITEM.category = "Tools"
ITEM.repairCost = ITEM.price/100*1
ITEM.weight = 3
ITEM.flag = "1"


function ITEM:GetDescription()
	local str = self.description
	if self.longdesc then
		str = str.."\n"..(self.longdesc or "")
	end

	if (self.entity) then
		return (self.description)
	else
        return (str)
	end
end



ITEM.functions.use = {
	name = "Place Stash",
	icon = "icon16/accept.png",
	OnRun = function(item)
		local entity = ents.Create("ix_stash")
        local eyeTrace = item.player:GetPos()
        entity:SetPos(eyeTrace)
        entity:Spawn()
		return true
	end,
	OnCanRun = function(item)
		return !IsValid(item.entity) 
	end
}

ITEM.functions.Sell = {
	name = "Sell",
	icon = "icon16/stalker/sell.png",
	sound = "physics/metal/chain_impact_soft2.wav",
	OnRun = function(item)
		local client = item.player
		local sellprice = item.price
		sellprice = math.Round(sellprice*0.75)
		client:Notify( "Sold for "..(sellprice).." rubles." )
		client:GetCharacter():GiveMoney(sellprice)
	end,
	OnCanRun = function(item)
		return !IsValid(item.entity) and item:GetOwner():GetCharacter():HasFlags("1")
	end
}

ITEM.functions.Value = {
	name = "Value",
	icon = "icon16/help.png",
	sound = "physics/metal/chain_impact_soft2.wav",
	OnRun = function(item)
		local client = item.player
		local sellprice = item:GetData("RealPrice") or item.price
		sellprice = math.Round(sellprice*0.75)
		client:Notify( "Item is sellable for "..(sellprice).." rubles." )
		return false
	end,
	OnCanRun = function(item)
		return !IsValid(item.entity) and item:GetOwner():GetCharacter():HasFlags("1")
	end
}