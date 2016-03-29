-- Imports.
import XMonad
import XMonad.Hooks.DynamicLog
import Graphics.X11.ExtraTypes.XF86  
import XMonad.Util.EZConfig  
import Data.Monoid
import System.Exit

-- The main function.
main = xmonad =<< statusBar myBar myPP toggleStrutsKey myConfig

-- Command to launch the bar.
myBar = "xmobar"

-- Custom PP, configure it as you like. It determines what is being written to the bar.
myPP = xmobarPP { ppCurrent = xmobarColor "#429942" "" . wrap "<" ">" }

-- Key binding to toggle the gap for the bar.
toggleStrutsKey XConfig {XMonad.modMask = modMask} = (modMask, xK_b)

-- Main configuration, override the defaults to your liking.
myConfig = defaultConfig {
  terminal    = "urxvt"
  , modMask     = mod4Mask
  , borderWidth = 1
}
        `additionalKeysP`
        [("<XF86MonBrightnessUp>", spawn "xbacklight +1")
        ,("<XF86MonBrightnessDown>", spawn "xbacklight -1")
        ,("<XF86AudioRaiseVolume>", spawn "amixer set Master 1+ unmute")
        ,("<XF86AudioLowerVolume>", spawn "amixer set Master 1- unmute")
        ,("<XF86AudioMute>", spawn "amixer set Master toggle")
        ]
