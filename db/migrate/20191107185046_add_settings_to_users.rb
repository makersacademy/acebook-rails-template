class AddSettingsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :font_family, :string
    add_column :users, :background_colour, :string
  end
end
