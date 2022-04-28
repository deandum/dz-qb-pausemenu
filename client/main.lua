local QBCore = exports['qb-core']:GetCoreObject()

local pauseMenuOpened = false


-- threads
CreateThread(function()
    while not LocalPlayer.state.isLoggedIn do
        -- do nothing
        Wait(1000)
    end

	while true do
        if IsPauseMenuActive() and not pauseMenuOpened then
            TriggerEvent('dz-qb-holdmap:client:ToggleMap')
            pauseMenuOpened = true
        end
        
        if not IsPauseMenuActive() and pauseMenuOpened then
            TriggerEvent('dz-qb-holdmap:client:ToggleMap')
            pauseMenuOpened = false
        end
        Wait(0)
	end
end)
