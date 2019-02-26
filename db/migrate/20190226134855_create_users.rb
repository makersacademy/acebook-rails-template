class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :pronoun, null: false
      t.string :email, null: false
      t.string :password, null: false
      t.string :profile_pic_link

      t.timestamps
    end
  end
end
