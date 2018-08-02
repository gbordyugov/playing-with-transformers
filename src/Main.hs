module Main where

import Control.Monad.Trans.Except
import Control.Monad.Trans.Maybe
import Control.Monad.Trans.Reader

embedded :: MaybeT
            (ExceptT String
                     (ReaderT () IO))
            Int
embedded = return 1
{-
the same as
embedded = MaybeT $ ExceptT $ ReaderT $ return <$>
  (const (Right (Just 1)))
-}

unwrapMaybeT :: ExceptT String (ReaderT () IO) (Maybe Int)
unwrapMaybeT = runMaybeT embedded

unwrapExceptT :: ReaderT () IO (Either String (Maybe Int))
unwrapExceptT = runExceptT unwrapMaybeT

unwrapReaderT :: () -> IO (Either String (Maybe Int))
unwrapReaderT = runReaderT unwrapExceptT

main :: IO ()
main = do
  putStrLn "hello world"
