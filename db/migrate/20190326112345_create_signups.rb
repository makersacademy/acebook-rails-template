class CreateSignups < ActiveRecord::Migration[5.1]
  def change
    create_table :signups do |t|
      t.string :username
      t.string :password_digest
      t.string :email
    end
  end
end
