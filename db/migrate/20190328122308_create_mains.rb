class CreateMains < ActiveRecord::Migration[5.1]
  def change
    create_table :mains do |t|

      t.timestamps
    end
  end
end
