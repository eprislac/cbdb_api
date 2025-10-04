FactoryBot.define do
  factory :user, class: 'User' do
    sequence(:name) { |n| "User #{n}" }
    sequence(:email) { |n| "user#{n}@example.com" }
  end
end
