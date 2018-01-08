FactoryGirl.define do  
# This will guess the User class
  factory :user do
    name "Oscar Vazquez"
    email "oscar@gmail.com"
    password "password"
    password_confirmation "password" # ADDED THIS FIELD MANUALLY
  end

  # This will use the User class (Admin would have been guessed)
#   factory :admin, class: User do
#     first_name "Admin"
#     last_name  "User"
#     admin      true
#   end
end