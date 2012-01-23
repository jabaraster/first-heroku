module Paths_first_heroku (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName
  ) where

import Data.Version (Version(..))
import System.Environment (getEnv)

version :: Version
version = Version {versionBranch = [0,0,0], versionTags = []}

bindir, libdir, datadir, libexecdir :: FilePath

bindir     = "/home/jabaraster/.cabal/bin"
libdir     = "/home/jabaraster/.cabal/lib/first-heroku-0.0.0/ghc-7.0.4"
datadir    = "/home/jabaraster/.cabal/share/first-heroku-0.0.0"
libexecdir = "/home/jabaraster/.cabal/libexec"

getBinDir, getLibDir, getDataDir, getLibexecDir :: IO FilePath
getBinDir = catch (getEnv "first_heroku_bindir") (\_ -> return bindir)
getLibDir = catch (getEnv "first_heroku_libdir") (\_ -> return libdir)
getDataDir = catch (getEnv "first_heroku_datadir") (\_ -> return datadir)
getLibexecDir = catch (getEnv "first_heroku_libexecdir") (\_ -> return libexecdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
