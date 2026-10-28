hl.monitor({
  output   = "",
  mode     = "1920x1080@120",
  position = "auto",
  scale    = "1",
})

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

hl.config({
  general = {
    gaps_in = 5,
    gaps_out = {
      top     = 0,
      bottom  = 25,
      left    = 40,
      right   = 40,
    },
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
