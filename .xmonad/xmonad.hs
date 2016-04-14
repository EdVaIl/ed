import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Util.EZConfig
import XMonad.Hooks.FadeInactive
import XMonad.Util.WorkspaceCompare
import XMonad.Layout.NoBorders

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
        "Tall"        -> "│├┤"
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
    myLayout = smartBorders (tiled ||| Mirror tiled ||| Full)
      where
        -- default tiling algorithm partitions the screen into two panes
        tiled   = Tall nmaster delta ratio

        -- The default number of windows in the master pane
        nmaster = 1

        -- Default proportion of screen occupied by master pane
        ratio   = 1/2

        -- Percent of screen to increment by when resizing panes
        delta   = 3/100
