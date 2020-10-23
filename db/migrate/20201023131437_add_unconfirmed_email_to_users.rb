class AddUnconfirmedEmailToUsers < ActiveRecord::Migration[5.1]
  def change
    change_table :users do |t|

       t.string   :unconfirmed_email # Only if using reconfirmable
  
      end
  end
end
