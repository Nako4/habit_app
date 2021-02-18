FactoryBot.define do
  factory :article do
    title { 'AAAAA' }
    output { 'BBBBB' }
    action { 'CCCCC' }
    user_id { FactoryBot.create(:user).id }
  end
end
