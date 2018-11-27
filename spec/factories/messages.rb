FactoryBot.define do
  factory :message do
    body { 'MyText' }
    user
    chat_room
  end
end
