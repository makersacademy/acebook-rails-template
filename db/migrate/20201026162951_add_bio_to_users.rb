class AddBioToUsers < ActiveRecord::Migration[5.1]
  def change
    change_table :users do |t|
      t.text   :bio 
     end
  end
end
