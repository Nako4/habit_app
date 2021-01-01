require 'rails_helper'

RSpec.describe 'Habits', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @article = FactoryBot.build(:article)
  end

  context '習慣の達成記録ができるとき' do
    it '日付が指定の形式で入力されていれば記録できる' do
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
      # 新規投稿する
      visit new_article_path
      fill_in 'article_title', with: @article.title
      fill_in 'article_output', with: @article.output
      fill_in 'article_action', with: @article.action
      expect do
        find('input[name="commit"]').click
      end.to change { Article.count }.by(1)
      expect(current_path).to eq '/articles'
      # マイページのボタンがある
      expect(page).to have_content('マイページ')
      # マイページへ遷移する
      visit users_show_path(@user)
      # マイページで日付、チェックボックスを入力する
      fill_in 'date', with: Date.today
      check 'checked'
      # 登録！ボタンを押すとhabitsテーブルへデータが保存される
      expect do
        find('input[name="commit"]').click
      end.to change { Habit.count }.by(1)
      # マイページに遷移する
      # binding.pry
      expect(current_path).to eq users_show_path(@user)
      # カレンダーの日付部分に達成度が表示される
      expect(page).to have_content('100%')
    end
  end
  context '習慣の達成記録ができないとき' do
    it '日付が指定の形式で入力されていなければ記録できない' do
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
      # 新規投稿する
      visit new_article_path
      fill_in 'article_title', with: @article.title
      fill_in 'article_output', with: @article.output
      fill_in 'article_action', with: @article.action
      expect do
        find('input[name="commit"]').click
      end.to change { Article.count }.by(1)
      expect(current_path).to eq '/articles'
      # マイページのボタンがある
      expect(page).to have_content('マイページ')
      # マイページへ遷移する
      visit users_show_path(@user)
      # マイページで日付を、チェックボックスを入力する
      fill_in 'date', with: ''
      check 'checked'
      # 登録！ボタンを押す
      expect do
        find('input[name="commit"]').click
      end.to change { Habit.count }.by(0)
      # マイページへ遷移する
      visit users_show_path(@user)
      # カレンダーの日付部分に達成度が表示されていない
      expect(page).to have_no_content('100%')
    end
  end
end
