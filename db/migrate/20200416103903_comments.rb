class Comments < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.string :post_id
      t.integer :commentor_id
      t.string :content
      t.string :time
      end
  end
end
