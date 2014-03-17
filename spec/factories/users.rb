FactoryGirl.define do
  factory :user do
    name 'Jack'
    sequence(:email) { |n| "email#{n}@gmail.com" }
    password 'pw'
  end
end
