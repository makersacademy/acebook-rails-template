class CreateLikes < ActiveRecord::Migration[5.1]
  def change
    create_table :likes do |t|
      t.string :user_name
      t.references :post, foreign_key: { on_delete: :cascade }

      t.timestamps
    end
  end
end
