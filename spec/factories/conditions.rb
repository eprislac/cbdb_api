FactoryBot.define do
  factory :condition, class: 'Condition' do
    sequence(:name) { |n| "Condition #{n}" }
  end
end
