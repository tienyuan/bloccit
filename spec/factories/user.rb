FactoryGirl.define do
  factory :user do
    name 'Douglas Adams'
    sequence(:email, 100) { |n| "person#{n}@example.com" }
    password "helloworld"
    password_confirmation "helloworld"
    confirmed_at Time.now
    
    factory :user_with_post_and_comment do
      after(:create) do |instance|
        create_list :post, 1, user: instance
        create_list :comment, 1, user: instance
      end
    end

  end
end