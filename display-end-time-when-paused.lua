-- Auteur: seigneurfuo
-- Version: 0.1

local mp = require 'mp'

function on_pause_change(_, paused)
    if paused then
        local remaining_seconds = mp.get_property('time-remaining')

        local now = os.time()
        local end_time = now + remaining_seconds
        local end_time_string = os.date('%H:%M:%S', end_time)

        local msg = "Se termine à: " .. end_time_string
        mp.osd_message(msg)
    end
end

mp.observe_property('pause', 'bool', on_pause_change)
