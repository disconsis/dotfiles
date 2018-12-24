import XMonad hiding ((|||))
import XMonad.Util.Run
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.EZConfig
import XMonad.Layout.LayoutCombinators
import XMonad.Actions.CopyWindow
import XMonad.Actions.GridSelect
import XMonad.Layout.Tabbed
import XMonad.Layout.NoBorders
import XMonad.Layout.MultiToggle
import XMonad.Layout.MultiToggle.Instances
import System.Exit

-- basic config
myTerminal          = "kitty tmux"
myModMask           = mod1Mask
myFocusFollowsMouse = False
myBorderWidth       = 2
myClickJustFocuses  = False

-- layouts
tall :: Tall a
tall = Tall
        1           -- windows in master window
        (2/100)     -- resize delta
        (1/2)       -- master area : screen area

myLayout =
  avoidStruts $ smartBorders $
    mkToggle (NOBORDERS ?? FULL ?? EOT) $
      tall ||| Mirror tall ||| simpleTabbed ||| Full

-- keys
myUnusedKeys :: [(KeyMask, KeySym)]
myUnusedKeys =
    [ (myModMask .|. shiftMask, xK_c)
    , (myModMask, xK_p)
    , (myModMask, xK_q)
    , (myModMask .|. shiftMask, xK_q)
    ]

myKeys :: [((KeyMask, KeySym), X ())]
myKeys =
    [ ((myModMask, xK_f), sendMessage (Toggle FULL) >> sendMessage (Toggle NOBORDERS)) -- FIXME
    , ((myModMask, xK_d), spawn "rofi -show run")
    , ((myModMask .|. shiftMask, xK_z), spawn "pkill xmobar; xmonad --recompile && xmonad --restart")
    , ((myModMask .|. shiftMask .|. controlMask, xK_grave), io exitSuccess)
    -- copies
    , ((myModMask, xK_p), windows copyToAll)    -- persist
    , ((myModMask, xK_q), kill1)                -- kill the frame on just this workspace
    -- , ((myModMask, xK_o), killAllOtherCopies)   -- only
    , ((myModMask, xK_g), goToSelected def)
    ]
    ++
    [((myModMask .|. shiftMask .|. controlMask, key), windows (copy ws))
      | (ws, key) <- zip (workspaces def) [xK_1..]]

-- final config
myConfig h = def
       { terminal          = myTerminal
       , modMask           = myModMask
       , clickJustFocuses  = myClickJustFocuses
       , borderWidth       = myBorderWidth
       , focusFollowsMouse = myFocusFollowsMouse
       , logHook           = dynamicLogWithPP xmobarPP
                               { ppOutput = hPutStrLn h
                               , ppTitle  = xmobarColor "green" "" . shorten 50
                               }
       , manageHook        = manageDocks <+> manageHook def
       , layoutHook        = myLayout
       }
       `removeKeys` myUnusedKeys
       `additionalKeys` myKeys

-- start xmonad
main :: IO ()
main = do
    xmproc <- spawnPipe "/usr/bin/xmobar /home/ketan/.config/xmobar/xmobarrc"
    xmonad $ docks $ myConfig xmproc

-- default keybinds: [[https://wiki.haskell.org/wikiupload/b/b8/Xmbindings.png][KeyBindings]]
-- mod = alt
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

-- TODO:
-- mod + f = toggle fullscreen for a window
-- resize non-master windows (similarly, layouts for subset of windows)
-- alt-tab
