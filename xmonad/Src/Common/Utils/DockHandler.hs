{-# LANGUAGE LambdaCase #-}

module Src.Common.Utils.DockHandler where

import           Control.Monad                (when)
import           Data.List                    (isInfixOf)

import           XMonad
import           XMonad.Layout.LayoutModifier
import           XMonad.StackSet

import           Src.Common.Utils.App         (App (..))
import           Src.Common.Utils.Xmonad      (getLayoutDescription,
                                               getLayoutWindows)


-- Can be useful:
--
-- About @LayoutModifier@ and all its methods:
-- https://hackage.haskell.org/package/xmonad-contrib-0.18.1/docs/src/XMonad.Layout.LayoutModifier.html
--
-- About @LayoutClass@:
-- https://hackage.haskell.org/package/xmonad-0.18.0/docs/src/XMonad.Core.html#LayoutClass
--
-- About mutable state of layout modifier:
-- https://wiki.haskell.org/Xmonad/Mutable_state_in_contrib_modules_or_xmonad.hs

useDock
    :: LayoutClass l a
    => OnDockHide
    -> OnDockActive
    -> l a
    -> ModifiedLayout DockHandler l a
useDock a b = ModifiedLayout . DockHandler a b $ initialVisibility
  where
    initialVisibility :: DockVisibility
    initialVisibility = DockHidden

newtype OnDockHide   = OnDockHide   (X ())
newtype OnDockActive = OnDockActive (X ())

data DockVisibility = DockHidden | DockActive deriving (Show, Read, Eq)

instance Message DockVisibility

dockVisibility :: a -> a -> DockVisibility -> a
dockVisibility whenHidden whenActive = \case
    DockHidden -> whenHidden
    DockActive -> whenActive

data DockHandler a = DockHandler OnDockHide OnDockActive DockVisibility

instance Show (DockHandler a) where
    show _ = "DockHandler"

instance Read (DockHandler a) where
    readsPrec _ _ = [(DockHandler (OnDockHide x) (OnDockActive x) DockHidden, "")]
      where
        x :: X ()
        x = pure ()

instance LayoutModifier DockHandler a where
    -- Called when workspace is changed
    unhook :: DockHandler a -> X ()
    unhook m = do
        whenDockVisibilityChanged m handleLayout
        pure ()

    -- Called /after/ layout is changed
    redoLayout
        :: DockHandler a     -- ^ the layout modifier
        -> Rectangle         -- ^ screen rectangle
        -> Maybe (Stack a)   -- ^ current window stack
        -> [(a, Rectangle)]  -- ^ (window,rectangle) pairs returned by the underlying layout
        -> X ([(a, Rectangle)], Maybe (DockHandler a))
    redoLayout m r ms wrs = do
        hook m
        modifiedM <- unpureModifier m
        pure $ pureModifier modifiedM r ms wrs
      where
        unpureModifier :: DockHandler a -> X (DockHandler a)
        unpureModifier m = whenDockVisibilityChanged m onVisibilityChanged

        onVisibilityChanged :: DockHandler a -> X ()
        onVisibilityChanged dockHandler@(DockHandler _ _ newVisibility) = do
            handleLayout dockHandler
            sendMessage  newVisibility

    -- "Mess" is an abbreviation of "message"
    pureMess :: DockHandler a -> SomeMessage -> Maybe (DockHandler a)
    pureMess (DockHandler a b _) someMessage = DockHandler a b <$> maybeMessage
      where
        maybeMessage :: Maybe DockVisibility
        maybeMessage = fromMessage someMessage

-- | Do something iff state is changed
whenDockVisibilityChanged
    :: DockHandler a
    -> (DockHandler a -> X ())
    -> X (DockHandler a)
whenDockVisibilityChanged (DockHandler a b visibility) f = do
      newVisibility <- getDockVisibility
      when (newVisibility /= visibility) (f . DockHandler a b $ newVisibility)
      pure . DockHandler a b $ newVisibility

handleLayout :: DockHandler a -> X ()
handleLayout = handleDock

handleDock :: DockHandler a -> X ()
handleDock (DockHandler (OnDockHide whenHidden) (OnDockActive whenActive) _) = do
    visibility <- getDockVisibility
    dockVisibility whenHidden whenActive visibility

getDockVisibility :: X DockVisibility
getDockVisibility = do
    layoutDescription <- getLayoutDescription
    determineDockVisibility layoutDescription <$> getLayoutWindows

-- | Determines should dock be visibile or hidden
determineDockVisibility :: String -> [Window] -> DockVisibility
determineDockVisibility layoutDescription layoutWindows
    | windowsCount == 0 = DockActive
    | isLayoutFull      = DockHidden
    | windowsCount > 1  = DockActive
    | otherwise         = DockHidden
  where
    isLayoutFull :: Bool
    isLayoutFull = "Full" `isInfixOf` layoutDescription

    windowsCount :: Int
    windowsCount = length layoutWindows
