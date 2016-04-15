import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.FadeInactive
import XMonad.Layout.NoBorders
import XMonad.Layout.Spacing
import XMonad.Util.EZConfig
import XMonad.Layout.BinarySpacePartition
import qualified XMonad.StackSet as W

main :: IO ()
main = xmonad =<< statusBar "xmobar" myPP toggleStrutsKey myConfig where
  myPP = xmobarPP {
    ppCurrent = xmobarColor "green"  ""
  , ppTitle   = xmobarColor "green"  "" . shorten 60
  , ppVisible = xmobarColor "yellow" ""
  -- , ppSort    = getSortByXineramaPhysicalRule
  , ppWsSep   = ""
  , ppSep     = " "
  , ppLayout  = xmobarColor "white" "" . (\ x -> case () of
    _ | x == "SmartSpacingWithEdge " ++ end        -> "│├┤"
      | x == "Mirror SmartSpacingWithEdge " ++ end -> "├┬┤"
      | x == "Full"                                -> "│ │"
      | otherwise -> x
      where end = show mySpacing ++ " Mastered Grid"
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
          `additionalKeysP` [
            ("M-c"                    , windows W.focusUp)
          , ("M-t"                    , windows W.focusDown)
          , ("M-h"                    , windows W.focusUp)
          , ("M-n"                    , windows W.focusDown)
          , ("M-C-h"                 , sendMessage $ ExpandTowards L)
          , ("M-C-n"                 , sendMessage $ ShrinkFrom L)
          , ("M-C-c"                 , sendMessage $ ExpandTowards U)
          , ("M-C-t"                 , sendMessage $ ShrinkFrom U)
          , ("M-M1-h"                  , sendMessage $ ShrinkFrom R)
          , ("M-M1-n"                  , sendMessage $ ExpandTowards R)
          , ("M-M1-c"                  , sendMessage $ ShrinkFrom D)
          , ("M-M1-t"                  , sendMessage $ ExpandTowards D)
          , ("M-s"                    , sendMessage $ Swap)
          , ("M-M1-s"                 , sendMessage $ Rotate)
          , ("M-S-z"                  , spawn "xscreensaver-command -lock"   )
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
  -- myLayout = layoutHintsWithPlacement (1/2,1/2) $ smartBorders myLayouts
  myLayout = bsp ||| full
    where
      -- myLayouts    = spaced emptyBSP ||| masteredGrid ||| Mirror masteredGrid ||| full
      -- masteredGrid = spaced $ mastered delta ratio Grid
      bsp          = smartBorders $ smartSpacingWithEdge mySpacing emptyBSP
      full         = noBorders Full
      -- tabs         = borders simpleTabbedBottom
      -- masters      = 1
      -- ratio        = 1%2
      -- delta        = 1%12
  mySpacing = 2
