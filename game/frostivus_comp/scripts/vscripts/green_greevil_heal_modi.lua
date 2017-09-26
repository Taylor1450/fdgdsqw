green_greevil_heal_modi = class({})

heal = 0

function green_greevil_heal_modi:DeclareFunctions()

	local funcs = {
		MODIFIER_PROPERTY_HEALTH_REGEN_PERCENTAGE,
	}
 
	return funcs
end

function green_greevil_heal_modi:IsHidden()
	return false
end
function green_greevil_heal_modi:GetModifierHealthRegenPercentage( params )
	return (100 - self:GetParent():GetHealthPercent()) * .25


	

end