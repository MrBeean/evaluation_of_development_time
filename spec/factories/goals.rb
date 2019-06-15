FactoryBot.define do
  factory :goal do
    user
    title { Faker::Book.title }
    optimal_days { Faker::Number.decimal(2, 1) }
    normal_days { Faker::Number.decimal(2, 1) }
    pessimistic_days { Faker::Number.decimal(2, 1) }
    expected_days { Faker::Number.decimal(2, 1) }
    deviation_days { Faker::Number.decimal(2, 1) }

    factory :visible_goal do
      visibility { true }
    end

    factory :invisible_goal do
      visibility { false }
    end
  end
end
