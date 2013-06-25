# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :page do
    title { Faker::Lorem.sentence }
    # slug "MyString" Should be generated from title
    content "h1. Default Page title

h2. Use textile format here!

#{Faker::Lorem.paragraph}"
  end
end
