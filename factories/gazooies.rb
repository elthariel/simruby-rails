# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :gazooy do
    user_id 1
    text "MyString"
    reply_to_id 1
  end
end
