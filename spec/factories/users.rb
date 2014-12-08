require 'faker'

FactoryGirl.define do 
  factory :user do |f| 
    email { Faker::Internet.email }
    f.password "testing123"
    f.password_confirmation "testing123"
  end 
end