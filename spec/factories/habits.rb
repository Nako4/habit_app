FactoryBot.define do
  factory :habit do
    date { Faker::date.backward }
    achieve { 100 }
    user_id { FactoryBot.create(:user).id }
  end
end
