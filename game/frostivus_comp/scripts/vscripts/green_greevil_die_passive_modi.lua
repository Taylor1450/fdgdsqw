green_greevil_die_passive_modi = class({})
LinkLuaModifier( "green_greevil_die_passive_owner_modi", LUA_MODIFIER_MOTION_NONE )

own = nil

function green_greevil_die_passive_modi:DeclareFunctions()

	local funcs = {
		MODIFIER_EVENT_ON_DEATH  ,
	}
 
	return funcs
end

function green_greevil_die_passive_modi:OnCreated()
	if IsServer() then
		own = self:GetParent():GetOwner()
	end
end

function green_greevil_die_passive_modi:IsHidden()
	return false
end
function green_greevil_die_passive_modi:OnDeath( params )	

	if own ~= nil and params.unit == self:GetParent() and IsServer() then
		own:AddNewModifier(own, nil, "green_greevil_die_passive_owner_modi",{duration = 5})
	end
end