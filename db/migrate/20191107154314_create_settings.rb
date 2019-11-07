class CreateSettings < ActiveRecord::Migration[5.1]
  def change
    create_table :settings do |t|
      t.references :user, foreign_key: true
      t.string :font
      t.string :background_colour

      t.timestamps
    end
  end
end
