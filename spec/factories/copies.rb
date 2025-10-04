FactoryBot.define do
  factory :copy, class: 'Copy' do
    issue { nil }
    condition { nil }
    notes { "MyText" }
  end
end
