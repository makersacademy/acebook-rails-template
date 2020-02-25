class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :email
      t.string :full_name
      t.string :lizard_species
      t.date :birthday
      t.string :profile_picture
      t.timestamps
    end
  end
end
