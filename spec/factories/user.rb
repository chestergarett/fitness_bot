FactoryBot.define do
  factory :user do
    sequence(:email){ |n| "test#{n}@email.com"}
    password { "testing" }
    url { "https://test.com" }
    avatar_url { "https://test.com/avatar" }
    provider { "github" }
  end
end