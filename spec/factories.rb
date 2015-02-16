include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :user, aliases: [:developer] do
    email { Faker::Internet.email }
    password "12345678"
    password_confirmation "12345678"

    trait :admin do
      role true
    end

    factory :admin, traits: [:admin]
  end
end
