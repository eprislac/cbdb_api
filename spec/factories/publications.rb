FactoryBot.define do
  factory :publication do
    title { "MyString" }
    start_date { 1 }
    end_date { 1 }
    volume { 1 }
    publication_type { nil }
    publisher { nil }
  end
end
