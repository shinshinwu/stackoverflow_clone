
FactoryGirl.define do

  factory :question do
    # sequence(:name) {|n| "name #{n}"} create unique record
    title { Faker::Company.name }
    content { Faker::Lorem.words }
  end

  factory :answer do
    association :question
    title { Faker::Company.catch_phrase }
    content { Faker::Company.bs }
  end
end