FactoryBot.define do
    factory :employee do
        email {"pk@test.com"}
        password { "123456" }
    end
end