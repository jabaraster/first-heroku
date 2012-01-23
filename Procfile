# Free deployment to Heroku.
#
#   !! Warning: You must use a 64 bit machine to compile !!
#
#   This could mean using a virtual machine. Give your VM as much memory as you can to speed up linking.
#
# Basic Yesod setup:
#
# * Move this file out of the deploy directory and into your root directory
#
#     mv deploy/Procfile ./
#
# * Create an empty package.json
#     echo '{ "name": "first-heroku", "version": "0.0.1", "dependencies": {} }' >> package.json
# 
# Postgresql Yesod setup:
#
# * add code to read DATABASE_URL environment variable.
# 
#   import System.Environment
#   main = do
#     durl <- getEnv "DATABASE_URL"
#     # parse env variable
#     # pass settings to withConnectionPool instead of directly using loadConnStr
#
# * add a dependency on the "heroku" package in your cabal file
#     
# * add code in Settings.hs to turn that url into connection parameters. The below works for Postgresql.
#
#     #ifdef !DEVELOPMENT
#     import qualified Web.Heroku
#     #endif
#
#     dbConnParams :: AppEnvironment -> IO [(Text, Text)]
#     #ifdef !DEVELOPMENT
#     dbConnParams _ = Web.Heroku.dbConnParams
#     #else
#     dbConnParams env = do
#       ...
#
#
# Heroku setup:
# Find the Heroku guide. Roughly:
#
# * sign up for a heroku account and register your ssh key
# * create a new application on the *cedar* stack
#
# * make your Yesod project the git repository for that application
# * create a deploy branch
#
#     git checkout -b deploy
#
# Repeat these steps to deploy:
# * add your web executable binary (referenced below) to the git repository
#
#     git checkout deploy
#     git add ./dist/build/first-heroku/first-heroku
#     git commit -m deploy
#
# * push to Heroku
#
#     git push heroku deploy:master


# Heroku configuration that runs your app
web: ./dist/build/first-heroku/first-heroku production -p $PORT
