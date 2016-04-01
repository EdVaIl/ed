-- Imports.
import XMonad
import XMonad.Hooks.DynamicLog
import Graphics.X11.ExtraTypes.XF86  
import XMonad.Util.EZConfig  
import Data.Monoid
import System.Exit
import XMonad.Hooks.FadeInactive

-- The main function.
main = xmonad =<< statusBar myBar myPP toggleStrutsKey myConfig

-- Command to launch the bar.
myBar = "xmobar"

-- Custom PP, configure it as you like. It determines what is being written to the bar.
myPP = xmobarPP

-- Key binding to toggle the gap for the bar.
toggleStrutsKey XConfig {XMonad.modMask = modMask} = (modMask, xK_b)

-- Main configuration, override the defaults to your liking.
myConfig = defaultConfig {
  terminal    = "urxvt"
  , modMask     = mod4Mask
  , borderWidth = 1
  , logHook = myLogHook
}
        `additionalKeysP`
        [("<XF86MonBrightnessUp>", spawn "xbacklight +1")
        ,("<XF86MonBrightnessDown>", spawn "xbacklight -1")
        ,("<XF86AudioRaiseVolume>", spawn "amixer set Master 1+ unmute")
        ,("<XF86AudioLowerVolume>", spawn "amixer set Master 1- unmute")
        ,("<XF86AudioMute>", spawn "amixer set Master toggle")
        ,((mod4Mask .|. shiftMask, xK_z), spawn "dm-tool lock")
        ]

myLogHook :: X ()
myLogHook = fadeInactiveLogHook fadeAmount
    where fadeAmount = 0.8
