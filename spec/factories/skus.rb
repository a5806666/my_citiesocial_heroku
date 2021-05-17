FactoryBot.define do
  factory :sku do
    product { nil }
    spec { "MyString" }
    quantity { 1 }
    deleted_at { "2021-05-17 18:22:03" }
  end
end
