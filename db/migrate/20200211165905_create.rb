# class CreateFriends < ActiveRecord::Migration[5.1]
#   def change
#     create_table :friends do |t|
#       t.references :friend_id, references: :users
#       t.references :recipient_friend_id, references: :users
#       t.boolean :confirmed_status, null: false, default: false  

#     end
#   end
# end
