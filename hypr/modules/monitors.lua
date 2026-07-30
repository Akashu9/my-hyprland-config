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