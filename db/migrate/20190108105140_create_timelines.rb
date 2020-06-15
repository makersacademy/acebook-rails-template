class CreateTimelines < ActiveRecord::Migration[5.1]
  def change
    create_table :timelines do |t|

      t.timestamps
    end
  end
end
