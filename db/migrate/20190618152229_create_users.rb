class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      # g.string :name
      # g.string :email
      # g.string :password
      # g.string :confirm_password

      t.timestamps
    end
  end
end
