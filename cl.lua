RegisterCommand('bmx', function(source, args)

    if not t then
        local vn = 'bmx'

        RequestModel(vn)

        while not HasModelLoaded(vn) do
            Wait(500)
        end

        local p = PlayerPedId()
        local pos = GetEntityCoords(p)

        local v = CreateVehicle(vn, pos.x, pos.y, pos.z, GetEntityHeading(p), true, false)

        SetPedIntoVehicle(p, v, -1)
        t = true
        SetEntityAsNoLongerNeeded(v)

        SetModelAsNoLongerNeeded(vn)
    end
end, false)

local cd = 10 -- Seconds

CreateThread(function()
    while true do
        Wait(1000)
        if t then
            Wait(cd * 1000)
            t = false
        end
    end
end)