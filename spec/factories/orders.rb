FactoryBot.define do
  factory :order do
    num { "MyString" }
    recipient { "MyString" }
    tel { "MyString" }
    address { "MyString" }
    note { "MyText" }
    user { nil }
    state { "MyString" }
    paid_at { "2021-05-25 11:16:17" }
    transaction_id { "MyString" }
  end
end
