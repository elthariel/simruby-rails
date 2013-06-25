# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email                       { Faker::Internet.email }
    password                    'qweasdqweasd'
    password_confirmation       'qweasdqweasd'
    username                    { "#{Faker::Name.first_name.downcase}#{rand(9999)}" }
  end
end
