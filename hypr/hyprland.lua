require("land/bindings")
require("land/visuals")

hl.config({
  input = {
      kb_layout = us,
      follow_mouse = 1,
  },
})

-- Fix some dragging issues with XWayland
hl.window_rule({
  name     = "fix-xwayland-drags",
  match    = {
    class      = "^$",
    title      = "^$",
    xwayland   = true,
    float      = true,
    fullscreen = false,
    pin        = false,
  },

  no_focus = true,
})

-- Suppress Maximize Requests
hl.window_rule({
  name  = "suppress-maximize-events",
  match = { class = ".*" },
  suppress_event = "maximize",
})

hl.on("hyprland.start", function()
  hl.exec_cmd("gammastep")
  hl.exec_cmd("hyprpaper")
  hl.exec_cmd("piactl connect")
  hl.exec_cmd("waybar")
end)

