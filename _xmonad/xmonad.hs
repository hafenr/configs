import XMonad
import XMonad.Config.Desktop
import XMonad.Hooks.ManageDocks
import XMonad.Layout
import XMonad.Layout.NoBorders

myManageHook = composeAll
    [ className =? "Do"                 --> doIgnore
    , className =? "Download"           --> doFloat
    ]

myLayoutHook = tiled ||| Mirror tiled ||| noBorders Full
  where
     -- default tiling algorithm partitions the screen into two panes
     tiled   = Tall nmaster delta ratio
     -- The default number of windows in the master pane
     nmaster = 1
     -- Default proportion of screen occupied by master pane
     ratio   = 1/2
     -- Percent of screen to increment by when resizing panes
     delta   = 3/100

myConfig = desktopConfig
       { modMask = mod4Mask
       , borderWidth = 3
       , terminal = "xfce4-terminal"
       , manageHook = manageHook desktopConfig <+> myManageHook
       , layoutHook = desktopLayoutModifiers $ myLayoutHook
       }

main = xmonad myConfig
