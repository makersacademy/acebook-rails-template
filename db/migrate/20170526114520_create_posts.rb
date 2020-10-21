class CreatePosts < ActiveRecord::Migration[5.1]

  def change
    create_table :posts do |t|
      t.string :message
<<<<<<< HEAD
    
=======
>>>>>>> e4445b122def18e30507ffa56faddf5f6f743349
      t.timestamps
    end
  end
end
