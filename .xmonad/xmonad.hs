import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Util.EZConfig
import XMonad.Hooks.FadeInactive
import XMonad.Util.WorkspaceCompare

main :: IO ()
main = xmonad =<< statusBar "xmobar" myPP toggleStrutsKey myConfig
  
myPP = xmobarPP { ppCurrent = xmobarColor "green" ""
                , ppTitle   = xmobarColor "green"  "" . shorten 120
                , ppVisible = xmobarColor "yellow" ""
                , ppSort    = getSortByXineramaPhysicalRule
                , ppWsSep   = "" 
                , ppSep     = " "
                , ppLayout   = xmobarColor "white" "" .
                               (\ x -> case x of "Tall"        -> "│├─"
                                                 "Mirror Tall" -> "└┬┘"
                                                 "Full"        -> "│ │"
                                                 _             -> x
                               )
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
             
           , ("XF86AudioPlay",           spawn "ncmpcpp toggle")
           , ("<XF86AudioMute>",         spawn "pamixer --toggle-mute")
           , ("<XF86AudioLowerVolume>",  spawn "pamixer --decrease 2 --unmute")
           , ("<XF86AudioRaiseVolume>",  spawn "pamixer --increase 2 --unmute")
           , ("<XF86MonBrightnessUp>",   spawn "xbacklight +5")
           , ("<XF86MonBrightnessDown>", spawn "xbacklight -5")
           ]

myLogHook :: X ()
myLogHook = fadeInactiveLogHook fadeAmount
    where fadeAmount = 0.9
