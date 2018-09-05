class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :avatar, :default => 'https://www.lewesac.co.uk/wp-content/uploads/2017/12/default-avatar.jpg'

      t.timestamps
    end
    add_index :users, :name, unique: true
  end
end
