import XMonad
import XMonad.Util.Run
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.EZConfig

myTerminal          = "kitty tmux"
myModMask           = mod1Mask
myFocusFollowsMouse = False
myBorderWidth       = 2

main :: IO ()
main = do
    xmproc <- spawnPipe "/usr/bin/xmobar /home/ketan/.config/xmobar/xmobarrc"
    xmonad $ def
       { terminal          = myTerminal
       , modMask           = myModMask
       , borderWidth       = myBorderWidth
       , focusFollowsMouse = myFocusFollowsMouse
       , logHook           = dynamicLogWithPP xmobarPP
                               { ppOutput = hPutStrLn xmproc
                               , ppTitle  = xmobarColor "green" "" . shorten 50
                               }
       , manageHook        = manageDocks <+> manageHook def
       , layoutHook        = avoidStruts $ layoutHook def
       } `additionalKeys`
       [ -- ((myModMask, xK_f), fullscreen)
       ]

-- default keybinds:
-- 
-- mod = alt
-- 
-- mod + shift + return = terminal
-- mod + j/k            = move focus
-- mod + space          = cycle through layouts { tall, wide, ... }
-- mod + ,/.            = {inc,dec}rease number of windows in master pane
-- mod + return         = swap focused window with master pane
-- mod + J/K            = swap focused window with neighbour {above,below}
-- mod + h/l            = resize ratio b/w master and subordinate areas
-- mod + mouse1         = float/drag a window
-- mod + mouse2         = bring floating window to top
-- mod + mouse3         = drag to resize a floating window
-- mod + t              = stop floating
-- mod + C              = kill window (focus moves to window below)
-- mod + Q              = quit XMonad
-- mod + p              = launch dmenu
-- mod + [1-9]          = move to workspace
-- mod + shift + [1-9]  = move window to workspace
-- 
-- TODO:
-- mod + f = toggle fullscreen for a window
-- resize non-master windows (similarly, layouts for subset of windows)
--  up polybar
-- keybind to recompile and restart
-- 
-- [[https://wiki.haskell.org/wikiupload/b/b8/Xmbindings.png][KeyBindings]]

-- showKeybindings :: [((KeyMask, KeySym), NamedAction)] -> NamedAction
-- showKeybindings x = addName "Show Keybindings" $ io $ do
--     h <- spawnPipe "zenity --text-info --font=terminus"
--     hPutStr h (unlines $ showKm x)
--     hClose h
--     return ()
