import XMonad hiding ((|||))

import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks

import XMonad.Layout.LayoutCombinators
import XMonad.Layout.Tabbed
import XMonad.Layout.NoBorders
import XMonad.Layout.MultiToggle
import XMonad.Layout.MultiToggle.Instances

import XMonad.Actions.CopyWindow
import XMonad.Actions.GridSelect
import XMonad.Actions.GroupNavigation

import XMonad.Util.Run
import XMonad.Util.EZConfig

import System.Exit
import Text.Printf

-- basic config
myTerminal          = "kitty tmux"
myModMask           = mod1Mask
myFocusFollowsMouse = False
myBorderWidth       = 2
myClickJustFocuses  = False
myWorkspaces        = ["1:todo"] ++ fmap show [2..8] ++ ["9:music"]

myVolumeStep :: Word
myVolumeStep     = 5
myBrightnessStep :: Word
myBrightnessStep = 10

-- layouts
tall :: Tall a
tall = Tall
        1           -- windows in master window
        (2/100)     -- resize delta
        (1/2)       -- master area : screen area

myLayout =
  avoidStruts $ smartBorders $
    mkToggle (single FULL) $
      tall ||| simpleTabbed

-- keys
myUnusedKeys :: [(KeyMask, KeySym)]
myUnusedKeys =
    [ (myModMask .|. shiftMask, xK_c)
    , (myModMask, xK_p)
    , (myModMask, xK_q)
    , (myModMask .|. shiftMask, xK_q)
    , (myModMask, xK_Tab)
    ]

myKeys :: [((KeyMask, KeySym), X ())]
myKeys =
    [ ((myModMask, xK_f), sendMessage (Toggle FULL)) -- TODO: make fullscreen videos respect bar (avoid that space)
    , ((myModMask, xK_d), spawn "rofi -show run")
    , ((myModMask .|. shiftMask, xK_z), spawn "pkill xmobar; xmonad --recompile && xmonad --restart")
    , ((myModMask .|. shiftMask .|. controlMask, xK_grave), io exitSuccess)
    , ((myModMask, xK_Tab), nextMatch History (return True))
    -- copies
    , ((myModMask, xK_p), windows copyToAll)    -- persist
    , ((myModMask, xK_q), kill1)                -- kill the frame on just this workspace
    , ((myModMask, xK_o), killAllOtherCopies)   -- only
    , ((myModMask, xK_g), goToSelected def)
    -- function keys
    , ((0, xK_F5), spawn (printf "/usr/bin/brightnessctl set -%u%%" myBrightnessStep))
    , ((0, xK_F6), spawn (printf "/usr/bin/brightnessctl set +%u%%" myBrightnessStep))

    , ((0, xK_F9), spawn "/home/ketan/.config/i3blocks/scripts/mouse toggle")

    , ((0, xK_F10), spawn "/usr/bin/amixer -D pulse sset Master toggle")
    , ((0, xK_F11), spawn (printf "/usr/bin/amixer -D pulse sset Master %u%%-" myVolumeStep))
    , ((0, xK_F12), spawn (printf "/usr/bin/amixer -D pulse sset Master %u%%+" myVolumeStep))
    ]
    ++
    [((myModMask .|. shiftMask .|. controlMask, key), windows (copy ws))
      | (ws, key) <- zip myWorkspaces [xK_1..]]

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
                               <+> historyHook
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

-- TODO:
-- resize non-master windows (similarly, layouts for subset of windows)
-- change font in tabbed
-- polybar instead of xmobar

-- check out:
---- Monitor
---- Grid
---- SubLayout
---- Magnifier

-- vim:cc=:tw=0
