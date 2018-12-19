class CreateBios < ActiveRecord::Migration[5.1]
  def change
    create_table :bios do |t|
      t.integer :age
      t.text :bio
      t.text :location

      t.timestamps
    end
  end
end
