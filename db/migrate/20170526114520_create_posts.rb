class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :message

      t.Time.now.strftime("%Y-%m-%d") 
    end
  end
end
