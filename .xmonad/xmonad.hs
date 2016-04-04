-- Imports.
import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Util.EZConfig
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
myConfig = defaultConfig
  { terminal    = "urxvt"
  , modMask     = mod4Mask
  , borderWidth = 0
  , logHook = myLogHook
  } `additionalKeysP`
  [ ((mod4Mask .|. shiftMask, xK_z), spawn "xscreensaver-command -lock")
  , ("<XF86MonBrightnessUp>", spawn "xbacklight +5")
  , ("<XF86MonBrightnessDown>", spawn "xbacklight -5")
  , ("<XF86AudioRaiseVolume>", spawn "amixer set Master 2+ unmute")
  , ("<XF86AudioLowerVolume>", spawn "amixer set Master 2- unmute")
  , ("<XF86AudioMute>", spawn "amixer set Master toggle")
  ]

myLogHook :: X ()
myLogHook = fadeInactiveLogHook fadeAmount
    where fadeAmount = 0.8
