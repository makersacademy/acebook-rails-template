class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|

      t.text :body
      t.references :post, foreign_key: { to_table: :posts }, index: true
      t.references :commenter, foreign_key: { to_table: :users }, index: true

      t.timestamps
    end
  end

end
