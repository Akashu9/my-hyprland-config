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