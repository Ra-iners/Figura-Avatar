local Target = "Rai_i"
local TargetObj = nil
local Amogy = models.Rai.Amogy
Amogy:setParentType("World")

c = 0
events.TICK:register(function()
    c = c+1 
    local Players = world:getPlayers()
    for i,v in pairs(Players) do
        if v:getName() == Target then
            TargetObj = v
        end
    end
    
    if TargetObj ~= nil then
        pcall(function()
            local pos = TargetObj:getPos()
            local lookDir = TargetObj:getLookDir()
            local x,y,r = lookDir[1],lookDir[3],1
            Amogy:setPivot(pos[1]*16,pos[2]*16,pos[3]*16)
            local Angle = (math.atan2(y,x) * 180 / math.pi)/55
            local nx,ny = x+r*math.cos(Angle)*16, y+r*math.sin(Angle)*16
            Amogy:setPos((pos[1]*16)+nx,(pos[2]*16)-10,(pos[3]*16)+ny)
            Amogy:setPivot(Amogy:getPos())
            Amogy:setRot(0,-(nx*ny),0)
        end)
    else
        -- print("Player no existo")
    end
end)
