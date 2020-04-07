class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email, null: false, unique: true
      t.string :password, limit: 10
    end
    # add_index :users, :email, unique: true
  end
end
