require 'rails_helper'

RSpec.describe 'Articles', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @article = FactoryBot.build(:article)
  end

  context '記事の新規投稿ができる' do
    it '投稿フォームに必要情報が入力されていれば投稿できる' do
      # トップページに遷移する
      visit root_path
      # トップページにログインボタンがある
      expect(page).to have_content('ログイン')
      # ログイン画面へ遷移する
      visit new_user_session_path
      # ログインする
      fill_in 'Eメール', with: @user.email
      fill_in 'パスワード', with: @user.password
      find('input[name="commit"]').click
      expect(current_path).to eq root_path
      # 新規投稿ページへ移動する
      visit new_article_path
      # 新規投稿フォームに値を入力する
      fill_in 'article_title', with: @article.title
      fill_in 'article_tag_name', with: 'DD,EE'
      fill_in 'article_output', with: @article.output
      fill_in 'article_action', with: @article.action
      # 登録ボタンをクリックして、Article,Tag,中間テーブルの3つでレコードが増える
      expect do
        find('input[name="commit"]').click
      end
        .to change { Article.count }.by(1)
      change { Tag.count }.by(2)
      change { ArticleTagRelation.count }.by(2)
      # 記事投稿一覧ページへ遷移する
      expect(current_path).to eq '/articles'
    end
  end

  context '記事の新規投稿ができない' do
    it '投稿フォームに必要情報が入力されていれば投稿できる' do
      # トップページに遷移する
      visit root_path
      # トップページにログインボタンがある
      expect(page).to have_content('ログイン')
      # ログイン画面へ遷移する
      visit new_user_session_path
      # ログインする
      fill_in 'Eメール', with: @user.email
      fill_in 'パスワード', with: @user.password
      find('input[name="commit"]').click
      expect(current_path).to eq root_path
      # 新規投稿ページへ移動する
      visit new_article_path
      # 新規投稿フォームに値を入力する
      fill_in 'article_title', with: ''
      fill_in 'article_tag_name', with: ''
      fill_in 'article_output', with: ''
      fill_in 'article_action', with: ''
      # 登録ボタンをクリックして、Article,Tag,中間テーブルの3つでレコードが増えない
      expect do
        find('input[name="commit"]').click
      end
        .to change { Article.count }.by(0)
      change { Tag.count }.by(0)
      change { ArticleTagRelation.count }.by(0)
      # 記事投稿一覧ページへ遷移する
      expect(current_path).to eq '/articles'
    end
  end
end
