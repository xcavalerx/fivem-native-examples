-- Author: 	Cavaler
-- Date:	March 4th, 2020
-- Desc:	Adds health related commands and provides feedback in the safest(*) way possible.

------------------------------------------------------
------------------------------------------------------
-- Cmds:	get/hp/value (x)
--		get/hp/regen/limit (x)
--		set/hp/value (x) 
--		set/hp/regen/limit (x)
--		set/hp/regen/mul (x)
------------------------------------------------------
------------------------------------------------------

-- GetEntityHealth
RegisterCommand("get/hp/value", (function(source, args)
	--	Allows the caller to get the health value of the local player entity
	--	to the value of the first argument. The value is converted to a float using * 1.0

	-- Action
	local _EntityHealth = GetEntityHealth(PlayerPedId())

	-- Feedback
	TriggerEvent("chat:addMessage", {
		args = {"GetEntityHealth => " .. tostring(_EntityHealth)}
	}) 
	
end)
)

-- GetPlayerHealthRechargeLimit
RegisterCommand("get/hp/regen/limit", (function(source, args)
	--	Allows the caller to get the regeneration limit of the local player
	--	to the value of the first argument. The value is converted to a float using * 1.0

	-- Action
	local _PlayerHealthRechargeLimit = GetPlayerHealthRechargeLimit(PlayerId(0))

	-- Feedback
	TriggerEvent("chat:addMessage", {
		args = {"GetPlayerHealthRechargeLimit => " .. tostring(_PlayerHealthRechargeLimit)}
	})

    end)
)

------------------------------------------------------
------------------------------------------------------

-- i. SetEntityHealth
RegisterCommand("set/hp/value", (function(source, args)
	--	Allows the caller to set the health value of the local player entity
	--	to the value of the first argument. The value is converted to a float using * 1.0

	-- Action
	local _EntityHealth = tonumber(arg[1]);
	SetEntityHealth(PlayerPedId(), _EntityHealth);

	-- Feedback
	TriggerEvent("chat:addMessage", {
		args = {"SetEntityHealth  => " .. tostring(_EntityHealth)}
	})
	
    end)
)

-- SetPlayerHealthRechargeLimit
RegisterCommand("set/hp/regen/limit", (function(source, args)
    -- Allows the caller to set the regeneration limit of the local player
    -- to the value of the first argument. The value is converted to a float using * 1.0

	-- Action
	local _RegenLimit = tonumber(args[1]) * 1.0;
    SetPlayerHealthRechargeLimit(PlayerId(0), _RegenLimit);

	-- Feedback
    TriggerEvent("chat:addMessage", {
        args = {"SetPlayerHealthRechargeLimit => " .. tostring(_RegenLimit)}
    })

    end)
)

-- SetPlayerRegenMultiplier
RegisterCommand("set/hp/regen/mul", (function(source, args)
	--	Allows the caller to set the regeneration multiplier of the local player
	--	to the value of the first argument. The value is converted to a float using * 1.0

	-- Action
	local _RechargeMultiplier = tonumber(args[1]) * 1.0;
	SetPlayerHealthRechargeMultiplier(PlayerId(0), _RechargeMultiplier);

	-- Feedback
	TriggerEvent("chat:addMessage", {
		args = {"SetPlayerHealthRechargeMultiplier => " .. tostring(_RechargeMultiplier)}
	})

	end)
)
--
