class Images < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.text :caption
      t.bigint :user_id
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
      t.index [:user_id], name: :index_images_on_user_id
    end
  end
end
