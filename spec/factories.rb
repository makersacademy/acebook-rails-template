FactoryBot.define do

  factory :user do
    email { "gollum@mistymountains.org" }
    password { "myprecious" }
    first_name { "Smeagol" }
    surname { "Who Knows..." }
    id { 1 }
  end

  factory :post do
    message { "Hello, World" }
    id { 4 }
    user_id { 1 }
  end

end
