class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string :message, null: false
      t.references :post, null: false
      t.references :user, null: false
      t.timestamps
    end
  end
end
