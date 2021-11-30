class ChangingDobToDate < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :dob, :date, using: 'dob::date'
  end
end
