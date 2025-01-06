{-# LANGUAGE LambdaCase #-}

module Src.Hooks.LayoutHook.DockHandler where

import           Control.Monad                (when)
import           Data.List                    (isInfixOf)

import           XMonad
import           XMonad.Layout.LayoutModifier
import           XMonad.StackSet

import           Src.Common.Apps.CairoDock    (CairoDock (..))
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

useDock :: LayoutClass l a => l a -> ModifiedLayout DockHandler l a
useDock = ModifiedLayout . DockHandler $ initialVisibility
  where
    initialVisibility :: DockVisibility
    initialVisibility = DockHidden

data DockVisibility = DockHidden | DockActive  deriving (Show, Read, Eq)

dockVisibility :: a -> a -> DockVisibility -> a
dockVisibility whenHidden whenActive = \case
    DockHidden -> whenHidden
    DockActive -> whenActive

newtype DockHandler a = DockHandler DockVisibility deriving (Show, Read)

instance Message DockVisibility

instance LayoutModifier DockHandler a where
    -- Called when workspace is changed
    unhook :: DockHandler a -> X ()
    unhook (DockHandler visibility) = do
        whenDockVisibilityChanged visibility (const handleLayout)
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
        unpureModifier (DockHandler visibility) = do
            newVisibility <- whenDockVisibilityChanged visibility (\newVisibility -> do
                handleLayout
                sendMessage newVisibility
                )
            pure . DockHandler $ newVisibility

    -- "Mess" is an abbreviation of "message"
    pureMess :: DockHandler a -> SomeMessage -> Maybe (DockHandler a)
    pureMess m someMessage = DockHandler <$> maybeMessage
      where
        maybeMessage :: Maybe DockVisibility
        maybeMessage = fromMessage someMessage

-- | Do something iff state is changed
whenDockVisibilityChanged
    :: DockVisibility
    -> (DockVisibility -> X ())
    -> X DockVisibility
whenDockVisibilityChanged visibility f = do
      newVisibility <- getDockVisibility
      when (newVisibility /= visibility) (f newVisibility)
      pure newVisibility

handleLayout :: X ()
handleLayout = handleDock

handleDock :: X ()
handleDock = do
    visibility <- getDockVisibility
    spawn $ dockVisibility whenHidden whenActive visibility
  where
    whenHidden :: String
    whenHidden = appKill CairoDock

    whenActive :: String
    whenActive = appRestart CairoDock

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
