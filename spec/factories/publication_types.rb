FactoryBot.define do
  factory :publication_type, class: 'PublicationType' do
    sequence(:name) { |n| "Publication Type #{n}" }
  end
end
