class DropUsers < ActiveRecord::Migration[5.1]
  def change
    drop_table :users do |t|
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.string "name"
      t.string "email"
      t.string "password_digest"
    end
  end
end
