-----------------
--- MONITORS ----
--- -------------
hl.monitor({
	output = "DP-1",
	mode = "3440x1440@120",
	position = "0x0",
	scale = "1",
	vrr = 1,
})

hl.monitor({
	output = "eDP-1",
	mode = "1920x1200@60",
	position = "0x0",
	scale = "1",
})

hl.monitor({
	output = "",
	mode = "preferred",
	position = "auto",
	scale = "auto",
	mirror = "eDP-1",
})

-------------------
---- AUTOSTART ----
-------------------
hl.on("hyprland.start", function()
	hl.exec_cmd("hyprpaper")
	hl.exec_cmd("waybar")
	hl.exec_cmd("hypridle")
	hl.exec_cmd("/usr/lib/hyprpolkitagent/hyprpolkitagent")
end)

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("MOZ_ENABLE_WAYLAND", "1")

-----------------------
----- PERMISSIONS -----
-----------------------
hl.config({
	ecosystem = {
		enforce_permissions = true,
	},
})

hl.permission("/usr/(bin|local/bin)/grim", "screencopy", "allow")
hl.permission("/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", "screencopy", "allow")
hl.permission("/usr/(bin|local/bin)/hyprpm", "plugin", "allow")
hl.permission("/usr/(bin|local/bin)/hyprlock", "screencopy", "allow")

-----------------------
---- LOOK AND FEEL ----
-----------------------
hl.config({
	general = {
		gaps_in = 0,
		gaps_out = 0,

		border_size = 2,

		col = {
			active_border = { colors = { "rgb(aaaaaa)" }, angle = 45 },
			-- inactive_border = "rgba(595959aa)",
		},

		resize_on_border = false,

		allow_tearing = true,

		layout = "dwindle",
	},

	decoration = {
		rounding = 0,
		rounding_power = 0,

		active_opacity = 1.0,
		inactive_opacity = 1.0,

		shadow = {
			enabled = true,
			range = 4,
			render_power = 3,
			color = 0xee1a1a1a,
		},

		blur = {
			enabled = true,
			size = 3,
			passes = 1,
			vibrancy = 0.1696,
		},
	},

	animations = {
		enabled = true,
	},
})

hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })

hl.curve("easy", { type = "spring", mass = 1, stiffness = 238.1191, dampening = 24.21279333 })

hl.animation({ leaf = "global", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "border", enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows", enabled = true, speed = 4.79, spring = "easy" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 4.1, spring = "easy", style = "popin 87%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 1.49, bezier = "linear", style = "popin 87%" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade", enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers", enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 4, bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.5, bezier = "linear", style = "fade" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn", enabled = true, speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "zoomFactor", enabled = true, speed = 7, bezier = "quick" })

-- Ref https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/
-- "Smart gaps" / "No gaps when only"
-- uncomment all if you wish to use that.
-- hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })
-- hl.workspace_rule({ workspace = "f[1]",   gaps_out = 0, gaps_in = 0 })
-- hl.window_rule({
--     name  = "no-gaps-wtv1",
--     match = { float = false, workspace = "w[tv1]" },
--     border_size = 0,
--     rounding    = 0,
-- })
-- hl.window_rule({
--     name  = "no-gaps-f1",
--     match = { float = false, workspace = "f[1]" },
--     border_size = 0,
--     rounding    = 0,
-- })

hl.config({
	dwindle = {
		preserve_split = true,
	},
})

hl.config({
	master = {
		new_status = "master",
	},
})

hl.config({
	scrolling = {
		fullscreen_on_one_column = true,
	},
})

----------------
----  MISC  ----
----------------
hl.config({
	misc = {
		force_default_wallpaper = 0,
		disable_hyprland_logo = true,
		disable_splash_rendering = true,
		key_press_enables_dpms = true,
	},
})

---------------
---- INPUT ----
---------------
hl.config({
	input = {
		kb_layout = "pl",
		kb_variant = "",
		kb_model = "",
		kb_options = "",
		kb_rules = "",
		numlock_by_default = true,

		follow_mouse = 1,

		--force_no_accel = true,
		sensitivity = 0,
		accel_profile = "flat",

		touchpad = {
			natural_scroll = true,
			disable_while_typing = false,
		},
	},
})

hl.device({
	name = "logitech-g305-1",
	sensitivity = 0,
	accel_profile = "flat",
})

hl.device({
	name = "gxtp5100:00-27c6:01e0-touchpad",
	sensitivity = 1,
	accel_profile = "flat",
})

hl.gesture({
	fingers = 3,
	direction = "horizontal",
	action = "workspace",
})

hl.gesture({
	fingers = 4,
	direction = "horizontal",
	action = "move",
})

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
--hl.bind(mainMod .. "+ ", hl.dsp.exec_cmd(""))
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

--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------
hl.window_rule({
	-- Ignore maximize requests from all apps. You'll probably like this.
	name = "suppress-maximize-events",
	match = { class = ".*" },

	suppress_event = "maximize",
})

hl.window_rule({
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},

	no_focus = true,
})

-- Layer rules also return a handle.
-- local overlayLayerRule = hl.layer_rule({
--     name  = "no-anim-overlay",
--     match = { namespace = "^my-overlay$" },
--     no_anim = true,
-- })

-- Hyprland-run windowrule
hl.window_rule({
	name = "move-hyprland-run",
	match = { class = "hyprland-run" },

	move = "20 monitor_h-120",
	float = true,
})
--onScreenKeyBoard
hl.layer_rule({
	name = "wvkbd_above_lock",
	match = { namespace = "^wvkbd$" },
	above_lock = 2,
})