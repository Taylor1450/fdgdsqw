green_greevil_heal_passive_modi = class({})


function green_greevil_heal_passive_modi:DeclareFunctions()

	local funcs = {
		MODIFIER_EVENT_ON_TAKEDAMAGE  ,
	}
 
	return funcs
end

function green_greevil_heal_passive_modi:IsHidden()
	return false
end
function green_greevil_heal_passive_modi:OnTakeDamage( params )	
	if IsServer() and params.unit == self:GetParent() then

		ran = RandomInt(3, 20) 
		local ally = FindUnitsInRadius( self:GetParent():GetTeamNumber(), self:GetParent():GetOrigin(), self:GetParent(), 300, DOTA_UNIT_TARGET_TEAM_FRIENDLY, DOTA_UNIT_TARGET_HERO, 0, 0, false )

		if #ally > 1 and ran == 3 then

			rane = RandomInt(2, #ally) 


			ally[rane]:Heal(params.damage, self:GetParent())

		end
	end
end