# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :profile do
    avatar "MyString"
    background "MyString"
    user_id 1
    name "MyString"
    place "MyString"
    website "MyString"
    bio "MyString"
  end
end
