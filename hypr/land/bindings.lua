local terminal   = "kitty -e tmux new-session -A -s Home -n Home"
local browser    = "firefox"
local menu       = "rofi -show drun"
local screenshot = "grim -g \"$(slurp -d)\" - | wl-copy -t image/png"
local vpn        = "$HOME/.config/hypr/scripts/pia_vpn_util"
local scripts    = "$HOME/.config/rofi/scripts"

local main_mod   = "SUPER"

-- Workspace Movements
for i = 1, 10 do
  local key = i % 10 -- 10 maps to key 0
  hl.bind(main_mod .. " + " .. key, hl.dsp.focus({ workspace = i }))
  hl.bind(main_mod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Move Focus
hl.bind(main_mod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(main_mod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(main_mod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(main_mod .. " + down", hl.dsp.focus({ direction = "down" }))
hl.bind(main_mod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(main_mod .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(main_mod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(main_mod .. " + J", hl.dsp.focus({ direction = "down" }))

-- Move Workspace Between Monitors
hl.bind(main_mod .. " + CTRL + left", hl.dsp.workspace.move({ monitor = "l" }))
hl.bind(main_mod .. " + CTRL + right", hl.dsp.workspace.move({ monitor = "u" }))
hl.bind(main_mod .. " + CTRL + up", hl.dsp.workspace.move({ monitor = "d" }))
hl.bind(main_mod .. " + CTRL + down", hl.dsp.workspace.move({ monitor = "r" }))
hl.bind(main_mod .. " + CTRL + H", hl.dsp.workspace.move({ monitor = "l" }))
hl.bind(main_mod .. " + CTRL + J", hl.dsp.workspace.move({ monitor = "u" }))
hl.bind(main_mod .. " + CTRL + K", hl.dsp.workspace.move({ monitor = "d" }))
hl.bind(main_mod .. " + CTRL + L", hl.dsp.workspace.move({ monitor = "r" }))

-- Toggle Window State
hl.bind(main_mod .. " + F", hl.dsp.window.fullscreen())
hl.bind(main_mod .. " + T", hl.dsp.window.float())

-- Move & Resize Windows
hl.bind(main_mod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(main_mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Open Apps
hl.bind(main_mod .. " + RETURN", hl.dsp.exec_cmd(terminal))
hl.bind(main_mod .. " + B", hl.dsp.exec_cmd(scripts .. "/browser/browse " .. browser))

-- Quitting
hl.bind(main_mod .. " + Q", hl.dsp.window.close())
hl.bind(main_mod .. " + SHIFT + Q", hl.dsp.exec_cmd(scripts .. "/power_menu"))

-- App Launcher
hl.bind(main_mod .. " + SPACE", hl.dsp.exec_cmd(menu))
hl.bind(main_mod .. " + SUPER_L", hl.dsp.exec_cmd(menu), { release = true })
hl.bind(main_mod .. " + SUPER_R", hl.dsp.exec_cmd(menu), { release = true })

-- Change VPN State
hl.bind(main_mod .. " + V", hl.dsp.exec_cmd(vpn))

-- Change Sound Output
hl.bind(main_mod .. " + O", hl.dsp.exec_cmd(scripts .. "/choose_sound_output"))

-- Screenshot
hl.bind(main_mod .. " + S", hl.dsp.exec_cmd(screenshot))

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
  { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
  { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
  { locked = true, repeating = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })
