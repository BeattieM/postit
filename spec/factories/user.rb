FactoryGirl.define do
  factory :user, aliases: [:author], class: User do
    email { Faker::Internet.email }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    password { Faker::Internet.password(6) }
  end
end
