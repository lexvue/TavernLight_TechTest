
-- Question 1

local function releaseStorage(player)
    --[[ 
        Since I don't have access to this function and what it does,
        I will assume that releaseStorage empties the player's storage content.
        So therefore, setStorageValue(0) makes sense here to me, as it will "empty"
        the player's storage value by setting it to 0.
    --]]
    player:setStorageValue(0)
end

function onLogout(player)
    --[[
        It seems like this function serves to empty the player's storage when they
        log out, so we only need to do that if their storage is nonempty which 
        is any value greater than or equal to 1
    --]]
    if player:getStorageValue() >= 1 then
        --[[ 
            We can call releaseStorage directly since it still exists within the scope
            of the class
        --]]
        releaseStorage(player)
    end
    return true
end

-- Question 2

function printSmallGuildNames(memberCount)
    --[[ 
        this method is supposed to print names of all guilds that
        have less than memberCount max members
    --]]
    local resultId = db.storeQuery("SELECT name FROM guilds WHERE max_members < " .. tostring(memberCount)) -- I moved the string directly into the storequery and used tostring to take in membercount
    if resultId == false then -- in case this query returns nil
        return false
    end
    local guildName = resultId.getString("name") -- this returns a table

    -- printing out the values in the table

    for k, v in pairs(guildName) do
        print(v)
    end
end



-- Question 3

function removeMemberFromParty(playerId, membername)

    local player = Player(playerId)
    if not player then
        return
    end
    -- don't need getParty() as getMembers() does the same and actually exists
    for index, member in pairs(player:getMembers()) do
        if member.getName() == membername then
            party:removeMember(membername)
        else
            print("Player not found in party")
        end
    end
end
