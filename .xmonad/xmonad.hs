import Data.Ratio ((%))
import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.FadeInactive
import XMonad.Layout.NoBorders
import XMonad.Util.EZConfig
import XMonad.Util.WorkspaceCompare
import XMonad.Layout.Spacing
import XMonad.Layout.Master
import XMonad.Layout.Grid
-- import XMonad.Layout.Tabbed

main :: IO ()
main = xmonad =<< statusBar "xmobar" myPP toggleStrutsKey myConfig
  where
    myPP = xmobarPP {
      ppCurrent = xmobarColor "green" ""
    , ppTitle   = xmobarColor "green"  "" . shorten 60
    , ppVisible = xmobarColor "yellow" ""
    , ppSort    = getSortByXineramaPhysicalRule
    , ppWsSep   = ""
    , ppSep     = ""
    , ppLayout  = xmobarColor "white" "" . (\ x -> case x of
        "SmartSpacingWithEdge 2 Mastered Grid"        -> "│├┤"
        "Mirror SmartSpacingWithEdge 2 Mastered Grid" -> "├┬┤"
        "Full"                                        -> "│ │"
        _                                             -> x
      )
    }
    toggleStrutsKey XConfig {XMonad.modMask = modMask} = (modMask, xK_b)
    myConfig = def
           { terminal    = "urxvtc"
           , modMask     = mod4Mask
           , borderWidth = 0
           , normalBorderColor = "#000"
           , focusedBorderColor = "#FFF"
           , logHook = myLogHook
           , layoutHook = myLayout
           }
           `additionalKeysP`
           [ ("M-S-z"                  , spawn "xscreensaver-command -lock"   )
           , ("<XF86AudioPlay>"        , spawn "ncmpcpp toggle"               )
           , ("<XF86AudioMute>"        , spawn "pamixer --toggle-mute"        )
           , ("<XF86AudioLowerVolume>" , spawn "pamixer --decrease 2 --unmute")
           , ("<XF86AudioRaiseVolume>" , spawn "pamixer --increase 2 --unmute")
           , ("<XF86MonBrightnessUp>"  , spawn "xbacklight +5"                )
           , ("<XF86MonBrightnessDown>", spawn "xbacklight -5"                )
           -- , ("M-a"                    , sendMessage MirrorShrink             )
           -- , ("M-;"                    , sendMessage MirrorExpand             )
           ]
    myLogHook = fadeInactiveLogHook fadeAmount
      where fadeAmount = 0.9
    myLayout = smartBorders $ masteredGrid ||| Mirror masteredGrid ||| full
      where
        masteredGrid = spaced $ mastered delta ratio Grid
        full         = noBorders Full
        -- tabs         = borders simpleTabbedBottom
        spaced       = smartSpacingWithEdge 2
        -- masters      = 1
        ratio        = 1%2
        delta        = 1%12
