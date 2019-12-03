

class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } #Check this works please
      t.string :first
      t.string :last
      t.string :email
      t.string :password

      t.timestamps
    end
  end
end
