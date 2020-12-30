require 'rails_helper'

RSpec.describe Habit, type: :model do
  before do
    @habit = FactoryBot.build(:habit)
    # binding.pry
  end
  describe '達成記録' do
  # 正常系
    context '達成記録ができるとき' do
      it '日付があれば記録できる' do
        expect(@habit).to be_valid
      end
      it 'チェックがないとき(achieveが0)に記録できる' do
        @habit.achieve = '0'
        expect(@habit).to be_valid
      end
    end
  #異常系
    context '達成記録ができないとき' do
      it '日付がないとき' do
        @habit.date = nil
        @habit.valid?
        expect(@habit.errors.full_messages).to include("Date can't be blank")
      end
      it '日付が特定の形式でないとき' do
        @habit.date = 11-11-11
        @habit.valid?
        expect(@habit.errors.full_messages).to include("Date is invalid")
      end
    end
  end
end
