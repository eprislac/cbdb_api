FactoryBot.define do
  factory :cover, class: 'Cover' do
    variant { "MyString" }
    issue { nil }
    img_url { "MyString" }
  end
end
