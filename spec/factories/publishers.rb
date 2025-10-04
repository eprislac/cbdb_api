FactoryBot.define do
  factory :publisher, class: 'Publisher' do
    sequence(:name) { |n| "Publisher #{n}" }
  end
end
