green_greevil_heal = class({})
LinkLuaModifier( "green_greevil_heal_modi", LUA_MODIFIER_MOTION_NONE )


function green_greevil_heal:GetCooldown( nLevel)

		return self.BaseClass.GetCooldown( self, nLevel )

end

function green_greevil_heal:OnSpellStart() 
	local hCaster = self:GetCaster()
	local hTarget = self:GetCursorTarget()

	if hCaster == nil then 
		return
	end

	if hTarget == nil then
		return
	end

	hTarget:AddNewModifier(hCaster, self, "green_greevil_heal_modi",{})

end