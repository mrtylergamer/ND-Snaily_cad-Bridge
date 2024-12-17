local alert = { header = 'Cad-Alert', content = 'this character has been registered To the MSRP cad system\n Please ensure you set yur Hair color eye color and address as sadly we cannot currently', centered = true, cancel = true, }



AddEventHandler("ND:characterLoaded", function(char)
    if not (exports['bryan_snaily']:IsCitizenRegistered(char.firstname, char.lastname)) then
    	createchar(char)
        TriggerClientEvent('ox_lib:alertDialog', char.source, alert)
    else
    end
end)

function createchar (c)
	exports['bryan_snaily']:InsertNewCitizen(c.firstname, c.lastname, c.dob, findcaduser(c.source), "Male")
end

function findcaduser (user)
    for k, v in ipairs(GetPlayerIdentifiers(user)) do
       if string.match(v, "discord:") then
          userdiscord = v
          break
       end
    end
    local searchuserid = userdiscord:gsub("^discord:", "")
    local caduser = exports['bryan_snaily']:SearchForUser(searchuserid)

    return caduser
end