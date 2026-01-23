FactoryBot.define do
  factory :task do
    name        { Faker::Lorem.sentence(word_count: 3) }
    description { Faker::Lorem.paragraph }
    status      { "in_progress" }

    association :group

    trait :completed do
      status { "completed" }
    end

    trait :archived do
      status { "archived" }
    end
  end
end
