require 'rails_helper'

# RSpec.describe "Users", type: :system do
#   before do
#     @user = FactoryBot.build(:user)
#   end

#   context ' ユーザー新規登録ができるとき' do
#     it '正しい情報を入力すれば、ユーザー新規登録ができてトップページへ移動する' do
#     # トップページへ移動する
#     visit root_path
#     # 新規登録ページへ遷移するボタンがある
#     expect(page).to have_content('新規登録')
#     # 新規登録ページへ遷移する
#     visit new_user_registration_path
#     # ユーザー情報を入力する
#     fill_in 'Nickname', with: @user.nickname
#     fill_in 'Eメール', with: @user.email
#     fill_in 'パスワード', with: @user.password
#     fill_in 'パスワード（確認用）', with: @user.password_confirmation
#     # 登録ボタンを押すとusersテーブルへデータが保存される
#     expect {
#       find('input[name="commit"]').click
#     }.to change { User.count }.by(1)
#     # トップページへ遷移する
#     expect(current_path).to eq root_path
#     # ログアウト、新規投稿、マイページボタンが表示されている
#     expect(page).to have_content('ログアウト')
#     expect(page).to have_content('新規投稿')
#     expect(page).to have_content('マイページ')
#     # 新規登録、ログインボタンが表示されていない
#     expect(page).to have_no_content('ログイン')
#     expect(page).to have_no_content('新規登録')
#     end
#   end

#   context 'ユーザー新規登録ができないとき' do
#     it '誤った情報ではユーザー新規登録ができずに新規登録ページへ戻ってくる' do
#       # トップページへ移動する
#       visit root_path
#       # 新規登録ページへ移動するボタンがある
#       expect(page).to have_content('新規登録')
#       # 新規登録ボタンへ遷移する
#       visit new_user_registration_path
#       # ユーザー情報を入力する
#       fill_in 'Nickname', with: ""
#       fill_in 'Eメール', with: ""
#       fill_in 'パスワード', with: ""
#       fill_in 'パスワード（確認用）', with: ""
#       # 登録ボタンを押してもusersテーブルでデータが保存されない
#       expect {
#         find('input[name="commit"]').click
#       }.to change { User.count }.by(0)
#       # 新規登録ページへ遷移する
#       expect(current_path).to eq "/users"
#     end
#   end
# end

RSpec.describe 'ログイン', type: :system do
  before do
    @user = FactoryBot.create(:user)
  end
  context 'ログインできるとき' do
    it '保存されているユーザー情報と合致すればログインができる' do
      #トップページに遷移する
      visit root_path
      #トップページにログインページへ遷移するボタンがある
      expect(page).to have_content('ログイン')
      #ログインページに遷移する
      visit new_user_session_path
      #Eメールとパスワードを入力する
      fill_in 'Eメール', with: @user.email
      fill_in 'パスワード', with: @user.password
      #ログインボタンをクリックする
      find('input[name="commit"]').click
      #一覧ページへ遷移する
      expect(current_path).to eq root_path
      #ログアウト、新規投稿、マイページボタンがある
      expect(page).to have_content('ログアウト')
      expect(page).to have_content('新規投稿')
      expect(page).to have_content('マイページ')
      #ログイン、新規登録ボタンが表示されていない
      expect(page).to have_no_content('ログイン')
      expect(page).to have_no_content('新規登録')
    end
  end
  context 'ログインできないとき' do
    it '保存されているユーザー情報と合致しないとログインができない ' do
      #トップページに遷移する
      visit root_path
      #トップページにログインページへ遷移するボタンがある
      expect(page).to have_content('ログイン')
      #ログインページに遷移する
      visit new_user_session_path
      #ユーザー情報を入力する
      fill_in 'Eメール', with: ""
      fill_in 'パスワード', with: ""
      #ログインボタンを押す
      find('input[name="commit"]').click
      #ログインページへ戻される
      expect(current_path).to eq new_user_session_path
    end
  end
end