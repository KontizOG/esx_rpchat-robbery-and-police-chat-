
local admins = {
}

function isAdmin(player)
    local allowed = false
    for i,id in ipairs(admins) do
        for x,pid in ipairs(GetPlayerIdentifiers(player)) do
            if string.lower(pid) == string.lower(id) then
                allowed = true
            end
        end
    end
    return allowed
end

function getIdentity(source)
	local identifier = GetPlayerIdentifiers(source)[1]
	local result = MySQL.Sync.fetchAll("SELECT * FROM users WHERE identifier = @identifier", {['@identifier'] = identifier})
	if result[1] ~= nil then
		local identity = result[1]

		return {
			identifier = identity['identifier'],
			firstname = identity['firstname'],
			lastname = identity['lastname'],
			dateofbirth = identity['dateofbirth'],
			sex = identity['sex'],
			height = identity['height']
			
		}
	else
		return nil
	end
end

 AddEventHandler('chatMessage', function(source, name, message)
      if string.sub(message, 1, string.len("/")) ~= "/" then
          local name = getIdentity(source)
		--TriggerClientEvent("sendProximityMessageMe", -1, source, name.firstname, message)
      end
      CancelEvent()
  end)
  
  -- TriggerEvent('es:addCommand', 'me', function(source, args, user)
  --    local name = getIdentity(source)
  --    TriggerClientEvent("sendProximityMessageMe", -1, source, name.firstname, table.concat(args, " "))
  -- end) 



  --- TriggerEvent('es:addCommand', 'me', function(source, args, user)
  ---    local name = getIdentity(source)
  ---    TriggerClientEvent("sendProximityMessageMe", -1, source, name.firstname, table.concat(args, " "))
  -- end) 
  TriggerEvent('es:addCommand', 'me', function(source, args, user)
    local name = getIdentity(source)
    table.remove(args, 2)
    TriggerClientEvent('esx-qalle-chat:me', -1, source, name.firstname, table.concat(args, " "))
end)


 RegisterCommand('twt', function(source, args, rawCommand)
    local playerName = GetPlayerName(source)
    local msg = rawCommand:sub(5)
    local name = getIdentity(source)
    fal = name.firstname .. " " .. name.lastname
    TriggerClientEvent('chat:addMessage', -1, {
        template = '<div style="padding: 0.5vw; margin: 0.2vw; background-color: rgba(28, 160, 242, 0.6); border-radius: 3px;"><i class="fab fa-twitter"></i>@{0}: {1}</div> ',
        args = { fal, msg }
    })
    PerformHttpRequest('https://discordapp.com/api/webhooks/687074903576412208/ILJ2pdCylGqtwV6rwuTQRmrtqT1qWWGud6UjRQvacOrjeqaKXLgudO68qh7qWKPExA2s', function(err, text, headers) end, 'POST', json.encode({embeds={{title="TWEET chat logs",description="O \nPlayer name: "..playerName.."\nΕγραψε: "..msg.."",color=17499}}}), { ['Content-Type'] = 'application/json' })
end, false)

 RegisterCommand('anon', function(source, args, rawCommand)
    local playerName = GetPlayerName(source)
    local msg = rawCommand:sub(5)
    local name = getIdentity(source)
    fal = name.firstname .. " " .. name.lastname

    for k,v in pairs(GetPlayers()) do
        if isAdmin(v) then
            fal = GetPlayerName(source)
            TriggerClientEvent('chat:addMessage', v, {
                template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(255, 64, 0, 0.6); border-radius: 3px;"><i class="fab fa-twitter"></i> @{Anonymous}[{0}]: {1}</div> ',
                args = { fal, msg }
            })
        else            
            TriggerClientEvent('chat:addMessage', v, {
                template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(255, 64, 0, 0.6); border-radius: 3px;"><i class="fab fa-twitter"></i> @{Anonymous}: {1}</div> ',
                args = { fal, msg }
            })
        end
    end
    PerformHttpRequest('https://discordapp.com/api/webhooks/687074903576412208/ILJ2pdCylGqtwV6rwuTQRmrtqT1qWWGud6UjRQvacOrjeqaKXLgudO68qh7qWKPExA2s', function(err, text, headers) end, 'POST', json.encode({embeds={{title="ANON chat logs",description="O \nPlayer name: "..playerName.."\nΕγραψε: "..msg.."",color=16711680}}}), { ['Content-Type'] = 'application/json' })
end, false)

