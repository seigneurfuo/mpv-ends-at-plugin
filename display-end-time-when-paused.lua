-- Auteur: seigneurfuo
-- Version: 0.2.2

--- <Config> ---
local config_osd_duration = 5
local config_show_current_time = false
--- </Config> ---

local mp = require 'mp'
local already_paused = false

function on_load()
    -- https://github.com/mpv-player/mpv/issues/6079#issuecomment-414138926
    mp.add_timeout(1, function()
        show_message();
    end)
end

function on_pause_change(_, paused)
    if paused then
        already_paused = paused
        show_message()

    elseif already_paused then
        show_message()
        already_paused = false
    end
end

function show_message()
    local remaining_seconds = mp.get_property('playtime-remaining') -- playtime-remaining ?

    local now = os.time()
    local now_time_string = os.date('%H:%M:%S', now)
    local end_time = now + remaining_seconds
    local end_time_string = os.date('%H:%M:%S', end_time)

    local msg = "Ends at: " .. end_time_string 

    if config_show_current_time then
        msg = msg .. " (Time: " .. now_time_string .. ")"
    end

    --local msg = "Ends at: " .. end_time_string .. "\n" .. "Current time: " .. now_time_string
    --local msg = "Current time: " .. now_time_string .. "\nEnds at: " .. end_time_string
    mp.osd_message(msg, config_osd_duration)
end

mp.add_hook('on_load', 50, on_load)
mp.observe_property('pause', 'bool', on_pause_change)
