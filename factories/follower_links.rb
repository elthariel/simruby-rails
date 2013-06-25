# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :follower_link do
    follower_id 1
    followee_id 1
  end
end
