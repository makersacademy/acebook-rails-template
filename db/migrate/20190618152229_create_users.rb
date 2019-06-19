class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |g|
      g.string :name
      g.string :email
      g.string :password
      g.string :confirm_password

      g.timestamps
    end
  end
end
