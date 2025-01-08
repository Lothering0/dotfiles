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
    => DockHandlers
    -> l a
    -> ModifiedLayout Dock l a
useDock handlers = ModifiedLayout . Dock handlers $ initialVisibility
  where
    initialVisibility :: DockVisibility
    initialVisibility = DockHidden

data DockHandlers = DockHandlers
    { onHide   :: !(X ())
    , onActive :: !(X ())
    }

data DockVisibility = DockHidden | DockActive deriving (Show, Read, Eq)

instance Message DockVisibility

dockVisibility :: a -> a -> DockVisibility -> a
dockVisibility whenHidden whenActive = \case
    DockHidden -> whenHidden
    DockActive -> whenActive

data Dock a = Dock DockHandlers DockVisibility

instance Show (Dock a) where
    show _ = "DockHandler"

instance Read (Dock a) where
    readsPrec _ _ = [(Dock (DockHandlers { onHide = x, onActive = x }) DockHidden, "")]
      where
        x :: X ()
        x = pure ()

instance LayoutModifier Dock a where
    -- Called when workspace is changed
    unhook :: Dock a -> X ()
    unhook m = do
        whenDockVisibilityChanged m handleLayout
        pure ()

    -- Called /after/ layout is changed
    redoLayout
        :: Dock a            -- ^ the layout modifier
        -> Rectangle         -- ^ screen rectangle
        -> Maybe (Stack a)   -- ^ current window stack
        -> [(a, Rectangle)]  -- ^ (window,rectangle) pairs returned by the underlying layout
        -> X ([(a, Rectangle)], Maybe (Dock a))
    redoLayout m r ms wrs = do
        hook m
        modifiedM <- unpureModifier m
        pure $ pureModifier modifiedM r ms wrs
      where
        unpureModifier :: Dock a -> X (Dock a)
        unpureModifier m = whenDockVisibilityChanged m onVisibilityChanged

        onVisibilityChanged :: Dock a -> X ()
        onVisibilityChanged dockHandler@(Dock _ newVisibility) = do
            handleLayout dockHandler
            sendMessage  newVisibility

    -- "Mess" is an abbreviation of "message"
    pureMess :: Dock a -> SomeMessage -> Maybe (Dock a)
    pureMess (Dock handlers _) someMessage = Dock handlers <$> maybeMessage
      where
        maybeMessage :: Maybe DockVisibility
        maybeMessage = fromMessage someMessage

-- | Do something iff state is changed
whenDockVisibilityChanged
    :: Dock a
    -> (Dock a -> X ())
    -> X (Dock a)
whenDockVisibilityChanged (Dock handlers visibility) f = do
      newVisibility <- getDockVisibility
      when (newVisibility /= visibility) (f . Dock handlers $ newVisibility)
      pure . Dock handlers $ newVisibility

handleLayout :: Dock a -> X ()
handleLayout = handleDock

handleDock :: Dock a -> X ()
handleDock (Dock (DockHandlers {onHide, onActive}) _) = do
    visibility <- getDockVisibility
    dockVisibility onHide onActive visibility

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
