require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー登録' do
    # 正常系
    context 'ユーザー登録がうまくいく時' do
      it 'ニックネーム、メールアドレス、パスワードがあれば登録できる' do
        expect(@user).to be_valid
      end
    end
    # 異常系
    context 'ユーザー登録ができない時' do
      it 'ニックネームがない時' do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'メールアドレスがない時' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'メールアドレスが重複する時' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end

      it 'パスワードがない時' do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank", "Password can't be blank", "Password is invalid")
      end

    end
  end
end
