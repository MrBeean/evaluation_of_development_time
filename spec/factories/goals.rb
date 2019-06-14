FactoryBot.define do
  factory :goal do
    user
    title { "" }
    optimal_days { 1 }
    normal_days { 1 }
    pessimistic_days { 1 }
    expected_days { 1 }
    deviation_days { 1 }
  end
end
