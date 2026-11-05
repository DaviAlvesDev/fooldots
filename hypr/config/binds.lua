require("config.programs")

local mainMod = "SUPER"

hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(file_manager))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(app_launcher))
hl.bind(mainMod .. " + F", hl.dsp.exec_cmd(browser))

hl.bind(mainMod .. " + C", hl.dsp.window.close())
hl.bind(mainMod .. " + J", hl.dsp.layout("move -col"))
hl.bind(mainMod .. " + K", hl.dsp.layout("move +col"))
hl.bind(mainMod .. " + P", hl.dsp.layout("promote"))

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
