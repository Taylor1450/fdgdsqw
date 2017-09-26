-- Generated from template
LinkLuaModifier( "green_greevil_heal_passive_modi", LUA_MODIFIER_MOTION_NONE )

if CAddonTemplateGameMode == nil then
	CAddonTemplateGameMode = class({})
end

function Precache( context )
	--[[
		Precache things we know we'll use.  Possible file types include (but not limited to):
			PrecacheResource( "model", "*.vmdl", context )
			PrecacheResource( "soundfile", "*.vsndevts", context )
			PrecacheResource( "particle", "*.vpcf", context )
			PrecacheResource( "particle_folder", "particles/folder", context )
	]]
end

function CAddonTemplateGameMode:OnNPCSpawned( keys )
	local npc = EntIndexToHScript(keys.entindex)

	if npc:IsRealHero() and (npc:GetClassname() == "npc_dota_hero_tusk") then
		if not npc:GetAbilityByIndex(1):IsTrained() then
			npc:GetAbilityByIndex(1):SetLevel(1)
		end
	end



	if npc:GetClassname() == "npc_greevil_master_greevil" then
		npc:AddNewModifier(npc, nil, "green_greevil_heal_passive_modi", {})
		print("done")
	end
end

-- Create the game mode when we activate
function Activate()
	GameRules.AddonTemplate = CAddonTemplateGameMode()
	GameRules.AddonTemplate:InitGameMode()
end

function CAddonTemplateGameMode:InitGameMode()
	print( "Template addon is loaded." )
	GameRules:GetGameModeEntity():SetThink( "OnThink", self, "GlobalThink", 2 )
	ListenToGameEvent('npc_spawned', Dynamic_Wrap(CAddonTemplateGameMode, 'OnNPCSpawned'), self)

end

-- Evaluate the state of the game
function CAddonTemplateGameMode:OnThink()
	if GameRules:State_Get() == DOTA_GAMERULES_STATE_GAME_IN_PROGRESS then
	elseif GameRules:State_Get() >= DOTA_GAMERULES_STATE_POST_GAME then
		return nil
	end
	return 1
end