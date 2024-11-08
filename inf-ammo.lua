function checkpriv()
    return (LocalPlayer():IsAdmin() or not game.IsDedicated()) --no way someone abuses this, as this check isadmin, and checks if its dedicated!
end

if checkpriv() then
    -- Define the custom console command /infammo
    concommand.Add("infammo", function(ply, cmd, args)
        -- Ensure the player has provided a weapon name
        if #args < 1 then
            return -- No message is printed for incorrect usage
        end

        -- Get the weapon name from the arguments
        local weaponName = args[1]
        
        -- Try to find the weapon in the player's inventory
        local weapon = ply:GetWeapon(weaponName)
        
        -- Check if the weapon is valid
        if IsValid(weapon) then
            -- Get the primary ammo type for the weapon
            local ammoType = weapon:GetPrimaryAmmoType()
            
            -- Set a large amount of ammo to simulate infinite ammo
            ply:SetAmmo(999999, ammoType)
        else
            -- If the weapon isn't found, print an error message
            print("Weapon " .. weaponName .. " not found!")
        end
    end)
end
