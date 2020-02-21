class CreateSessions < ActiveRecord::Migration[5.1]
  def change
    create_table :sessions do |t|
      t.timestamp :logged_out
      t.timestamps
    end
  end
end
