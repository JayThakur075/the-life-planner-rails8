FactoryBot.define do
  factory :session do
    ip_address { Faker::Internet.ip_v4_address }
    user_agent { Faker::Internet.user_agent }

    association :user
  end
end
