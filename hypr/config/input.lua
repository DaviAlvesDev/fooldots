hl.config({
    input = {
        kb_layout  = "br",
        kb_variant = "",
        kb_model   = "abnt2",
        kb_options = "caps:escape",
        kb_rules   = "",

        follow_mouse = 1,

        sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.

        touchpad = {
            natural_scroll = true,
	    tap_to_click = false,
	    clickfinger_behavior = true,
        },
    },
})

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace"
})

