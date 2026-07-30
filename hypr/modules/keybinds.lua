---------------------
---- KEYBINDINGS ----
---------------------
-- hl.bind(mainMod .. "+ ", hl.dsp.exec_cmd(""))
local terminal = "kitty"
local terminalSudo = "kitty sudo su"
local fileManager = "kitty yazi"
local fileManagerSudo = "kitty sudo yazi"
local fileManagerAlt = "dolphin"
local webBrowser = "waterfox"
-- local webBrowserAlt = "firefox"
local menu = "hyprlauncher"
local editor = "kitty nvim"
local editorAlt = "codium"

local mainMod = "SUPER"
local mainModShift = "SUPER + SHIFT"
local mainModAlt = "SUPER + ALT"
local mainModCtrl = "SUPER + CTRL"
--local mainModSpace = "SUPER + SPACE"

hl.bind(mainModShift .. " + A", hl.dsp.exec_cmd("~/.config/hypr/reset.sh"))

-- terminal
hl.bind(mainMod .. "+ TAB", hl.dsp.exec_cmd(terminal))
hl.bind(mainModShift .. "+ F23", hl.dsp.exec_cmd(terminal))
hl.bind(mainModAlt .. "+ TAB", hl.dsp.exec_cmd(terminalSudo))

-- fileManager
hl.bind(mainMod .. "+ E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainModShift .. "+ E", hl.dsp.exec_cmd(fileManagerAlt))
hl.bind(mainModAlt .. "+ E", hl.dsp.exec_cmd(fileManagerSudo))

-- editor
hl.bind(mainMod .. "+ C", hl.dsp.exec_cmd(editor))
hl.bind(mainModShift .. "+ C", hl.dsp.exec_cmd(editorAlt))

--configEdit
hl.bind(mainMod .. "+SLASH", hl.dsp.exec_cmd(editor .. " ~/.config/hypr/hyprland.lua"))
hl.bind(mainModShift .. "+SLASH", hl.dsp.exec_cmd(editorAlt .. " ~/.config/hypr/hyprland.lua"))

-- menu
hl.bind(mainMod .. "+ R", hl.dsp.exec_cmd(menu))

-- shortCuts/app
hl.bind(mainMod .. "+ W", hl.dsp.exec_cmd(webBrowser))
--hl.bind(mainModShift .. " + W", hl.dsp.exec_cmd(webBrowserAlt))
hl.bind(mainMod .. "+ S", hl.dsp.exec_cmd("steam"))
hl.bind(mainMod .. "+ D", hl.dsp.exec_cmd("flatpak run com.discordapp.Discord"))
hl.bind(mainMod .. "+ Z", hl.dsp.exec_cmd("hyprshot -m region -z --clipboard-only"))
hl.bind(mainModShift .. "+ Z", hl.dsp.exec_cmd("hyprshot -m region -z -o ~/Pictures/Screenshots -- mpv"))
hl.bind(mainMod .. "+ X", hl.dsp.exec_cmd("hyprshot -m output -m eDP-1 -o ~/Pictures/Screenshots"))
hl.bind(mainMod .. "+ N", hl.dsp.exec_cmd("hyprlock"))
hl.bind(mainMod .. "+ O", hl.dsp.exec_cmd("pkill wvkbd-deskintl || wvkbd-deskintl"))
hl.bind(mainMod .. "+ N", hl.dsp.exec_cmd("loginctl lock-session"))
hl.bind(mainMod .. "+ I", hl.dsp.exec_cmd("kitty nmtui"))
--hl.bind(mainMod .. "+ ", hl.dsp.exec_cmd(""))

-- actions
hl.bind(mainMod .. "+ Q", hl.dsp.window.close())
hl.bind(
	mainModShift .. "+ M",
	hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'")
)
hl.bind(mainMod .. "+ F", hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" }))
hl.bind(mainMod .. "+ G", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))
-- resetHypralnd
hl.bind(mainModShift .. "+ Tab", function()
	hl.timer(function()
		hl.dispatch(hl.dsp.dpms({ action = "disable" }))
		hl.timer(function()
			hl.dispatch(hl.dsp.dpms({ action = "enable" }))
		end, { timeout = 2000, type = "oneshot" })
	end, { timeout = 1000, type = "oneshot" })
end)
hl.bind(mainModShift .. "+ ESCAPE", hl.dsp.exec_cmd("hyprshutdown --post-cmd 'loginctl poweroff'"))
hl.bind(mainModAlt .. "+ ESCAPE", hl.dsp.exec_cmd("hyprshutdown --post-cmd 'loginctl reboot'"))

hl.bind(mainMod .. " + B", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + V", hl.dsp.layout("togglesplit"))
--hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())

-- Move focus with mainMod + arrow keys
--hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
--hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
--hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
--hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))

--windowMoving
hl.bind(mainMod .. " + h", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + l", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + k", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + j", hl.dsp.focus({ direction = "down" }))
hl.bind(mainModShift .. " + h", hl.dsp.window.swap({ direction = "left" }))
hl.bind(mainModShift .. " + l", hl.dsp.window.swap({ direction = "right" }))
hl.bind(mainModShift .. " + k", hl.dsp.window.swap({ direction = "up" }))
hl.bind(mainModShift .. " + j", hl.dsp.window.swap({ direction = "down" }))

--resizingWindow
hl.bind(mainModCtrl .. " + h", hl.dsp.window.resize({ x = -40, y = 0, relative = true }), { repeating = true })
hl.bind(mainModCtrl .. " + l", hl.dsp.window.resize({ x = 40, y = 0, relative = true }), { repeating = true })
hl.bind(mainModCtrl .. " + k", hl.dsp.window.resize({ x = 0, y = 40, relative = true }), { repeating = true })
hl.bind(mainModCtrl .. " + j", hl.dsp.window.resize({ x = 0, y = -40, relative = true }), { repeating = true })

--movingWindow
hl.bind(mainModAlt .. " + h", hl.dsp.window.move({ x = -40, y = 0, relative = true }), { repeating = true })
hl.bind(mainModAlt .. " + l", hl.dsp.window.move({ x = 40, y = 0, relative = true }), { repeating = true })
hl.bind(mainModAlt .. " + k", hl.dsp.window.move({ x = 0, y = -40, relative = true }), { repeating = true })
hl.bind(mainModAlt .. " + j", hl.dsp.window.move({ x = 0, y = 40, relative = true }), { repeating = true })

--workspaceHopping
for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

hl.bind(mainMod .. " + comma", hl.dsp.focus({ workspace = "-1" }))
hl.bind(mainMod .. " + period", hl.dsp.focus({ workspace = "+1" }))
hl.bind(mainMod .. " + left", hl.dsp.focus({ workspace = "-1" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ workspace = "+1" }))
hl.bind(mainModShift .. " + comma", hl.dsp.window.move({ workspace = "-1" }))
hl.bind(mainModShift .. " + period", hl.dsp.window.move({ workspace = "+1" }))
hl.bind(mainModShift .. " + left", hl.dsp.window.move({ workspace = "-1" }))
hl.bind(mainModShift .. " + right", hl.dsp.window.move({ workspace = "+1" }))
hl.bind(mainMod .. " + less", hl.dsp.window.move({ workspace = "-1" }))
hl.bind(mainMod .. " + greater", hl.dsp.window.move({ workspace = "+1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Example special workspace (scratchpad)
--hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
--hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Laptop multimedia keys for volume and LCD brightness
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMicMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 2%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 4%-"), { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
