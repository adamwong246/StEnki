# This will guess the User class
FactoryGirl.define do
  factory :user do
    email    'user_eustice@email.com'
    password 'pa55w0rd'
  end

  # This will use the User class (Admin would have been guessed)
  factory :admin, class: User do
    email "AdminAdam"
  end
end