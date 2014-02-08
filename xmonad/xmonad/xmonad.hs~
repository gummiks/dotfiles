import XMonad --
import XMonad.Hooks.DynamicLog --
import XMonad.Hooks.ManageDocks --
import XMonad.Util.Run(spawnPipe) --
import XMonad.Util.EZConfig(additionalKeys) --
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.SetWMName -- For Java GUI
import XMonad.Config.Desktop
import XMonad.Layout.NoBorders
import XMonad.Layout.PerWorkspace
import XMonad.Util.Loggers -- for battery
import System.IO --
import XMonad.Actions.PhysicalScreens

-- initially created with help of: http://www.haskell.org/haskellwiki/Xmonad/Config_archive/John_Goerzen%27s_Configuration
-- use "xmonad --recompile" to check it's syntactically correct if making changes (better than just modQ)
    -- list of key codes http://haskell.org/haskellwiki/Xmonad/Key_codes
    -- may also prove useful for some keys and commands http://hackage.haskell.org/packages/archive/X11/1.4.5/doc/html/Graphics-X11-Types.html
        -- may want to encorporate: http://xmonad.org/xmonad-docs/xmonad-contrib/XMonad-Actions-GridSelect.html
myManageHook = composeAll
    [ className =? "Gimp"      --> doFloat --flot gimp
    , className =? "pidgin"    --> doFloat
    , className =? "skype"     --> doFloat
    , className =? "vlc"       --> doFloat
    , className =? "tilda"     --> doFloat
    , className =? "Vncviewer" --> doFloat
    , className =? "/usr/local/MATLAB/R2012a/bin/matlab" --> doFloat
    ]


--myLayout = tiled ||| Mirror tiled ||| Full
--where
    -- default tiling algorithm partitions the screen into two panes
    --


-- Defining Names of Workspaces
myWorkspaces = ["1W","2L","3S","4P","5X","6M"]

main = do
    xmproc <- spawnPipe "/usr/bin/xmobar /home/gks/.xmobarrc"
    --xmproc <- spawnPipe "/usr/bin/tint2 /home/gks/.config/tint2/tint2rc"
    xmonad $ ewmh desktopConfig -- Could be defaultConfig?
        { manageHook = manageDocks <+> myManageHook -- make sure to include myManageHook definition from above
                        <+> manageHook desktopConfig -- For Statusbar
        , layoutHook = avoidStruts  $  layoutHook defaultConfig -- For statusbar
	, startupHook = setWMName "LG3D" -- For MATLAB and other Java GUI
	, logHook = dynamicLogWithPP xmobarPP --create a logHook
			{ ppOutput = hPutStrLn xmproc --Piping to xmobar
			, ppTitle = xmobarColor "green" "" . shorten 50 --put the first 50 characters of the window title in the title area
			, ppExtras = [ battery ]
			}
	, terminal = "urxvt" -- Gks
	, workspaces = myWorkspaces
        , modMask = mod4Mask     -- Rebind Mod to the Windows key GKS
        } `additionalKeys`
        [ ((mod4Mask, xK_F2), spawn "gmrun")
        , ((mod4Mask, xK_F3), spawn "asus-kbd-backlight down") 
        , ((mod4Mask, xK_F4), spawn "asus-kbd-backlight up") 
        , ((mod4Mask, xK_F5), spawn "asus-screen-brightness down") 
        , ((mod4Mask, xK_F6), spawn "asus-screen-brightness up") 
        , ((mod4Mask, xK_F7), spawn "asus-screen-brightness night") 
        , ((mod4Mask, xK_F9), spawn "xkill")
        , ((mod4Mask, xK_F10), spawn "amixer -q set Master toggle") --for playback control
        , ((mod4Mask, xK_F11), spawn "amixer -q set Master 3-")
        , ((mod4Mask, xK_F12), spawn "amixer -q set Master 3+ unmute")
        , ((mod4Mask, xK_b), spawn "google-chrome")
        , ((mod4Mask, xK_f), spawn "spacefm")
        , ((mod4Mask, xK_g), spawn "gimp")
        , ((mod4Mask, xK_d), spawn "darktable")
        , ((mod4Mask, xK_m), spawn "vlc")
        , ((mod4Mask, xK_n), sendMessage ToggleStruts) -- toggle panel visability.
        , ((mod4Mask .|. controlMask .|. mod1Mask, xK_n), spawn "gedit ~/.config/tint2/tint2rc") -- edit panel config
        , ((mod4Mask .|. mod1Mask, xK_n), spawn "pkill tint2 && tint2") -- restart panel.
        , ((mod4Mask, xK_q), spawn "xmonad --restart")
        , ((0, xK_Print), spawn "scrot '%Y-%m-%d--%s_$wx$h_scrot.png' -e 'mv $f ~/images/screenshots/ &amp; gpicview ~/images/screenshots/$f'")
        ]
