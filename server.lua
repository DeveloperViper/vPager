
    -- Scripts by Viper discord.gg/MzMyVkv7MF
    webhook = '' --Example 'https://discord.com/api/webhooks/9537909711145571223/_NtfwefwlC-wgwegwJZf45RKwgwegewgHqsYcD0KKrDTc-e2sLZIiokQwHKZZaberkm201n9o1infl8OzPk'
    local staffrole = "" -- Example "<@&924422219852034068>"
    
    RegisterCommand('page', function(source, args)
        if (webhook == nil or webhook == '') then
            print("There is no webhook assinged to this resource.")
        end
        
    
        if #args > 0 then 
            local src = source;
            local pager = GetPlayerName(src)
            local msg = table.concat(args, " ");
            TriggerClientEvent('chatMessage', source, "^7[^5vPager^7]: ^2Thanks for Paging ^8FIRE ^7& ^5EMS ^7 are enroute")

            sendToDiscord(16711680, "**Pager Activated!**", "**Pager:** "..pager.."\n\n**Message:** "..msg.." ", footer) 
        end
    end, false)


    function sendToDiscord(color, name, message, footer)
        local embed = {
              {
                  ["color"] = color,
                  ["title"] = "**".. name .."**",
                  ["description"] = message,
                  ["footer"] = {
                      ["text"] = "Made By: Viper",
                  },
              }
          }
    
          PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({embeds = embed, content = ""..staffrole..""}), { ['Content-Type'] = 'application/json' })
    end   