FactoryBot.define do
  factory :habit do
    user_id { FactoryBot.create(:user).id }
    date { '2020-11-11' }
    achieve { '50' }
  end
end
