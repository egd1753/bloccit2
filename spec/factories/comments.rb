FactoryGirl.define do
  pw = RandomData.random_sentence

  factory :comment do
    name RandomData.random_name
# #4
    sequence(:email){|n| "user#{n}@factory.com" }
    password pw
    password_confirmation pw
    role :member
  end
end
