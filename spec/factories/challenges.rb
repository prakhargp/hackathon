FactoryBot.define do
  factory :challenge do
    title { "New task" }
    description { "This is a new task" }
    tag { "a" }
    employee
  end
end
