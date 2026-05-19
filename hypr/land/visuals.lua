hl.monitor({
  output   = "",
  mode     = "preferred",
  position = "auto",
  scale    = "3",
})

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

-- Only use gaps when >1 window in workspacw
hl.workspace_rule({
  workspace = "w[tv1]",
  gaps_out = 0,
  gaps_in = 0,
})
hl.window_rule({
  name = "Smart Gaps",
  match = {
    workspace = "w[tv1]",
    float = false,
  },
  border_size = 0,
  rounding = 0,
})

hl.config({
  general = {
    gaps_in = 5,
    gaps_out = 10,
    border_size = 2,
    layout = dwindle,
  },
  decoration = {
    rounding = 5,
  },
  animations = {
    enabled = false,
  },
  misc = {
    force_default_wallpaper = 0,
    disable_hyprland_logo = true,
  },
  -- xwayland = {
  --   force_zero_scaling = true,
  -- },
})
