----------------
----SETTINGS----
----------------

hl.config({
    general = {
        gaps_in = 3,
        gaps_out = 6,
        
        border_size = 1,
        resize_on_border = false,

        col = {
            active_border = { colors = {"rgba(33ccffee)", "rgba(00ff99ee)"}, angle = 45},
            inactive_border = "rgba(595959aa)",
        },
    },

    scrolling = {
        fullscreen_on_one_column = true,
    },  


    decoration = {
        rounding = 10,
        rounding_power = 2,

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

----------------
----PROGRAMS----
----------------

local terminal = "kitty"
local file_manager = "dolphin"
local browser = "firefox"
local app_launcher = "rofi -show run"
local music_player = "playhead"
local bluetooth_manager = "blueman-manager"
local clipboard_manager = "cliphist list | rofi -dmenu -display-columns 2 | cliphist decode | wl-copy"

----------------
----BINDINGS----
----------------

local mainMod = "SUPER"
local Shift   = " + SHIFT"

hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(file_manager))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(app_launcher))
hl.bind(mainMod .. " + F", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd(clipboard_manager))

hl.bind(mainMod .. " + C", hl.dsp.window.close())
hl.bind(mainMod .. " + J", hl.dsp.layout("move -col"))
hl.bind(mainMod .. " + K", hl.dsp.layout("move +col"))
hl.bind(mainMod .. Shift .. " + J", hl.dsp.layout("swapcol l"))
hl.bind(mainMod .. Shift .. " + K", hl.dsp.layout("swapcol r"))
hl.bind(mainMod .. " + P", hl.dsp.layout("promote"))
hl.bind(mainMod .. " + O", hl.dsp.layout("colresize 1.0"))


hl.bind(
    mainMod .. " + M", 
    hl.dsp.exec_cmd("hyprshutdown")
)
hl.bind(
    mainMod .. " + B",
    hl.dsp.exec_cmd("hyprshutdown --post-cmd reboot")
)
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

for i = 1, 10 do
    local key = i % 10
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

----------------
----MONITORS----
----------------

hl.monitor({
    output = "",
    mode = "preferred",
    position = "auto",
    scale = "auto",
})

----------------
-----INPUTS-----
----------------

hl.config({
    input = {
        kb_layout  = "br",
        kb_variant = "",
        kb_model   = "abnt2",
        kb_options = "caps:escape",
        kb_rules   = "",

        follow_mouse = 1,

        sensitivity = 0, 

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

----------------
-----LAYOUT-----
----------------

hl.config({
    general = {
        layout = "scrolling",
    },

    scrolling = {
        direction = "right",
        fullscreen_on_one_column = true,
        column_width = 0.5, 
        follow_focus = true, 
        focus_fit_method = 1,
        wrap_focus = true,
        wrap_swapcol = true,
    }
})

---------------
----STARTUP----
---------------

hl.on("hyprland.start", function () 

    -- Proton Drive secrets management
    hl.exec_cmd("/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1")
    hl.exec_cmd("gnome-keyring-daemon --start --components=secrets")

    -- Wallpaper
    hl.exec_cmd("swaybg -i /home/laub/Images/walls/klein-1.png -m fill")

    -- Waybar
    hl.exec_cmd("waybar")
    
    -- Clipboard
    hl.exec_cmd("wl-paste --watch cliphist store")

end)

----------------
---ANIMATIONS---
----------------

-- Default curves and animations, see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/
hl.curve("easeOutQuint",   { type = "bezier", points = { {0.23, 1},    {0.32, 1}    } })
hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1}    } })
hl.curve("linear",         { type = "bezier", points = { {0, 0},       {1, 1}       } })
hl.curve("almostLinear",   { type = "bezier", points = { {0.5, 0.5},   {0.75, 1}    } })
hl.curve("quick",          { type = "bezier", points = { {0.15, 0},    {0.1, 1}     } })

-- Default springs
hl.curve("easy",           { type = "spring", mass = 1, stiffness = 238.1191, dampening = 24.21279333 })

hl.animation({ leaf = "global",        enabled = true,  speed = 10,   bezier = "default" })
hl.animation({ leaf = "border",        enabled = true,  speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows",       enabled = true,  speed = 4.79, spring = "easy" })
hl.animation({ leaf = "windowsIn",     enabled = true,  speed = 4.1,  spring = "easy",         style = "popin 87%" })
hl.animation({ leaf = "windowsOut",    enabled = true,  speed = 1.49, bezier = "linear",       style = "popin 87%" })
hl.animation({ leaf = "fadeIn",        enabled = true,  speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut",       enabled = true,  speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade",          enabled = true,  speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers",        enabled = true,  speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn",      enabled = true,  speed = 4,    bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut",     enabled = true,  speed = 1.5,  bezier = "linear",       style = "fade" })
hl.animation({ leaf = "fadeLayersIn",  enabled = true,  speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true,  speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces",    enabled = true,  speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn",  enabled = true,  speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true,  speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "zoomFactor",    enabled = true,  speed = 7,    bezier = "quick" })


