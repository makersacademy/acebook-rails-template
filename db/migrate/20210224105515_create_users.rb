class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :password_digest
      t.string :first_name, null: false
      t.string :last_name
      t.timestamps
    end
  end
end
