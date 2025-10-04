FactoryBot.define do
  factory :by_line, class: 'ByLine' do
    sequence(:name) { |n| "ByLine #{n}" }
  end
end
