greevil_master_spawn_greevil = class({})


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
end