RegisterCommand('elas', function(source, args, rawCommand)
    local playerName = GetPlayerName(source)
    local msg = rawCommand:sub(5)
    local name = getIdentity(source)
    fal = name.firstname .. " " .. name.lastname

    for k,v in pairs(GetPlayers()) do
        if isAdmin(v) then
            fal = GetPlayerName(source)
            TriggerClientEvent('chat:addMessage', v, {
                template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(0, 0, 227, 0.6); border-radius: 3px;"><i class="fab fa-twitter"></i> @{EL.AS}[{0}]: {1}</div> ',
                args = { fal, msg }
            })
        else            
            TriggerClientEvent('chat:addMessage', v, {
                template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(0, 0, 227, 0.6); border-radius: 3px;"><i class="fab fa-twitter"></i> @{EL.AS}: {1}</div> ',
                args = { fal, msg }
            })
        end
    end
    PerformHttpRequest('https://discordapp.com/api/webhooks/687074903576412208/ILJ2pdCylGqtwV6rwuTQRmrtqT1qWWGud6UjRQvacOrjeqaKXLgudO68qh7qWKPExA2s', function(err, text, headers) end, 'POST', json.encode({embeds={{title="ANON chat logs",description="O \nPlayer name: "..playerName.."\nΕγραψε: "..msg.."",color=16711680}}}), { ['Content-Type'] = 'application/json' })
end, false)

RegisterCommand('rob', function(source, args, rawCommand)
    local playerName = GetPlayerName(source)
    local msg = rawCommand:sub(5)
    local name = getIdentity(source)
    fal = name.firstname .. " " .. name.lastname

    for k,v in pairs(GetPlayers()) do
        if isAdmin(v) then
            fal = GetPlayerName(source)
            TriggerClientEvent('chat:addMessage', v, {
                template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(60, 61, 61, 0.6); border-radius: 3px;"><i class="fab fa-twitter"></i> @{Robbery}[{0}]: {1}</div> ',
                args = { fal, msg }
            })
        else            
            TriggerClientEvent('chat:addMessage', v, {
                template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(60, 61, 61, 0.6); border-radius: 3px;"><i class="fab fa-twitter"></i> @{Robbery}: {1}</div> ',
                args = { fal, msg }
            })
        end
    end
    PerformHttpRequest('', function(err, text, headers) end, 'POST', json.encode({embeds={{title="ROB chat logs",description="O \nPlayer name: "..playerName.."\nΕγραψε: "..msg.."",color=16711680}}}), { ['Content-Type'] = 'application/json' })
end, false)

 RegisterCommand('ad', function(source, args, rawCommand)
    local playerName = GetPlayerName(source)
    local msg = rawCommand:sub(4)
    local name = getIdentity(source)
    fal = name.firstname .. " " .. name.lastname
    TriggerClientEvent('chat:addMessage', -1, {
        template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(0, 209, 209, 1); border-radius: 3px;"><i class="fas fa-ad"></i> Advertisement: {1}</div> ',
        args = { fal, msg }
    })
    PerformHttpRequest('https://discordapp.com/api/webhooks/687074903576412208/ILJ2pdCylGqtwV6rwuTQRmrtqT1qWWGud6UjRQvacOrjeqaKXLgudO68qh7qWKPExA2s', function(err, text, headers) end, 'POST', json.encode({embeds={{title="ADV chat logs",description="O \nPlayer name: "..playerName.."\nΕγραψε: "..msg.."",color=16771712}}}), { ['Content-Type'] = 'application/json' })

end, false)

        RegisterCommand('ooc', function(source, args, rawCommand)
    local playerName = GetPlayerName(source)
    local msg = rawCommand:sub(5)
    local name = getIdentity(source)

    TriggerClientEvent('chat:addMessage', -1, {
        template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(41, 41, 41, 0.6); border-radius: 3px;"><i class="fas fa-globe"></i> {0}: {1}</div> ',
        args = { playerName, msg }
    })
    PerformHttpRequest('https://discordapp.com/api/webhooks/768921119465275454/0PL6L0Tu4hD3aDKB_W0QkDWBHEu2SA8sbRQ-fWsdyTjy2bok9nn6wQ88kTmzUzDx06Ir', function(err, text, headers) end, 'POST', json.encode({embeds={{title="OOC chat logs",description="O \nPlayer name: "..playerName.."\nΕγραψε: "..msg.."",color=3087}}}), { ['Content-Type'] = 'application/json' })

end, false)


function stringsplit(inputstr, sep)
	if sep == nil then
		sep = "%s"
	end
	local t={} ; i=1
	for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
		t[i] = str
		i = i + 1
	end
	return t
end
