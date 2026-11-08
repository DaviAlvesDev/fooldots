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

