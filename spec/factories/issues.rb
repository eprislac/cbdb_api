FactoryBot.define do
  factory :issue do
    number { 1 }
    legacy_number { 1 }
    cover_date { "2025-09-25 00:22:11" }
    publication { nil }
  end
end
