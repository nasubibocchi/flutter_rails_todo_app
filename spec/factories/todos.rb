FactoryBot.define do
  factory :todo do
    sequence(:body) { "BODY#{n}" }
    sequence(:isDone) { "ISDONE#{n}" }
  end
end
