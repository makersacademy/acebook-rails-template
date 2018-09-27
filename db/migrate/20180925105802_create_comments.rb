class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.references :users, foreign_key: true
      t.references :posts, foreign_key: true
      t.string :message

      t.timestamps
    end
  end
end
