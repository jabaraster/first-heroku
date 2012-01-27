module Handler.Root where

import Import
import Data.Int

data MemoForm = MemoForm {
  text :: Textarea
}

selectAllMemos = do
  selectList [] []

memoForm :: Html -> MForm Jabaraster Jabaraster (FormResult MemoForm, Widget)
memoForm = renderDivs $ MemoForm
  <$> areq textareaField "あたらしいメモ" Nothing

getRootR :: Handler RepHtml
getRootR = do
  ((_, widget), enctype) <- runFormPost memoForm
  memos <- runDB $ selectAllMemos
  defaultLayout $ do
    setTitle "first-heroku homepage"
    $(widgetFile "homepage")

postRootR :: Handler RepHtml
postRootR = do
  ((result, _), _) <- runFormPost memoForm
  case result of
    FormSuccess form -> do
      _ <- runDB $ insert Memo {
                            memoText = unTextarea $ text form
                          }
      redirect RedirectSeeOther RootR
    _  -> do
      redirect RedirectSeeOther RootR

fromKey :: Key backend entity -> Integer
fromKey key = case (fromPersistValue $ unKey key) :: Either String Int64 of
                       Left  s -> read s
                       Right i -> read $ show i
