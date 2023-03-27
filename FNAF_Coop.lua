local start = os.clock()

game.StarterGui:SetCore("SendNotification", {
   Title = "Script",
   Text = "Loading script...",
   Icon = "http://www.roblox.com/asset/?id=9420331564",
   Duration = 5
})

local Success,Error = pcall(function()
    repeat wait() until game:IsLoaded()

    local ESPFolders = {
        [workspace:WaitForChild("Animatronics",3) or game.ReplicatedFirst] = Color3.new(1,0,0);
        [workspace:WaitForChild("JANITORMissions",3) or game.ReplicatedFirst] = Color3.new(0,.75,1);
        [workspace:WaitForChild("NPCs",3) or game.ReplicatedFirst] = Color3.new(1,0,0);
        [workspace:WaitForChild("Levers",3) or game.ReplicatedFirst] = Color3.new(0,.5,1);
        [game:GetService("Players",3) or game.ReplicatedFirst] = Color3.new(0,1,0);
    }

    game:GetService("RunService").RenderStepped:Connect(function()
        game.Lighting.Brightness = 2
        game.Lighting.Ambient = Color3.new(1,1,1)
        game.Lighting.OutdoorAmbient = Color3.new(1,1,1)

        for e,dot in pairs(ESPFolders) do
            if dot ~= game.ReplicatedFirst then
                for i,v in pairs(e:GetChildren()) do
                    if v:IsA("Player") then
                        v = v.Character
                        if v then
                            if not v:FindFirstChild("Highlight") then
                                local Highlight = Instance.new("Highlight",v)
                            else
                                local Highlight = v:FindFirstChild("Highlight")
                                Highlight.FillColor = dot
                            end
                        end
                    elseif v:IsA("Folder") then
                        v = v:FindFirstChildOfClass("Model")
                        if v then
                            if not v:FindFirstChild("Highlight") then
                                local Highlight = Instance.new("Highlight",v)
                            else
                                local Highlight = v:FindFirstChild("Highlight")
                                Highlight.FillColor = dot
                            end
                        end
                    else
                        if v:FindFirstChildOfClass("Humanoid") then
                            if not v:FindFirstChild("Highlight") then
                                local Highlight = Instance.new("Highlight",v)
                            else
                                local Highlight = v:FindFirstChild("Highlight")
                                Highlight.FillColor = dot
                            end
                        else
                            if not v:FindFirstChild("Highlight") then
                                local Highlight = Instance.new("Highlight",v)
                            else
                                local Highlight = v:FindFirstChild("Highlight")
                                Highlight.FillColor = dot
                            end
                        end
                    end
                end
            end
        end
    end)

    local Type
    local finish = os.clock()
    
    local time = finish - start

    if time < 3 then
       Type = "fast"
    elseif time < 5 then
       Type = "acceptable"
    else
       Type = "slow"
    end

    game.StarterGui:SetCore("SendNotification", {
       Title = "Script",
       Text = string.format("Script loaded in %.2f seconds (%s loading)", time, Type),
       Icon = "http://www.roblox.com/asset/?id=7084794697",
       Duration = 5
    })
end)

if Error then
    local Info

    Info = (string.find(Error,"nil") and "Invalid Object") or "None"
    
    game.StarterGui:SetCore("SendNotification", {
       Title = "Script",
       Text = "Error in Script, "..Error.." Info: "..Info,
       Icon = "http://www.roblox.com/asset/?id=11345695781",
       Duration = 5
    })
end
