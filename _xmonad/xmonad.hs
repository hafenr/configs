import XMonad
import XMonad.Config.Xfce
import XMonad.Hooks.ManageDocks

myManageHook = composeAll
    [ className =? "Do"                 --> doIgnore
    , className =? "Download"           --> doFloat
    ]

main = xmonad xfceConfig
            { modMask = mod4Mask
            , borderWidth = 3
            , terminal = "xfce4-terminal"
            , manageHook = manageHook xfceConfig <+> myManageHook
            }
