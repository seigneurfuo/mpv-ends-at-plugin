-- Auteur: seigneurfuo
-- Version: 0.2

local mp = require 'mp'
local osd_duration = 2

function on_load()
    -- https://github.com/mpv-player/mpv/issues/6079#issuecomment-414138926
    mp.add_timeout(1, function()
        show_message();
    end)
end

function on_pause_change(_, paused)
    if paused then
        show_message()
    end
end

function show_message()
    local remaining_seconds = mp.get_property('playtime-remaining') -- playtime-remaining ?

    local now = os.time()
    local end_time = now + remaining_seconds
    local end_time_string = os.date('%H:%M:%S', end_time)

    local msg = "Se termine à: " .. end_time_string
    mp.osd_message(msg, osd_duration)
end

mp.add_hook('on_load', 50, on_load)
mp.observe_property('pause', 'bool', on_pause_change)
