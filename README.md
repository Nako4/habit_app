# Habit App
## アプリケーション概要
Habit Appは日常の学びから習慣化することを手助けすることを目的としたwebアプリケーションです。</br>
自分が学んだこと、その学んだことから習慣化することを記事として投稿します。</br>
マイページから習慣化すると決めたことが達成できたか毎日記録することで、習慣化することを目指したものです。</br>


現段階では自分の投稿のみしか習慣記録をつけることができませんが、他人の投稿から自分も習慣化したいものを取り込める機能の実装、習慣の項目ごとでの記録、達成状況の確認ができる機能の実装を行っていく予定です。</br>

## 目指した問題解決
本やYouTube、日常生活から学ぶことはたくさんあり、気づいたときには学んだことを忘れてしまっていたり、実生活に役立てられていないことに気づきました。</br>
人があることを習慣化するまでには、早くても20日、内容の難易度によっては60日以上かかることがわかっています。</br>
そこで以下のような学びをアウトプットする機能と習慣化を手助けするアプリを開発しようと思いました。</br>
・学びのアウトプットと学びから実生活（毎日の習慣）に落とし込むことを考える</br>
・その習慣が毎日達成できているか記録する</br>
・他の人の学びを見て自分も学ぶ</br>
・毎日記録するのが楽しくなる</br>

## URL
https://habit-record.herokuapp.com/

## テスト用アカウント
ゲストログインでも機能確認できます。</br>
ログインアカウント1</br>
メールアドレス：　000@000</br>
パスワード:　123456a</br>
ログインアカウント2</br>
メールアドレス：　111@111</br>
パスワード：　123456a</br>

## 利用方法、機能特徴
1.ログインする</br>
[ログイン](https://user-images.githubusercontent.com/69072413/103877770-dafcd600-5118-11eb-8d50-b99b20b4989a.png)
2.学び、習慣化したいことを投稿する</br>
[投稿ページへ](https://user-images.githubusercontent.com/69072413/103877728-ccaeba00-5118-11eb-995a-9ee3cb808c80.png)
[新規投稿](https://user-images.githubusercontent.com/69072413/103877749-d3d5c800-5118-11eb-9272-57bfc5553970.png)
3.マイページに行く</br>
[投稿完了からマイページへ](https://user-images.githubusercontent.com/69072413/103877800-e4863e00-5118-11eb-8728-208c197cbd75.png)
4.習慣を達成できたか記録する</br>
[習慣記録フォームを入力](https://user-images.githubusercontent.com/69072413/103877800-e4863e00-5118-11eb-8728-208c197cbd75.png)
[記録後の画面](https://user-images.githubusercontent.com/69072413/103877844-f536b400-5118-11eb-8be2-3a9cd9343255.png)

## 要件定義
### トップページ
【ボタン】</br>
・未ログイン時、新規登録/ログインページへ遷移するためのボタン</br>
・ログイン時、新規投稿/マイページ/ログアウトするためのボタン</br>
・投稿記事の詳細ページへ遷移するためのボタン</br>
・同じタグの記事を一覧表示するためのボタン</br>
・トップページへ遷移するためのボタン</br>
・キーワード検索ボタン</br>
【表示】</br>
・投稿された記事を一覧で見ることができる</br>
（投稿者のアカウント名、投稿のタイトル、タグ）</br>
・キーワード検索フォーム</br>
### 新規登録ページ
【ボタン】</br>
・登録ボタン</br>
・新規登録ページ/トップページ/ログインページへ遷移するためのボタン</br>
【表示】</br>
・登録情報のフォーム</br>
・登録失敗時のエラーメッセージ</br>
### ログインページ
【ボタン】</br>
・ログインボタン</br>
・新規登録ページ/トップページ/ログインページへ遷移するためのボタン</br>
【表示】</br>
・ログインフォーム</br>
・ログイン失敗時のエラーメッセージ</br>
### 投稿ページ
【ボタン】</br>
・新規投稿ボタン</br>
【表示】</br>
・新規投稿のフォーム</br>
### 投稿詳細ページ
【ボタン】</br>
共通</br>
・タグの検索結果を一覧表示するためのボタン</br>
未ログイン時</br>
・ログイン/新規登録ページへ遷移するためのボタン</br>
ログイン時</br>
・ログアウト/新規投稿/マイページへ遷移するためのボタン</br>
・投稿記事の編集ページへ遷移するためのボタン</br>
・投稿記事を削除するためのボタン</br>
【表示】</br>
・投稿した記事のタイトル/内容/習慣化すること</br>
### 投稿編集ページ</br>
【ボタン】</br>
・ログアウト/新規投稿/マイページへ遷移するためのボタン</br>
・更新ボタン</br>
【表示】</br>
・投稿した記事のタイトル/タグ/学んだ内容/習慣化することが入力された投稿フォーム</br>
### マイページ</br>
【ボタン】</br>
・ログアウト/新規投稿/マイページへ遷移するためのボタン</br>
・日付を入力するためのボタン</br>
・達成度登録ボタン</br>
・自分の投稿記事の詳細ページへ遷移するボタン</br>
【表示】</br>
・習慣化することとその項目に対応するチェックボックス</br>
・チェックされた項目によって非同期で変化する達成度(%)</br>
・日付入力フォーム</br>
・達成度に応じて日付のパネルの色が変化する</br>
・今日の日付のパネルは黄色表示</br>
## DB設計
### articlesテーブル
|column |type   |option     |
|-------|-------|-----------|
|title  |string |null: false|
|output |text   |null: false|
|action |string |           |
|user_id|integer|null: false|
#### Association
has_one :habit</br>
belongs_to :user</br>

### tagsテーブル
|column  |type   |option          |
|--------|-------|----------------|
|tag_name|string |uniqueness: true|

### article_tag_relationsテーブル
|column |type      |option           |
|-------|----------|-----------------|
|article|references|foreign_key: true|
|tag    |references|foreign_key: true|
#### Association
has_many :articles, through: :article_tag_relations</br>
has_many :article_tag_relations, dependent: :destroy</br>

### usersテーブル
|column            |type  |option     |
|------------------|------|-----------|
|nickname          |string|null: false|
|email             |string|null: false|
|encrypted_password|string|null: false|
#### Asociation
has_many :articles</br>
has_many :habit</br>

### habitsテーブル
|column |type   |option           |
|-------|-------|-----------------|
|user_id|integer|foreign_key: true|
|date   |date   |null: false      |
|achieve|integer|                 |
#### Association
belongs_to :user</br>


### ER図
[ER図](https://user-images.githubusercontent.com/69072413/103701612-ac341200-4fe9-11eb-8a94-b3923a4018d0.png)

## ローカルでの動作方法
### バージョン情報
・Ruby 2.6.5</br>
・Ruby on Rails 6.0.0</br>
・jquery 3.5.1</br>





