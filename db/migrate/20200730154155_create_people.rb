# This class created a people table for the basic person to exist
class CreatePeople < ActiveRecord::Migration[5.1]
  def change
    create_table :people do |t|
      t.string :email
      t.string :password

      t.timestamps
    end
  end
end
