FactoryBot.define do
  factory :employee do
    email { "pk@test.com" }
    password { "123456" }
    emp { "E90" }
    fname { "test" }
    lname { "user" }
  end
end
