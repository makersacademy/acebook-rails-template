FactoryBot.define do
 factory :user do
   email                 {"mbrown@yahoo.com"}
   password              {"foobar"}
   confirmed_at          {Time.now}
 end
end
