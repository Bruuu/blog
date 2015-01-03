FactoryGirl.define do
  factory :post do
    title "First"
    content "Lorem upsum"
    status 1
    published_at { Time.current }
    sequence :slug do |n|
      "slug#{n}"
    end
    trait :draft do
      status 0
    end
  end
end
