FactoryBot.define do
  factory :todo do
    sequence(:body) { |n| "BODY#{n}" }
    sequence(:is_done) { |n| 'false' }
  end
end
