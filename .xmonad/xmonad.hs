import           XMonad
import           XMonad.Hooks.DynamicLog
import           XMonad.Layout.BinarySpacePartition
import           XMonad.Layout.NoBorders
import           XMonad.Hooks.FadeWindows
import qualified XMonad.StackSet                    as W
import           XMonad.Util.EZConfig
import           XMonad.Config.Gnome

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
    _ | x == "BSP"  -> "│├┤"
      | x == "Full" -> "│ │"
      | otherwise -> x
    )
  }
  toggleStrutsKey XConfig {XMonad.modMask = modMask} = (modMask, xK_b)
  myConfig =  gnomeConfig
          { terminal    = "urxvtcd"
          , modMask     = mod4Mask
          , borderWidth = 1
          , normalBorderColor  = "#000"
          , focusedBorderColor = "#0FF"
          , layoutHook = myLayout
          , logHook = fadeWindowsLogHook myFadeHook
          , handleEventHook = fadeWindowsEventHook
          }
          `additionalKeysP` [
            ("<XF86AudioLowerVolume>" , spawn "pamixer --decrease 2 --unmute")
          -- , ("<XF86AudioMute>"        , spawn "pamixer --toggle-mute"        )
          -- , ("<XF86AudioPlay>"        , spawn "ncmpcpp toggle"               )
          -- , ("<XF86AudioRaiseVolume>" , spawn "pamixer --increase 2 --unmute")
          -- , ("<XF86MonBrightnessDown>", spawn "xbacklight -5"                )
          -- , ("<XF86MonBrightnessUp>"  , spawn "xbacklight +5"                )

          , ("M-h"                    , windows W.focusUp                    )
          , ("M-l"                    , windows W.focusDown                  )

          , ("M-S-h"                  , windows W.swapUp                     )
          , ("M-S-j"                  , windows W.swapDown                   )
          , ("M-S-k"                  , windows W.swapUp                     )
          , ("M-S-l"                  , windows W.swapDown                   )

          , ("M-C-h"                  , sendMessage $ ExpandTowards L        )
          , ("M-C-j"                  , sendMessage $ ShrinkFrom U           )
          , ("M-C-k"                  , sendMessage $ ExpandTowards U        )
          , ("M-C-l"                  , sendMessage $ ShrinkFrom L           )

          , ("M-M1-h"                 , sendMessage $ MoveSplit L            )
          , ("M-M1-j"                 , sendMessage $ MoveSplit D            )
          , ("M-M1-k"                 , sendMessage $ MoveSplit U            )
          , ("M-M1-l"                 , sendMessage $ MoveSplit R            )

          , ("M-s"                    , sendMessage   Swap                   )
          , ("M-M1-s"                 , sendMessage   Rotate                 )
          , ("M-n"                    , sendMessage   FocusParent            )
          , ("M-C-n"                  , sendMessage   SelectNode             )
          , ("M-S-n"                  , sendMessage   MoveNode               )
          , ("M-a"                    , sendMessage   Balance                )
          , ("M-S-a"                  , sendMessage   Equalize               )

          , ("M-g"                    , spawn "google-chrome-stable &"       )
          , ("M-m"                    , spawn "emacsclient -c -n"            )
          , ("M-S-z"                  , spawn "xscreensaver-command -lock"   )
          , ("M-C-4",      spawn "killall xcompmgr; sleep 1; xcompmgr -CfF &")
          ]
  myFadeHook = composeAll [isUnfocused --> transparency 0.2
                          ,                opaque
                          ]
  myLayout = bsp ||| full
    where
      bsp          = smartBorders emptyBSP
      full         = noBorders Full
