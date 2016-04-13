import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Util.EZConfig
import XMonad.Hooks.FadeInactive
import XMonad.Util.WorkspaceCompare
import XMonad.Layout.LayoutHints
import Data.Ratio

main :: IO ()
main = xmonad =<< statusBar "xmobar" myPP toggleStrutsKey myConfig
  where
    myPP = xmobarPP { ppCurrent = xmobarColor "green" ""
                , ppTitle   = xmobarColor "green"  "" . shorten 60
                , ppVisible = xmobarColor "yellow" ""
                , ppSort    = getSortByXineramaPhysicalRule
                , ppWsSep   = ""
                , ppSep     = ""
                , ppLayout  = xmobarColor "white" "" .
                              (\ x -> case x of "Tall"        -> "│├┤"
                                                "Mirror Tall" -> "├┬┤"
                                                "Full"        -> "│ │"
                                                _             -> x
                              )
                }
    toggleStrutsKey XConfig {XMonad.modMask = modMask} = (modMask, xK_b)
    myConfig = def
           { terminal    = "urxvtc"
           , modMask     = mod4Mask
           , borderWidth = 1
           , normalBorderColor = "#000"
           , focusedBorderColor = "#FF0"
           , logHook = myLogHook
           , layoutHook = myLayout
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
    myLogHook = fadeInactiveLogHook fadeAmount
      where fadeAmount = 0.82222

    myLayout = layoutHintsToCenter (Tall 1 (3/100) (1/2))
