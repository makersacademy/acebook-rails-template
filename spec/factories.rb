FactoryBot.define do

  factory :comment do
    
  end

  factory :user do
    email { 'person@person.com' }
    password { 'password' }
  end
end
