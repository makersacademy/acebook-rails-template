class AddKeysCommentsTable < ActiveRecord::Migration[5.1]
  def change
    change_table :comments do |t|
      t.belongs_to :post
      t.belongs_to :user
      t.string :body
    end
  end
end
