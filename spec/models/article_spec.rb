require 'rails_helper'

RSpec.describe Article, type: :model do
  before do
    @article = FactoryBot.build(:article)
  end

  describe '新規投稿' do
    # 正常系
    context '新規投稿がうまくいく時' do
      it 'タイトル,内容,行動があれば投稿できる' do
        expect(@article).to be_valid
      end
      it '行動がなくても投稿できる' do
        @article.action = nil
        expect(@article).to be_valid
      end
    end
    # 異常系
    context '新規登録ができない時' do
      it 'タイトルが無い時' do
        @article.title = nil
        @article.valid?
        expect(@article.errors.full_messages).to include("Title can't be blank")
      end

      it '投稿内容が無い時' do
        @article.output = nil
        @article.valid?
        expect(@article.errors.full_messages).to include("Output can't be blank")
      end

      it 'タイトルの文字が40文字を超えている時' do
        @article.title = "#{ "あ" * 41}"
        @article.valid?
        expect(@article.errors.full_messages).to include("Title is too long (maximum is 40 characters)")
      end

      it '投稿内容が400文字を超える時' do
      @article.output = "#{ "あ" * 401 }"
      @article.valid?
      expect(@article.errors.full_messages).to include("Output is too long (maximum is 400 characters)")
      end

    end
  end
end
