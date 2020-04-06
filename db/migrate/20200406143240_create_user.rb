class CreateUser < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :dob
      t.string :cob
      t.integer :mob
      t.string :email
    end
  end
end
