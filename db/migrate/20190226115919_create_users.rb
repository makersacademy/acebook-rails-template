class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :pronoun
      t.string :password
      t.string :profile_pic_link
    end
  end
end
