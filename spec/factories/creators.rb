FactoryBot.define do
  factory :creator, class: 'Creator' do
    sequence(:last_name) { |n| "LastName#{n}" }
    sequence(:first_name) { |n| "FirstName#{n}" }
  end
end
