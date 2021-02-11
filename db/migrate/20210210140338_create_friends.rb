class CreateFriends < ActiveRecord::Migration[5.1]
  def change
    create_table :friends do |t|
      t.references :requester, foreign_key: { to_table: :users }, index: true
      t.references :receiver, foreign_key: { to_table: :users }, index: true
      t.string :status, default: "Pending"
    end
  end
end
