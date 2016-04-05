import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Util.EZConfig
import XMonad.Hooks.FadeInactive

main :: IO ()
main = xmonad =<< statusBar "xmobar" myPP toggleStrutsKey myConfig
  
myPP = xmobarPP { ppCurrent = xmobarColor "yellow" ""
                , ppTitle = xmobarColor "green" "" . shorten 120
                , ppSep = " | "
                }
toggleStrutsKey XConfig {XMonad.modMask = modMask} = (modMask, xK_b)

myConfig = defaultConfig
           { terminal    = "urxvt"
           , modMask     = mod4Mask
           , borderWidth = 0
           , logHook = myLogHook
           }
           `additionalKeysP`
           [ ("M-S-z",                   spawn "xscreensaver-command -lock")
           , ("<XF86MonBrightnessUp>",   spawn "xbacklight +5")
           , ("<XF86MonBrightnessDown>", spawn "xbacklight -5")
           , ("<XF86AudioRaiseVolume>",  spawn "amixer set Master 2+ unmute")
           , ("<XF86AudioLowerVolume>",  spawn "amixer set Master 2- unmute")
           , ("<XF86AudioMute>",         spawn "amixer set Master toggle")
           ]

myLogHook :: X ()
myLogHook = fadeInactiveLogHook fadeAmount
    where fadeAmount = 0.9
