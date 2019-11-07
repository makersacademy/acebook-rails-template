FactoryBot.define do
  factory :setting do
    user_id { nil }
    font { "MyString" }
    background_colour { "MyString" }
  end


  factory :user do
    id { "1" }
    username {"Example-Lizard"}
    email { "example@lizard.com" }
    password { "password" }
    full_name { "Example Lizard" }
    lizard_species { "toad" }
    birthday { "01/01/2019" }
    profile_picture { "http://www.google.com" }
  end

  factory :post do
    user
    content { "Hello, Earth!" }
  end
end
