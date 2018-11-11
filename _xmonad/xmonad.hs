import XMonad
import XMonad.Config
import XMonad.Config.Desktop
import XMonad.Hooks.ManageDocks
import XMonad.Layout
import XMonad.Layout.NoBorders
import qualified Data.Map as M


keybindings :: XConfig Layout -> M.Map (KeyMask, KeySym) (X ())
keybindings conf@(XConfig {XMonad.modMask = modMask}) = updatedKeys
  where
      defaultKeys = keys desktopConfig $ conf
      removeKeys = [(modMask .|. shiftMask, xK_q), (modMask, xK_q)]
      updatedKeys = foldl (flip M.delete) defaultKeys removeKeys

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
       , keys = keybindings
       }

main = xmonad myConfig
