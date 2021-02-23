FactoryBot.define do
  factory :habit do
    date { Faker::Date.in_date_period }
    achieve { 100 }
    user_id { FactoryBot.create(:user).id }
  end
end
