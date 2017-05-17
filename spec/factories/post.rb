FactoryGirl.define do
  factory :post, class: Post do
    uuid { Faker::Number.number(10) }
    author
    title { Faker::Lorem.sentence }
    body { Faker::Lorem.sentence }
  end
end
