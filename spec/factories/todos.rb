FactoryBot.define do
  factory :todo do
    sequence(:body) { |n| "BODY#{n}" }
    sequence(:isDone) { |n| false }
  end
end
