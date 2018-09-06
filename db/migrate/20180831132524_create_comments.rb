class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string :user_name
      t.text :body
      t.references :post, foreign_key: { on_delete: :cascade }

      t.timestamps
    end
  end
end
