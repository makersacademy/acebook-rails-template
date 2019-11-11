FactoryBot.define do
  factory :comment do
    
  end

  factory :user do
    email { 'person@person.com' }
    password { 'password' }
    id { 1 }
  end

  # factory :post do
  #   message { "Hello, world!" }
  #   id { 1 }
  #   user_id { 1 }
  # end

  # factory :comment do
  #   id { 1 }
  #   post_id { 1 }
  # end

# end
end
