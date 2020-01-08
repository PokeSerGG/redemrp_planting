data = {}
TriggerEvent("redemrp_inventory:getData",function(call)
    data = call
end)

RegisterServerEvent("RegisterUsableItem:tobaccoseed")
AddEventHandler("RegisterUsableItem:tobaccoseed", function(source)
    local _source = source
    TriggerClientEvent('poke_planting:planto1', _source, "CRP_TOBACCOPLANT_AA_SIM", "CRP_TOBACCOPLANT_AB_SIM", "CRP_TOBACCOPLANT_AC_SIM")
	data.delItem(_source, "tobaccoseed", 1)
end)

RegisterServerEvent("RegisterUsableItem:sugarsaneseed")
AddEventHandler("RegisterUsableItem:sugarsaneseed", function(source)
    local _source = source
    TriggerClientEvent('poke_planting:planto1', _source, "CRP_SUGARCANE_AA_SIM", "CRP_SUGARCANE_AB_SIM", "CRP_SUGARCANE_AC_SIM")
	data.delItem(_source, "sugarcaneseed", 1)
end)

RegisterServerEvent("RegisterUsableItem:cornseed")
AddEventHandler("RegisterUsableItem:cornseed", function(source)
    local _source = source
    TriggerClientEvent('poke_planting:planto1', _source, "CRP_CORNSTALKS_CB_SIM", "CRP_CORNSTALKS_CA_SIM", "CRP_CORNSTALKS_AB_SIM")
	data.delItem(_source, "cornseed", 1)
end)

RegisterServerEvent("RegisterUsableItem:wateringcan")
AddEventHandler("RegisterUsableItem:wateringcan", function(source)
    local _source = source
    TriggerClientEvent('poke_planting:regar1', _source)
end)

RegisterServerEvent('poke_planting:giveitem')
AddEventHandler('poke_planting:giveitem', function(tipo)
    local _source = source
	local count = math.random(3, 8)
    TriggerEvent('redemrp:getPlayerFromId', _source, function(user)
		if tipo == "CRP_TOBACCOPLANT_AC_SIM" then
			TriggerClientEvent("redemrp_notification:start", _source, 'You have collected [X'..count..'] of tobacco', 3)
			data.addItem(_source, "tobacco", count)
		elseif tipo == "CRP_SUGARCANE_AC_SIM" then
			TriggerClientEvent("redemrp_notification:start", _source, 'You have collected [X'..count..'] of sugar', 3)
			data.addItem(_source, "sugar", count)
		elseif tipo == "CRP_CORNSTALKS_AB_SIM" then
			TriggerClientEvent("redemrp_notification:start", _source, 'You have collected [X'..count..'] of corn', 3)
			data.addItem(_source, "corn", count)
		end
    end)
end)
