FactoryBot.define do
  factory :user do
    nickname { Faker::Name.initials(number: 2) }
    email { Faker::Internet.free_email }
    password {'123456abc'}
    # password { Faker::Internet.password(min_length: 7, max_length: 15) }
    # password { SecureRandom.urlsafe_base64}
    # password { SecureRandom.alphanumeric}
    password_confirmation { password }
  end
end
