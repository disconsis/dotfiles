{-# LANGUAGE TupleSections #-}
{-# OPTIONS_GHC -fno-warn-type-defaults #-}
{-# OPTIONS_GHC -fno-warn-missing-signatures #-}

module Main where

import           Control.Monad

import           Data.Char
import qualified Data.Map as M
import           Data.Maybe

import qualified DBus
import qualified DBus.Client as DBus

import           Graphics.X11.ExtraTypes.XF86

import           Polybar

import           System.Exit

import           Text.Printf

import           XMonad hiding ((|||))
import           XMonad.Actions.GroupNavigation
import           XMonad.Actions.RotSlaves
import           XMonad.Actions.SpawnOn
import           XMonad.Actions.WorkspaceNames
import           XMonad.Hooks.DynamicLog
import           XMonad.Hooks.DynamicProperty
import           XMonad.Hooks.EwmhDesktops
import           XMonad.Hooks.ManageDocks
import           XMonad.Hooks.ManageHelpers
import           XMonad.Prompt.Workspace
-- import           XMonad.Layout.Fullscreen hiding (fullscreenEventHook)
import           XMonad.Layout.LayoutCombinators
import           XMonad.Layout.NoBorders
import           XMonad.Layout.PerWorkspace
import           XMonad.Layout.Renamed
import           XMonad.Layout.Spacing
import           XMonad.Layout.Tabbed
import           XMonad.Layout.TwoPane
import           XMonad.Prompt
import qualified XMonad.StackSet as W
-- import XMonad.Layout.MultiToggle
import           XMonad.Util.Cursor
import           XMonad.Util.SpawnOnce

-- * TODO
-- add to .dotfiles
-- set up workspace contexts (sets of workspaces for a particular purpose) [DynamicWorkspaceGroups?]
-- handle layout + keybind reload on restart
-- per layout keys (or some way to reuse them)
-- subkeys
-- command to start all communication windows (and spotify?) [Prompt]
-- change composeAll to composeOne where possible
-- move windows from comms and music when they don't fit the bill
-- fullscreen:
---- toggle
---- fit bounded
---- correct sized fullscreen (no partial view)

-- * Check out
-- X.A.Commands
-- X.L.MultiToggle

-- * Keys
-- Overridables:
-- mod + shift + p
-- mod + shift + tab
-- mod + n
-- mod (+ shift) + {w,e,r}
-- mod + shift + /

myKeys :: XConfig Layout -> M.Map (KeyMask, KeySym) (X ())
myKeys conf@(XConfig {XMonad.modMask = modMask}) = M.fromList $
    -- launching and killing programs
    [ ((modMask .|. shiftMask, xK_Return), spawnHere $ XMonad.terminal conf)
    , ((modMask              , xK_q     ), kill)

    -- function keys
    --- volume
    , ((0      , xF86XK_AudioLowerVolume), spawn "pamixer --allow-boost --decrease 5")
    , ((0      , xF86XK_AudioRaiseVolume), spawn "[ $(pamixer --get-volume) -le 145 ] && pamixer --allow-boost --increase 5")
    , ((0      , xF86XK_AudioMute       ), spawn "pamixer --toggle-mute")
    --- brightness
    , ((0      , xF86XK_AudioNext       ), spawn "sudo brightnessctl -d intel_backlight set 2%+")
    , ((0      , xF86XK_AudioPrev       ), spawn "sudo brightnessctl -d intel_backlight set 2%-")
    , ((0      , xF86XK_AudioPlay       ), spawn "sudo brightnessctl -d intel_backlight set 100%")

    -- switching layouts
    , ((modMask,               xK_space ), sendMessage NextLayout)
    , ((modMask .|. shiftMask, xK_space ), setLayout $ XMonad.layoutHook conf) -- %! default layout
    , ((modMask              , xK_t)     , sendMessage $ JumpToLayout "Tabbed")
    , ((modMask              , xK_w)     , sendMessage $ JumpToLayout "Tall")
    , ((modMask              , xK_p)     , sendMessage $ JumpToLayout "TwoPane")

    , ((modMask,               xK_n     ), refresh) -- %! Resize viewed windows to the correct size

    -- move focus
    , ((modMask,               xK_Tab   ), nextMatch History (return True))
    , ((modMask,               xK_j     ), windows W.focusDown)
    , ((modMask,               xK_k     ), windows W.focusUp  )
    , ((modMask,               xK_m     ), windows W.focusMaster)

    -- workspaces naming
    , ((modMask,               xK_r     ), renameWorkspaceWithShorten myWorkspaceNamePrompt myWorkspaceIcons)
    , ((modMask .|. controlMask, xK_r   ), forM_ (flip setWorkspaceName "") myWorkspaces)
    , ((modMask .|. shiftMask, xK_r     ), setCurrentWorkspaceName "")

    --- TwoPane
    , ((modMask,               xK_s     ), rotSlavesUp)
    , ((modMask .|. shiftMask, xK_s     ), rotSlavesDown)

    --- Spacing
    -- TODO: make this work for all workspaces at once
    , ((modMask,               xK_g     ), toggleGaps)

    --- Fullscreen
    -- TODO: toggle fullscreen
    -- , ((modMask,               xK_f     ), sendMessage ToggleStruts)

    -- move windows
    , ((modMask,               xK_Return), windows W.swapMaster)
    , ((modMask .|. shiftMask, xK_j     ), windows W.swapDown  )
    , ((modMask .|. shiftMask, xK_k     ), windows W.swapUp    )

    -- resizing the master/slave ratio
    , ((modMask,               xK_h     ), sendMessage Shrink) -- %! Shrink the master area
    , ((modMask,               xK_l     ), sendMessage Expand) -- %! Expand the master area

    -- floating layer support
    , ((modMask,               xK_u     ), withFocused $ windows . W.sink)

    -- increase or decrease number of windows in the master area
    , ((modMask              , xK_comma ), sendMessage (IncMasterN 1))
    , ((modMask              , xK_period), sendMessage (IncMasterN (-1)))

    -- quit, or restart
    , ((modMask .|. shiftMask .|. controlMask, xK_e), io (exitWith ExitSuccess))
    , ((modMask              , xK_grave ), spawn "xmonad --recompile && xmonad --restart")

    ]
    ++
    -- mod-[key] %! Switch to workspace
    -- mod-shift-[key] %! Move client to workspace
    -- mod-ctrl-[key] %! Swap current workspace with new
    [((mask .|. modMask, key), func ws)
        | (ws, key) <- myWorkspacesWithGotoKeys
        , (func, mask) <- [ (windows . W.greedyView, 0)
                          , (windows . viewShift, shiftMask)
                          , (swapWithCurrent, controlMask)]]

    where
      viewShift = liftM2 (.) W.greedyView W.shift

-- * Workspaces
wsTodo  = "\xf00b"
wsConf  = "\xf992"
wsEntt  = "\xf880"
wsMusic = "\xf001"
wsComms = "\xf086"

myWorkspacesWithGotoKeys :: [(String, KeySym)]
myWorkspacesWithGotoKeys = zip workspaces keys
  where
    keys       = [xK_0..xK_9] ++ [xK_minus, xK_equal]
    workspaces = [wsTodo] ++ fmap show [1 .. 7] ++ [wsConf, wsEntt, wsMusic, wsComms]

myWorkspaces = fmap fst myWorkspacesWithGotoKeys

-- * Layouts
-- resizable tall

-- layout modifiers
-- magic focus? puts focused window in master area
-- limitwindows

data EmptyShrinker = EmptyShrinker deriving (Show, Read)

instance Shrinker EmptyShrinker where
  shrinkIt _ _ = []

named newName = renamed [Replace newName]

myTall =
    named "Tall" $
    mySpacing $
    Tall { tallNMaster        = 1
        , tallRatioIncrement = (3/100)
        , tallRatio          = (1/2)
        }

myTabbed =
    named "Tabbed" $
    tabbedLeft EmptyShrinker $
    def { decoWidth = 4, decoHeight = 4
        , activeBorderColor = myActiveTabColor, activeColor =  myActiveTabColor
        , inactiveBorderColor = myInactiveTabColor, inactiveColor = myInactiveTabColor
        }

toggleGaps = toggleScreenSpacingEnabled >> toggleWindowSpacingEnabled

myActiveTabColor = blueLight
myInactiveTabColor = greyLight

-- TODO: add right tabs to slaves
-- TODO open new windows as slaves
myTwoPane =
  named "TwoPane" $
  mySpacing $
  TwoPane (3/100) -- ^ delta
          (2/5)   -- ^ master ratio

-- TODO: implement generalized layout type to calculate max length of descriptions
-- data GenericLayout where
--   MkGenericLayout :: (LayoutClass l a, Eq a) => l a -> GenericLayout

-- myLayouts :: [GenericLayout]
-- myLayouts = [MkGenericLayout myTall, MkGenericLayout myTabbed, MkGenericLayout myTwoPane]

myLayouts = myTall ||| myTabbed ||| myTwoPane

-- TODO: max width justified layout section in bar
-- myLayoutsMaxWidth = description myLayouts

mySpacing =
  spacingRaw
    True                 -- ^ smart spacing
    (symmetricBorder 5)  -- ^ screen border
    False                -- ^ screen border enabled
    (symmetricBorder 5)  -- ^ window border
    False                -- ^ window border enabled
  where symmetricBorder n = Border n n n n

myLayoutHook =
  smartBorders $
  avoidStruts $
  -- fullScreenFloat $
  -- fullScreenToggle $
  onWorkspace wsMusic myTabbed $
  onWorkspace wsComms myTabbed $
  myLayouts

  -- where fullScreenFloat = mkToggle (single Full)

-- * Manage Hook
doShiftAndGo = doF . liftM2 (.) W.greedyView W.shift

myManageHook = composeAll $
  [ manageDocks
  , manageSpawn
  , myAppManageHooks
  , manageHook def
  ]
  where
    myAppManageHooks = composeOne $
      [ title =? "Event Tester" -?> doFloat
      , className =? "Tk"       -?> doFloat
      , className =? "albert"   -?> hasBorder False
      ]
      ++
      [ appName =? commsApp -?> doShiftAndGo wsComms |
        commsApp <- ["skype", "www.gmail.com", "web.whatsapp.com", "Hexchat"] ]

-- * Handle Event Hook
myHandleEventHook =
  dynamicPropertyChange "WM_CLASS" myDynamicClassHook
  <+> handleEventHook def

myDynamicClassHook = composeOne $
  [ className =? "Spotify" -?> doShiftAndGo wsMusic ]

-- * Colors
blueLight   = "#00aaff"
blueGreen   = "#48b8d6"
greenPure   = "#00ff00"
greenDark   = "#007700"
yellowPure  = "#ffff00"
yellowDull  = "#a6973b"
redPure     = "#ff0000"
redGrey     = "#3f3333"
redBright   = "#ff4230"
redDull     = "#8f4230"
black       = "#000000"
greyDark    = "#111111"
grey        = "#333333"
greyMedium  = "#555555"
greyLight   = "#888888"
greyLighter = "#aaaaaa"
white       = "#ffffff"

-- * Log Hook
myLogHook :: DBus.Client -> X ()
myLogHook client =
  (dynamicLogWithPP =<< myPP) <+> historyHook

  where
    myPP :: X PP
    myPP = do
      names <- getWorkspaceNames
      return $ myFormat $ polybarPP client $ def
        { ppCurrent = pad . names
        , ppHidden = gotoWithNamesFormat names
        , ppHiddenNoWindows = gotoWithNamesFormat names
        , ppVisible = gotoWithNamesFormat names
        , ppUrgent = gotoWithNamesFormat names
        }

    myFormat :: PP -> PP
    myFormat pp = pp
      { ppTitle = polybarFormat [Foreground greyLighter] . shorten 100 . ppTitle pp
      , ppCurrent = polybarFormat [Foreground redBright, Background redGrey, Underline redDull] . ppCurrent pp
      , ppHidden = polybarFormat [Background grey, Underline greyMedium] . ppHidden pp
      , ppHiddenNoWindows = polybarFormat [Foreground greyMedium] . ppHiddenNoWindows pp
      , ppVisible = polybarFormat [Background grey, Underline greyLight] . ppVisible pp
      , ppUrgent = polybarFormat [Foreground black, Background redDull, Underline redPure]
      , ppLayout = polybarFormat [Foreground yellowPure] . padRight 8 . ppLayout pp
      , ppOrder = \[ws, layout, title] -> [layout, ws, title]
      , ppWsSep = " "
      , ppSep = "  "
      , ppTitleSanitize = filter (`notElem` ['%', '{', '}'])
      }

-- | Wrap a string in a number of spaces.
space :: Int -> String -> String
space n = wrap spaces spaces
  where spaces = replicate n ' '

-- | Pad a string with spaces on the right, to fill out its width to a certain amount.
padRight :: Int -> String -> String
padRight width str = str ++ replicate (width - length str) ' '

-- | Format workspace output to go to the workspace on left click. Relies on @xdotool@. Display the name of workspace as well.
gotoWithNamesFormat :: (WorkspaceId -> String) -> WorkspaceId -> String
gotoWithNamesFormat names ws = polybarFormat [Action LeftClick (printf "xdotool set_desktop '%s'" ws)] (pad $ names ws)

-- * Prompt
myFont = "xft:Iosevka Nerd Font:pixelsize=15"

myWorkspaceNamePrompt :: XPConfig
myWorkspaceNamePrompt = def
  { font = myFont
  , height = 26
  , position = CenteredAt { xpCenterY = 0.989, xpWidth = 0.15 }
  , bgColor = white
  , fgColor = black
  , maxComplRows = Just 2
  , historySize = 5
  , autoComplete = Nothing -- manually confirm
  , showCompletionOnTab = False
  }

renameWorkspaceWithShorten :: XPConfig -> M.Map String String -> X ()
renameWorkspaceWithShorten conf shortNames =
  workspaceNamePrompt conf (setCurrentWorkspaceName . replace shorten)
  where
    replace :: (a -> Maybe a) -> a -> a
    replace f x = fromMaybe x (f x)
    shorten  :: String -> Maybe String
    shorten = flip M.lookup shortNames . fmap toLower

flatten :: [([a], b)] -> [(a, b)]
flatten = concatMap (\(as, b) -> fmap (,b) as)

myWorkspaceIcons :: M.Map String String
myWorkspaceIcons = M.fromList $ flatten $
  [ (research,   "\xe27f")
  , (grad,       "\xf973")
  , (assignment, "\xf8e1")
  ]
  where research = ["research"]
        grad = ["nyu", "grad"]
        assignment = ["assignment", "assign", "assn", "exam", "paper"]

-- * Startup Hook
myStartupHook = do
  spawnOnOnce wsTodo "while ! pgrep -xf 'emacs --daemon'; do sleep; done; emacsclient -c"
  setDefaultCursor xC_left_ptr

-- * Config
main :: IO ()
main = do
  spawn "pgrep unclutter || unclutter --timeout 3"
  polybarDbus <- polybarInit
  xmonad $ ewmh $ docks $ def
    { terminal           = "kitty tmux -2"
    , borderWidth        = 1
    , focusedBorderColor = blueLight
    , normalBorderColor  = grey
    , focusFollowsMouse  = False
    , keys               = myKeys
    , workspaces         = myWorkspaces
    , layoutHook         = myLayoutHook
    , manageHook         = myManageHook
    , logHook            = myLogHook polybarDbus
    , startupHook        = myStartupHook
    , handleEventHook    = myHandleEventHook
    }
