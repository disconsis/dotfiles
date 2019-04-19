module Polybar ( MouseButton(..)
               , Formatting(..)
               , polybarFormat
               , polybarInit
               , polybarDbusOutput
               , polybarPP
               ) where

import qualified Codec.Binary.UTF8.String as UTF8
import qualified DBus
import qualified DBus.Client as DBus
import           Data.Char
import           Data.Maybe (fromJust)
import           Data.Tuple (swap)
import           Text.Printf
import           XMonad (spawn)
import           XMonad.Hooks.DynamicLog

-- | Mouse buttons for polybar.
data MouseButton
  = LeftClick
  | MiddleClick
  | RightClick
  | ScrollUp
  | ScrollDown
  | DoubleLeftClick
  | DoubleMiddleClick
  | DoubleRightClick
  deriving (Eq, Ord, Show, Enum)

-- | Formatting options for polybar.
data Formatting
  = Foreground String
  | Background String
  | Reverse
  | Underline String
  | Overline String
  | Font Int
  | Offset Int
  | Action MouseButton String
  deriving (Eq, Show)

trim :: String -> String
trim = reverse . dropWhile isSpace . reverse . dropWhile isSpace

-- | Implementation of [[polybar formatting rules][https://github.com/jaagr/polybar/wiki/Formatting]].
polybarFormat :: [Formatting] -> String -> String
polybarFormat fmt = foldr (.) id (fmap fmtSingle fmt)
  where
    fmtSingle :: Formatting -> String -> String
    fmtSingle (Foreground color) = wrap (printf "%%{F%s}" color) "%{F-}"
    fmtSingle (Background color) = wrap (printf "%%{B%s}" color) "%{B-}"
    fmtSingle Reverse = wrap "%{R}" "%{R}"
    fmtSingle (Underline color) = wrap (printf "%%{u%s}%%{+u}" color) "%{-u}"
    fmtSingle (Overline color) = wrap (printf "%%{o%s}%%{+u}" color) "%{-o}"
    fmtSingle (Font index) = wrap (printf "%%{T%d}" index) "%{T-}"
    fmtSingle (Offset size) = (printf "%%{O%d}" size ++)
    fmtSingle (Action button command) =
      wrap (printf "%%{A%d:%s:}" (fromEnum button + 1) command) "%{A}"

-- | Setup a dbus client for polybar.
polybarInit :: IO DBus.Client
polybarInit = do
  spawn "~/.config/polybar/launch.sh"
  dbus <- DBus.connectSession
  DBus.requestName dbus (DBus.busName_ "org.xmonad.log")
    [ DBus.nameAllowReplacement
    , DBus.nameReplaceExisting
    , DBus.nameDoNotQueue
    ]
  return dbus

-- | Emit a DBus signal on log updates.
polybarDbusOutput :: DBus.Client -> String -> IO ()
polybarDbusOutput client str = do
    let signal = (DBus.signal objectPath interfaceName memberName)
                 { DBus.signalBody = [DBus.toVariant $ UTF8.decodeString str] }
    DBus.emit client signal
  where
    objectPath = DBus.objectPath_ "/org/xmonad/Log"
    interfaceName = DBus.interfaceName_ "org.xmonad.Log"
    memberName = DBus.memberName_ "Update"

polybarPP :: DBus.Client -> PP -> PP
polybarPP client pp = pp { ppOutput = polybarDbusOutput client }
