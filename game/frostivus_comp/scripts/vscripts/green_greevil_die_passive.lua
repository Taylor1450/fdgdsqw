green_greevil_die_passive = class({})
LinkLuaModifier( "green_greevil_die_passive_modi", LUA_MODIFIER_MOTION_NONE )


function green_greevil_die_passive:OnUpgrade() 
	local hCaster = self:GetCaster()

	if hCaster == nil then 
		return
	end


	hCaster:AddNewModifier(hCaster, self, "green_greevil_heal_passive_modi",{})

end