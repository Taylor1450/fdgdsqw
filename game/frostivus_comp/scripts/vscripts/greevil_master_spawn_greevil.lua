greevil_master_spawn_greevil = class({})
LinkLuaModifier( "green_greevil_heal_passive_modi", LUA_MODIFIER_MOTION_NONE )


function greevil_master_spawn_greevil:GetCooldown( nLevel)

		return self.BaseClass.GetCooldown( self, nLevel )

end

function greevil_master_spawn_greevil:OnSpellStart() 
	local hCaster = self:GetCaster()

	local h = 0

	if hCaster == nil then 
		return
	end

	greev = CreateUnitByName("npc_greevil_master_greevil", hCaster:GetAbsOrigin(), true, hCaster, hCaster, hCaster:GetTeam())		
	greev:SetControllableByPlayer(hCaster:GetPlayerOwnerID(), true)
	greev:AddNewModifier(greev, nil, "green_greevil_heal_passive_modi", {})

end