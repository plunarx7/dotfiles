local beautiful = require("beautiful")

local function update_window_borders()
  local t = awful.screen.focused().selected_tag
  if #t:clients() == 1 and t.layout.name ~= "floating" then
    for _, c in ipairs(t:clients()) do
      c.border_width = 0
    end
  else
    for _, c in ipairs(t:clients()) do
      c.border_width = beautiful.border_width
    end
  end
end

client.connect_signal("manage", function (c)
    -- Set the windows at the slave,
    -- i.e. put it at the end of others instead of setting it master.
    -- if not awesome.startup then awful.client.setslave(c) end

    if awesome.startup
      and not c.size_hints.user_position
      and not c.size_hints.program_position then
        -- Prevent clients from being unreachable after screen count changes.
        awful.placement.no_offscreen(c)
    end
end)

client.connect_signal("manage", update_window_borders)
client.connect_signal("unmanage", update_window_borders)
client.connect_signal("tag::history::update", update_window_borders)
client.connect_signal("mouse::enter", function(c)
    c:emit_signal("request::activate", "mouse_enter", {raise = false})
end)

client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
