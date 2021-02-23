FactoryBot.define do
  factory :habit do
    date { 2021-02-22 }
    achieve { 100 }
    user_id {FactoryBot.create(:user).id}
  end
end
