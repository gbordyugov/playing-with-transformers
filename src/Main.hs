module Main where

import Control.Monad.Trans.Except
import Control.Monad.Trans.Maybe
import Control.Monad.Trans.Reader

embedded :: MaybeT
            (ExceptT String
                     (ReaderT () IO))
            Int
embedded = return 1

unwrapMaybeT :: ExceptT String (ReaderT () IO) (Maybe Int)
unwrapMaybeT = runMaybeT embedded

main :: IO ()
main = do
  putStrLn "hello world"
