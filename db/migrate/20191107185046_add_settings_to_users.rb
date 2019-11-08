class AddSettingsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :font_family, :string, :default => 'LightIkaros'
    add_column :users, :background_colour, :string, :default => '#DEB887'
  end
end
