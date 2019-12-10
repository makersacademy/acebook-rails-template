FactoryBot.define do
  factory :comment do
    
  end


  factory :user do
    email { "gollum@mistymountains.org" }
    password { "myprecious" }
    first_name { "Smeagol" }
    surname { "Who Knows..." }
  end

end
