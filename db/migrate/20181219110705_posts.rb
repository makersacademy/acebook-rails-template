class Posts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      ## Database authenticatable
      t.references :creator, foreign_key: { to_table: :users }, index: true           
      t.string :description, null: false, default: ""
      t.timestamps null: false
    end
  end
end
