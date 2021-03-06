# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name  { Faker::Name.name }
    email { Faker::Internet.email }

    pass = Faker::Lorem.characters(8)

    password { pass }
    password_confirmation { pass }
  end
end
