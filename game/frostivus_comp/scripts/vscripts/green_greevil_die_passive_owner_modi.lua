green_greevil_die_passive_owner_modi = class({})

function green_greevil_die_passive_owner_modi:DeclareFunctions()

	local funcs = {
		MODIFIER_PROPERTY_HEALTH_REGEN_CONSTANT  ,
	}
 
	return funcs
end

function green_greevil_die_passive_owner_modi:IsHidden()
	return false
end
function green_greevil_die_passive_owner_modi:GetModifierConstantHealthRegen( params )	

	return 12
end